from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework import permissions
from panel.models import BranchModel,TransactionModel,FeeModel
from django.contrib.auth.models import User,Group
from .serializer import *
import datetime
from django.contrib.auth.hashers import make_password
import random
import string
from django.forms.models import model_to_dict


def generate_random_string():
    upper_case_letters = ''.join(random.choices(string.ascii_uppercase, k=3))
    dash = '-'
    digits = ''.join(random.choices(string.digits, k=8))
    random_string = f"{upper_case_letters}{dash}{digits}"
    return random_string


class Fee(APIView):
    def post(self, request, *args, **kwargs):
        data = {
            'amount_from': request.data.get('amount_from'),
            'amount_to': request.data.get('amount_to'),
            'fee': request.data.get('fee'),
            'status':1,
            'date_created':datetime.datetime.now(),
        }
        serializer = FeeSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    def get(self, request, *args, **kwargs):
        fees = FeeModel.objects.filter(status=1)
        serializer = FeeSerializer(fees, many = True)
        return Response(serializer.data, status=status.HTTP_200_OK)

class FeeDetail(APIView):
    def put(self, request, id, *args, **kwargs):
        data = {
            'amount_from': request.data.get('amount_from'),
            'amount_to': request.data.get('amount_to'),
            'fee': request.data.get('fee'),
            'status':1,
            'date_created':datetime.datetime.now(),
        }
        fee = FeeModel.objects.get(id=id)
        serializer = FeeSerializer(
            instance=fee, data=data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    def get(self, request, id, *args, **kwargs):
        fee = FeeModel.objects.get(id=id)
        serializer = FeeSerializer(fee)
        return Response(serializer.data, status=status.HTTP_200_OK)
    def delete(self, request, id, *args, **kwargs):
        fee = FeeModel.objects.get(id=id)
        if not fee:
            return Response(
                {"res": "Object with fee id does not exists"},
                status=status.HTTP_400_BAD_REQUEST
            )
        data = {
            'status': 0
        }
        serializer = FeeSerializer(
            instance=fee, data=data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class Report(APIView):
    def post(self, request, *args, **kwargs):
        pass
    def get(self, request, *args, **kwargs):
        transactions = TransactionModel.objects.filter().values()
        for transaction in transactions:
            operator = User.objects.get(id=transaction['user_id'])
            transaction['operator']=operator.first_name+' '+operator.last_name
            branch = BranchModel.objects.get(id=transaction['branch_id'])
            transaction['branch']= branch.location
            transaction['infos'] = model_to_dict(TransactionInfoModel.objects.get(transaction_id=transaction['id']))
        return Response(transactions, status=status.HTTP_200_OK)
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
        branches = BranchModel.objects.filter(status=1)
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
        branch = BranchModel.objects.get(id=id)
        serializer = BranchSerializer(
            instance=branch, data=data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    def get(self, request, id, *args, **kwargs):
        branch = BranchModel.objects.get(id=id)
        serializer = BranchSerializer(branch)
        return Response(serializer.data, status=status.HTTP_200_OK)
    def delete(self, request, id, *args, **kwargs):
        branch = BranchModel.objects.get(id=id)
        if not branch:
            return Response(
                {"res": "Object with Branch id does not exists"},
                status=status.HTTP_400_BAD_REQUEST
            )
        data = {
            'status': 0
        }
        serializer = BranchSerializer(
            instance=branch, data=data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
class Transaction(APIView):
    def post(self, request, *args, **kwargs):
        code = generate_random_string()
        data = {
            'tracking_code': code,
            'branch_id': request.data.get('branch_id'),
            'user_id': request.user.id,
            'fee': request.data.get('fee'),
            'sending_amount': request.data.get('sending_amount'),
            'purpose': request.data.get('purpose'),
            'date_created':datetime.datetime.now(),
            'date_updated':datetime.datetime.now(),
            'status':0
        }
        infoData ={
            'sender_first_name': request.data.get('sender_first_name'),
            'sender_last_name': request.data.get('sender_last_name'),
            'sender_middle_name': request.data.get('sender_middle_name'),
            'sender_contact': request.data.get('sender_contact'),
            'sender_address': request.data.get('sender_address'),
            'receiver_first_name': request.data.get('receiver_first_name'),
            'receiver_last_name': request.data.get('receiver_last_name'),
            'receiver_middle_name': request.data.get('receiver_middle_name'),
            'receiver_contact': request.data.get('receiver_contact'),
            'receiver_address': request.data.get('receiver_address'),
            
        }
        serializer = TransactionSerializer(data=data)
        infoSerializer = TransactionInfoSerializer(data=infoData)
        if serializer.is_valid():
            serializer.save()
            infoData['transaction_id'] = serializer.data['id']
            infoSerializer = TransactionInfoSerializer(data=infoData)
            if infoSerializer.is_valid():
                infoSerializer.save()
                return Response(serializer.data, status=status.HTTP_200_OK)
            return Response(infoSerializer.data, status=status.HTTP_200_OK)
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
        transaction = TransactionModel.objects.get(id=id)
        serializer = TransactionSerializer(
            instance=transaction, data=data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
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
            'password': make_password(request.data.get('password')),
            'date_joined':datetime.datetime.now(),
            'is_staff':1,
            'is_supersuser':0,
            'is_active':1,
        }
        serializer = StaffSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    def get(self, request, *args, **kwargs):
        staffs = User.objects.filter(is_active=1)
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
        staff = User.objects.get(id=id)
        serializer = StaffSerializer(
            instance=staff, data=data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    def get(self, request,id, *args, **kwargs):
        staff = User.objects.get(id=id)
        serializer = StaffSerializer(staff)
        return Response(serializer.data, status=status.HTTP_200_OK)
    def delete(self, request,id, *args, **kwargs):
        staff = User.objects.get(id=id)
        if not staff:
            return Response(
                {"res": "Object with staff id does not exists"},
                status=status.HTTP_400_BAD_REQUEST
            )
        data = {
            'is_active': 0
        }
        serializer = StaffSerializer(
            instance=staff, data=data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)