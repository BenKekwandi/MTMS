from django.shortcuts import render
from django.contrib.auth.decorators import login_required

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
def receive(request):
    page_title = 'Receive'
    return render(request,"receive.html", {'page_title':page_title})


@login_required(login_url='/./auth/login')
def transactions(request):
    page_title = 'All Transactions'
    return render(request, "transactions.html", {'page_title':page_title})

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
