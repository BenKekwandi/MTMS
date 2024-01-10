from django.urls import path
from .views import *

urlpatterns = [
    path('', dashboard),
    path('send',send),
    path('receive/<str:tk_code>',receive),
    path('fees',fees),
    path('reports',reports),
    path('transactions',transactions),
    path('transaction/<int:id>',transactionView),
    path('settings', settings),
    path('staff',staff),
    path('profile',profile),
    path('branches',branches),
    path('settings',settings)
]
