from django.db import models

# Create your models here.


class Company(models.Model):
	name = models.CharField(max_length=100)
	city = models.CharField(max_length=35)

	def __str__(self):
		return self.name


class Employee(models.Model):
	name = models.CharField(max_length=50)
	age = models.IntegerField()
	employ_id = models.IntegerField()
	dob = models.CharField(max_length=8)
	company = models.ForeignKey(Company, on_delete=models.CASCADE)


	def __str__(self):
		return self.name
