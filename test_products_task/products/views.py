import time
from collections import OrderedDict
import datetime
from datetime import timedelta

from braces.views import JSONResponseMixin, AjaxResponseMixin
from django.conf import settings
from django.contrib import messages
from django.db.models import Sum, Case, When, IntegerField, Count, F, Q
from django.db.models.functions import Coalesce
from django.http import Http404
from django.shortcuts import redirect
from django.urls import reverse_lazy, reverse
from django.utils import timezone
from django.utils.translation import ugettext_lazy as _
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, DetailView, FormView, TemplateView, CreateView
from django.core.paginator import Paginator
from test_products_task.common.mixins import ActiveTabMixin
from test_products_task.common.utils import get_ip_from_request
from test_products_task.products.forms import LikeForm
from test_products_task.products.models import Category, Product, Like, Comment
from ..common.utils import get_ip_from_request


class CategoryListView(ActiveTabMixin, ListView):
    model = Category
    active_tab = 'category_list'

    def get_ordered_grade_info(self):
        return []

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['grade_info'] = self.get_ordered_grade_info()
        return context


class CategoryDetailView(DetailView):
    model = Category
    slug_url_kwarg = 'category_slug'
    PARAM_FOLLOWING = 'following'
    PARAM_PRICE_FROM = 'price_from'
    PARAM_PRICE_TO = 'price_to'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        products = self.get_related_products()
        context['related_products'] = products
        context['page_obj'] = products
        return context

    def get_related_products(self):
        queryset = self.object.products.all()
        paginator = Paginator(queryset, settings.PRODUCT_LIST_PAGINATE_BY)
        page = self.request.GET.get('page')
        products = paginator.get_page(page)
        return products


class ProductDetailView(DetailView):
    model = Product
    slug_url_kwarg = 'product_slug'
    category = None

    def get(self, request, *args, **kwargs):
        category_slug = kwargs['category_slug']
        try:
            self.category = Category.objects.get(slug=category_slug)
        except Category.DoesNotExist:
            raise Http404
        return super().get(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        current_time= datetime.datetime.now(timezone.utc)
        start_time = current_time - datetime.timedelta(hours=24)
        product = kwargs['object']
        comments = product.comments.filter(created__range=[start_time, current_time])
        context['comments'] = comments
        return context


class LikeToggleView(AjaxResponseMixin, JSONResponseMixin, FormView):
    http_method_names = ('post', )
    form_class = LikeForm
    product = None

    @csrf_exempt
    def dispatch(self, request, *args, **kwargs):
        product_id = kwargs['product_pk']
        try:
            self.product = Product.objects.get(id=product_id)
        except Product.DoesNotExist:
            raise Http404()
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            filter_kwargs = {
                "user":request.user,
                'product':self.product
            }
        else:
            filter_kwargs = {
                "ip":get_ip_from_request(request),
                'product':self.product
            }
        if Like.objects.filter(**filter_kwargs):
            Like.objects.filter(**filter_kwargs).delete()
        else:
            Like.objects.create(**filter_kwargs)

        return self.render_json_response({'likes': Like.objects.filter(product=self.product).count()})


class CreateCommentView(CreateView):
    model = Comment
    fields = ["text"]
    product = None

    @csrf_exempt
    def dispatch(self, request, *args, **kwargs):
        product_id = kwargs['product_pk']
        try:
            self.product = Product.objects.get(id=product_id)
            self.success_url = self.product.get_absolute_url()
        except Product.DoesNotExist:
            raise Http404()
        return super().dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        form.instance.product = self.product
        if self.request.user.is_authenticated:
            form.instance.user = self.request.user
        else:
            form.instance.ip = get_ip_from_request(self.request)
        return super().form_valid(form)


class AddToCartView(AjaxResponseMixin, JSONResponseMixin, FormView):
    http_method_names = ('post',)
    success_url = reverse_lazy('products:cart')

    def post(self, request, *args, **kwargs):
        raise NotImplementedError


class CartView(ActiveTabMixin, TemplateView):
    active_tab = 'cart'
    template_name = 'products/cart.html'

