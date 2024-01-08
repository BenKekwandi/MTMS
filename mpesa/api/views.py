from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework import permissions
from panel.models import BranchModel,TransactionModel,FeeModel
from django.contrib.auth.models import User,Group
from .serializer import *
import datetime

class SendingAction(APIView):
    def post(self, request, *args, **kwargs):
        pass
    def get(self, request, *args, **kwargs):
        pass
class ReceivingAction(APIView):
    def post(self, request, *args, **kwargs):
        pass
    def get(self, request, *args, **kwargs):
        pass
class Fee(APIView):
    def post(self, request, *args, **kwargs):
        data = {
            'amount_from': request.data.get('amount_from'),
            'amount_to': request.data.get('amount_to'),
            'fee': request.data.get('fee'),
            'date_created':datetime.datetime.now(),
        }
        serializer = FeeSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    def get(self, request, *args, **kwargs):
        fees = FeeModel.objects.filter()
        serializer = FeeSerializer(fees, many = True)
        return Response(serializer.data, status=status.HTTP_200_OK)

class FeeDetail(APIView):
    def put(self, request, id, *args, **kwargs):
        data = {
            'amount_from': request.data.get('amount_from'),
            'amount_to': request.data.get('amount_to'),
            'fee': request.data.get('fee'),
            'date_created':datetime.datetime.now(),
        }
    def get(self, request, id, *args, **kwargs):
        fee = FeeModel.objects.get(id=id)
        serializer = FeeSerializer(fee)
        return Response(serializer.data, status=status.HTTP_200_OK)
    def delete(self, request, id, *args, **kwargs):
        pass

class Report(APIView):
    def post(self, request, *args, **kwargs):
        pass
    def get(self, request, *args, **kwargs):
        pass
class Branch(APIView):
    def post(self, request, *args, **kwargs):
        data = {
            'location': request.data.get('location'),
            'staff_name': request.data.get('staff_name'),
            'date_created':datetime.datetime.now(),
            'status':1
        }
        serializer = BranchSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    def get(self, request, *args, **kwargs):
        branches = BranchModel.objects.filter()
        serializer = BranchSerializer(branches, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    
class BranchDetail(APIView):
    def put(self, request, id, *args, **kwargs):
        data = {
            'location': request.data.get('location'),
            'staff_name': request.data.get('staff_name'),
            'date_created':datetime.datetime.now(),
            'status':1
        }
    def get(self, request, id, *args, **kwargs):
        branch = BranchModel.objects.get(id=id)
        serializer = BranchSerializer(branch)
        return Response(serializer.data, status=status.HTTP_200_OK)
    def delete(self, request, id, *args, **kwargs):
        pass
class Transaction(APIView):
    def post(self, request, *args, **kwargs):
        data = {
            'tracking_code': request.data.get('tracking_code'),
            'branch_id': request.data.get('branch_id'),
            'user_id': request.data.get('user_id'),
            'fee': request.data.get('fee'),
            'sending_amount': request.data.get('sending_amount'),
            'purpose': request.data.get('purpose'),
            'date_created':datetime.datetime.now(),
            'date_updated':datetime.datetime.now(),
            'status':1
        }
        serializer = TransactionSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    def get(self, request, *args, **kwargs):
        transactions = TransactionModel.objects.filter()
        serializer = TransactionSerializer(transactions, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    
class TransactionDetail(APIView):
    def put(self, request, id, *args, **kwargs):
        data = {
            'tracking_code': request.data.get('tracking_code'),
            'branch_id': request.data.get('branch_id'),
            'user_id': request.data.get('user_id'),
            'fee': request.data.get('fee'),
            'sending_amount': request.data.get('sending_amount'),
            'purpose': request.data.get('purpose'),
            'date_created':datetime.datetime.now(),
            'date_updated':datetime.datetime.now(),
            'status':1
        }
    def get(self, request, id, *args, **kwargs):
        transaction = TransactionModel.objects.get(id=id)
        serializer = TransactionSerializer(transaction)
        return Response(serializer.data, status=status.HTTP_200_OK)
    def delete(self, request, id, *args, **kwargs):
        pass
    
class Staff(APIView):
    def post(self, request, *args, **kwargs):
        data = {
            'first_name': request.data.get('first_name'),
            'last_name': request.data.get('last_name'),
            'email': request.data.get('email'),
            'username': request.data.get('username'),
            'password': request.data.get('password'),
            'status':1
        }
        serializer = StaffSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    def get(self, request, *args, **kwargs):
        staffs = User.objects.filter()
        serializer = StaffSerializer(staffs, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

class StaffDetail(APIView):
    def put(self, request, *args, **kwargs):
        data = {
            'first_name': request.data.get('first_name'),
            'last_name': request.data.get('last_name'),
            'email': request.data.get('email'),
            'username': request.data.get('username'),
            'password': request.data.get('password'),
            'status':1
        }
    def get(self, request,id, *args, **kwargs):
        staff = User.objects.get(id=id)
        serializer = StaffSerializer(staff)
        return Response(serializer.data, status=status.HTTP_200_OK)