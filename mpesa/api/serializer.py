from rest_framework import serializers
from django.contrib.auth.models import User
from panel.models import *

class BranchSerializer(serializers.ModelSerializer):
    class Meta:
        model = BranchModel
        fields = '__all__'

class TransactionSerializer(serializers.ModelSerializer):
    class Meta:
        model = TransactionModel
        fields = '__all__'
        
class TransactionInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TransactionInfoModel
        fields = '__all__'
        
class FeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = FeeModel
        fields = '__all__'
        
class StaffSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'