from django.urls import path
from .views import *
from django.contrib.auth.views import LogoutView

urlpatterns = [
    path('login', login),
    path('get-logout', logout),
    path('logout/', LogoutView.as_view()),
]
