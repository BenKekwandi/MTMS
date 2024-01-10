from django.db import models
from django.contrib.auth.models import AbstractUser


class BranchModel(models.Model):
    location = models.CharField(max_length=255)
    staff_name = models.CharField(max_length=255)
    date_created = models.DateTimeField(auto_now_add=True)
    status = models.IntegerField()
    class Meta:
        db_table = 'branch_list'
        
class FeeModel(models.Model):
    amount_from = models.FloatField()
    amount_to = models.FloatField()
    fee = models.FloatField()
    status = models.IntegerField()
    date_created = models.DateTimeField(auto_now_add=True)
    class Meta:
        db_table = 'fee_list'
        
class TransactionModel(models.Model):
    tracking_code = models.CharField(max_length = 255)
    branch_id = models.IntegerField()
    sending_amount = models.FloatField()
    fee = models.FloatField()
    purpose = models.CharField(max_length=255)
    user_id = models.IntegerField()
    status = models.IntegerField()
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now_add=True)
    class Meta:
        db_table="transaction_list"
        
class TransactionInfoModel(models.Model):
    transaction_id = models.IntegerField()
    sender_first_name = models.CharField(max_length=255)
    sender_last_name = models.CharField(max_length=255)
    sender_middle_name = models.CharField(max_length=255)
    sender_contact = models.CharField(max_length=255)
    sender_address = models.CharField(max_length=255)
    receiver_first_name = models.CharField(max_length=255)
    receiver_last_name = models.CharField(max_length=255)
    receiver_middle_name = models.CharField(max_length=255)
    receiver_contact = models.CharField(max_length=255)
    receiver_address = models.CharField(max_length=255)
    class Meta:
        db_table = 'transaction_info'
