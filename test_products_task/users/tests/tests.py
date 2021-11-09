from django.contrib.auth import get_user_model
from django.test import TestCase
from django.urls import reverse

from test_products_task.products.tests.factories import LikeFactory, CommentFactory
from test_products_task.users.tests.factories import UserFactory

User = get_user_model()


class UserTestCase(TestCase):
    @classmethod
    def setUpTestData(cls):
        cls.password = "12345"
        cls.user = UserFactory(password=cls.password)
        cls.url = reverse('users:login')

    def test_user_login(self):
        response = self.client.login(username=self.user.username, password=self.password)
        self.assertTrue(response)

    def test_user_fail_login(self):
        response = self.client.login(username= self.user.username, password= "tgew4rgw4523ew")
        self.assertFalse(response)

    def test_logged_user_logout(self):
        response = self.client.login(username=self.user.username, password=self.password)
        self.assertTrue(response)
        self.client.logout()
        self.assertFalse(self.client.session.keys())
