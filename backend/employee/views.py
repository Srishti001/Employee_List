# Create your views here.
from django.shortcuts import render, redirect, HttpResponse
from employee.models import Employee
# from .serializers import EmployeeSerializer
from .serializers import *
from rest_framework import viewsets


# Create your views here.
class Employee(viewsets.ModelViewSet):
    queryset = Employee.objects.all()
    serializer_class = EmployeeSerializer