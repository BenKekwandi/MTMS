from django.shortcuts import render,redirect
from django.contrib.auth.decorators import login_required
from .models import *
from django.forms.models import model_to_dict
from django.contrib.auth.hashers import make_password
import os
import shutil
from django.conf import settings

page_title = ''

@login_required(login_url='/./auth/login')
def dashboard(request):
    page_title = 'Dashboard'
    data = {
        'pending_transactions':TransactionModel.objects.filter(status=0).count(),
        'confirmed_transactions':TransactionModel.objects.filter(status=1).count(),
        'all_transactions':TransactionModel.objects.filter().count(),
        'number_of_staffs':User.objects.filter(is_active=1,is_superuser=0).count(),
        'number_of_branches':BranchModel.objects.filter(status=1).count(),
    }
    return render(request, "dashboard.html", {'page_title':page_title,'data':data})

@login_required(login_url='/./auth/login')
def send(request):
    page_title = 'Send'
    return render(request,"send.html", {'page_title':page_title})

@login_required(login_url='/./auth/login')
def receive(request, tk_code):
    page_title = 'Receive'
    tracking_code = tk_code
    transaction = model_to_dict(TransactionModel.objects.get(tracking_code=tk_code))
    infos = model_to_dict(TransactionInfoModel.objects.get(transaction_id=transaction['id']))
    transaction['payable_amount'] = transaction['fee']+transaction['sending_amount']
    branch = BranchModel.objects.get(id=transaction['branch_id'])
    transaction['branch'] = branch.location+' - '+branch.staff_name
    if request.method == 'POST':
        TransactionModel.objects.filter(id=transaction['id']).update(
            status = 1
        )
        return redirect('/transactions')
    return render(request,"receive.html", {'page_title':page_title,'tracking_code':tracking_code,'transaction':transaction,'infos':infos})

@login_required(login_url='/./auth/login')
def transactions(request):
    page_title = 'All Transactions'
    return render(request, "transactions.html", {'page_title':page_title})

@login_required(login_url='/./auth/login')
def transactionView(request, id):
    page_title = 'Transaction View'
    infos = model_to_dict(TransactionInfoModel.objects.get(transaction_id=id))
    transaction = model_to_dict(TransactionModel.objects.get(id=id))
    transaction['payable_amount'] = transaction['fee']+transaction['sending_amount']
    branch = BranchModel.objects.get(id=transaction['branch_id'])
    transaction['branch'] = branch.location+' - '+branch.staff_name
    return render(request, "viewTransaction.html", {'page_title':page_title,'transaction':transaction, 'infos':infos})

@login_required(login_url='/./auth/login')
def transactionEdit(request, id):
    page_title = 'Transaction Edit'
    infos = model_to_dict(TransactionInfoModel.objects.get(transaction_id=id))
    transaction = model_to_dict(TransactionModel.objects.get(id=id))
    transaction['payable_amount'] = transaction['fee']+transaction['sending_amount']
    branch = BranchModel.objects.get(id=transaction['branch_id'])
    transaction['branch'] = branch.location+' - '+branch.staff_name
    if request.method == 'POST':
        TransactionModel.objects.filter(id=id).update(
            #tracking_code=request.POST.get('tracking_code'),
            #branch_id=request.POST.get('branch_id'),
            # sending_amount=request.POST.get('sending_amount'),
            # fee=request.POST.get('fee'),
            purpose=request.POST.get('purpose')
        )
        TransactionInfoModel.objects.filter(transaction_id=id).update(
            sender_first_name = request.POST.get('sender_first_name'),
            sender_last_name = request.POST.get('sender_last_name'),
            sender_middle_name = request.POST.get('sender_middle_name'),
            sender_contact = request.POST.get('sender_contact'),
            sender_address = request.POST.get('sender_first_name'),
            receiver_first_name = request.POST.get('receiver_first_name'),
            receiver_last_name = request.POST.get('receiver_last_name'),
            receiver_middle_name = request.POST.get('receiver_middle_name'),
            receiver_contact = request.POST.get('receiver_contact'),
            receiver_address = request.POST.get('receiver_first_name'),
            
        )
        return redirect('/transactions')
    return render(request, "editTransaction.html", {'page_title':page_title,'transaction':transaction, 'infos':infos})

@login_required(login_url='/./auth/login')
def reports(request):
    page_title = 'Reports'
    return render(request, "reports.html", {'page_title':page_title})

@login_required(login_url='/./auth/login')
def staff(request):
    page_title = 'Staff'
    return render(request, "staff.html", {'page_title':page_title})

@login_required(login_url='/./auth/login')
def profile(request):
    page_title = 'Profile'
    if request.method == 'POST':
        picture = request.FILES.get('profile_picture')
        profileImage = request.user.profile.profile_picture
        pw = request.user.password
        if request.POST.get('password'):
            pw = request.POST.get('password')
        if picture:
            file_name = picture.name
            destination_path = os.path.join(settings.MEDIA_ROOT, file_name)
            with open(destination_path, 'wb') as destination_file:
                for chunk in picture.chunks():
                    destination_file.write(chunk)
            profileImage = os.path.relpath(destination_path, settings.MEDIA_ROOT)

        User.objects.filter(id=request.user.id).update(
            first_name = request.POST.get('first_name'),
            last_name = request.POST.get('last_name'),
            email = request.POST.get('email'),
            username = request.POST.get('username'),
            password = pw
        )
        Profile.objects.filter(user_id=request.user.id).update(
            profile_picture = profileImage
        )
        return redirect('/profile')
    return render(request, "profile.html", {'page_title':page_title})

@login_required(login_url='/./auth/login')
def fees(request):
    page_title = 'Fees'
    return render(request, "fees.html", {'page_title':page_title})

@login_required(login_url='/./auth/login')
def branches(request):
    page_title = 'Branches'
    return render(request, "branches.html", {'page_title':page_title})

@login_required(login_url='/./auth/login')
def system_settings(request):
    page_title = 'Settings'
    return render(request, "settings.html", {'page_title':page_title})
