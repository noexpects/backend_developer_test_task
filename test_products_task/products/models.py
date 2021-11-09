from django.core.exceptions import ValidationError
from django.db import models
from django.utils.text import slugify
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _
from model_utils import Choices
from model_utils.models import TimeStampedModel
import os
from config import settings


class Category(models.Model):
    name = models.CharField(_('Name'), max_length=200)
    slug = models.SlugField(_('Slug'), unique=True, blank=True, default="", max_length=250)
    number_of_products = models.IntegerField(editable=False, default=0)

    PARAMS = Choices(
        ('following', 'following'),
        ('price_to', 'price_to'),
        ('price_from', 'price_from'),
    )

    def get_absolute_url(self):
        return reverse('products:category_detail', kwargs={'category_slug': self.slug})

    def __str__(self):
        return self.name


def get_product_image_upload_path(instance, filename):
    file_format = "."
    file_format += filename.split('.')[-1]
    return os.path.join(settings.PRODUCT_PICTURES_FOLDER,
                        "%s" % instance.category,
                        "%s" % instance.name.replace("/", ""), slugify(instance.name)+file_format)


class Product(TimeStampedModel):
    GRADE_CHOICES = Choices(
        ('base', 'base', _('Base')),
        ('standard', 'standard', _('Standard')),
        ('premium', 'premium', _('Premium')),
    )

    name = models.CharField(_('Name'), max_length=200)
    slug = models.SlugField(_('Slug'), unique=True, blank=True, default="", max_length=250)
    price = models.DecimalField(_('Price'), decimal_places=2, max_digits=9)
    description = models.TextField(_('Description'), blank=True)
    category = models.ForeignKey(Category, related_name='products', on_delete=models.CASCADE)
    image = models.ImageField(_('Picture'),
                              upload_to=get_product_image_upload_path,
                              default='no_picture.png', )

    class Meta:
        ordering = ('-created', )

    def get_absolute_url(self):
        return reverse('products:product_detail', kwargs={'category_slug': self.category.slug,
                                                          'product_slug': self.slug})

    def __str__(self):
        return self.name


class Like(TimeStampedModel):
    product = models.ForeignKey(Product, related_name='likes', on_delete=models.CASCADE)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, blank=True, null=True, related_name='likes', on_delete=models.CASCADE)
    ip = models.GenericIPAddressField(blank=True, null=True)

    class Meta:
        unique_together = (('product', 'user'), ('product', 'ip'))

    def __str__(self):
        return '{} from {}'.format(self.product, self.user or self.ip)


class Comment(TimeStampedModel):
    product = models.ForeignKey(Product,
                                related_name='comments',
                                on_delete=models.CASCADE)
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             blank=True,
                             null=True,
                             related_name='comments',
                             on_delete=models.CASCADE)
    ip = models.GenericIPAddressField(blank=True, null=True)
    text = models.TextField(_('Comment'), max_length=500)

    def __str__(self):
        return 'comment from {}'.format(self.user or self.ip)
