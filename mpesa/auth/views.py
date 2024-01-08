from django.contrib.auth import authenticate, login as auth_login,logout as auth_logout
from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.views import LogoutView

def login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            auth_login(request, user)
            return redirect('/')
        else:
            messages.error(request, "Username or Password Incorrect")
            return redirect('/auth/login')
    return render(request, 'auth/login.html')

def logout(request):
    auth_logout(request)
    return redirect('/auth/login')
