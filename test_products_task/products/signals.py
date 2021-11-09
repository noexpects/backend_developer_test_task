from .models import Category, Product
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.text import slugify
import time


@receiver(post_save, sender=Product)
def category_product_counter(sender, instance, created, **kwargs):
    for x in Category.objects.all():
        x.number_of_products = x.products.count()
        x.save()


@receiver(post_save, sender=Product)
@receiver(post_save, sender=Category)
def generate_slug_from_name(instance, **kwargs):
    if instance.slug == "":
        instance.slug = slugify(instance.name)
        if instance.__class__.objects.filter(slug=instance.slug).exists():
            instance.slug += f"-%s" % time.time()
        instance.save()
