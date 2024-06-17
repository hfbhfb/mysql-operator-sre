


helmAppName:=mysql1
NS:=mysql-operator
# 因为经常安装了东西，不好清理，引入helm包
template:
	helm template ./mysql-operator/helm/mysql-operator/ --namespace ${NS} --values ./values-operator.yaml --name-template ${helmAppName} --output-dir outdir-${helmAppName}

install:
	-kubectl create ns ${NS}
	helm install ${helmAppName} ./mysql-operator/helm/mysql-operator/ --values ./values-operator.yaml  --namespace ${NS} 



innodbName:=innodb1
innodbNS:=innodbcluster

myinnodb-template:
	helm template ./mysql-operator/helm/mysql-innodbcluster/ --namespace ${innodbNS} --values ./values-innodb.yaml --name-template ${innodbName} --output-dir outdir-${innodbName}

myinnodb:
	-kubectl create ns ${innodbNS}
	helm install  ${innodbName}  ./mysql-operator/helm/mysql-innodbcluster/ --namespace ${innodbNS} --values ./values-innodb.yaml 

delete-myinnodb:
	helm uninstall  ${innodbName}  --namespace ${innodbNS} 


sts1sh:
	kubectl apply -f sts1sh.yaml -n ${innodbNS}

