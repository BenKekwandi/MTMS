from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from .models import *
from django.forms.models import model_to_dict

page_title = ''

@login_required(login_url='/./auth/login')
def dashboard(request):
    page_title = 'Dashboard'
    return render(request, "dashboard.html", {'page_title':page_title})

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
def settings(request):
    page_title = 'Settings'
    return render(request, "settings.html", {'page_title':page_title})
