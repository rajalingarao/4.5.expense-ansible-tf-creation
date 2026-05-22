# 4.5.expense-ansible-tf-creation

```
terraform init -reconfigure
```

```
terraform plan
```

```
terraform apply -auto-approve
```

```
terraform destroy -auto-approve
```

# Login into mysql server and troubleshoot the data.
```
mysql -h db.lithesh.shop -u root -pExpenseApp@1
```

```
use transactions;
```

```
select * from transactions;
```