from django.urls import path
from .views import *

urlpatterns = [
    path('send', SendingAction.as_view()),
    path('receive', ReceivingAction.as_view()),
    path('fee',Fee.as_view()),
    path('fee/<int:id>',FeeDetail.as_view()),
    path('branch',Branch.as_view()),
    path('branch/<int:id>',BranchDetail.as_view()),
    path('transaction',Transaction.as_view()),
    path('transaction/<int:id>',TransactionDetail.as_view()),
    path('staff',Staff.as_view()),
    path('staff/<int:id>',StaffDetail.as_view()),
]
