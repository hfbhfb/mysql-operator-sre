

# mysql-operator-sre

### 安装0 mysql operator
make install

### 安装1 
make myinnodb


### 安装2 (安装innodb)
```sh
make myinnodb-template
make myinnodb
make delete-myinnodb

# 查看有哪些pod
kubectl get pod -n innodbcluster -owide
kubectl describe pod innodb1-0 -n innodbcluster 
kubectl get sts -n innodbcluster
kubectl get sts innodb1 -n innodbcluster -oyaml
kubectl get sts innodb1 -n innodbcluster -oyaml |grep "image:"

kubectl get deployment -n innodbcluster

kubectl get pvc -n innodbcluster 
#### kubectl delete pvc datadir-innodb1-0 datadir-innodb1-1 datadir-innodb1-2 -n innodbcluster 

#查看服务 （  innodb1  、  innodb1-instances  ）
kubectl get svc -n innodbcluster
```



### 测试1 
kubectl get pod -n mysql-operator
kubectl api-resources | grep InnoDBCluster

### 测试2 
参考bilibili视频的操作

### 测试3 (连接innodb)
```sh
# 运行
make sts1sh

# 查看有哪些pod
kubectl get pod -n innodbcluster -owide

#登录
kubectl -n innodbcluster exec -it sts1sh-0 -- mysqlsh
# 连接route
\c root:root@innodb1:6446

#查看集群信息
\js
dba.getCluster().status()
\sql
select @@hostname;

# 连接指定的pod
\c root:root@innodb1-1.innodb1-instances:3306


```



### 测试4 ( 删除innodb一个实例，master会不会进行迁移？ )
```sh
# 查看有哪些pod
kubectl get pod -n innodbcluster -owide

# 删除其中一个pod
kubectl delete pod -n innodbcluster innodb1-0


```


## 参考0
git@github.com:mysql/mysql-operator.git

