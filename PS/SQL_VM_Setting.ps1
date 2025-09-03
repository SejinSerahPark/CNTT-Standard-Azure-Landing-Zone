# SQL Server 라이선스 유형을 사용량에 따라 지불하려면 종량제(PAYG),
# 자체 라이선스를 사용하려면 Azure 하이브리드 혜택(AHUB),
# 무료 DR 복제본 라이선스를 활성화하려면 재해 복구(DR)로 제공합니다.

az sql vm create --name vm-biz-nhv7 --resource-group rg-prd-biz --location koreacentral --license-type AHUB

az sql vm create --name vm-mes-samdb1 --resource-group rg-prd-biz --location koreacentral --license-type AHUB
az sql vm create --name vm-mes-spcdb1 --resource-group rg-prd-biz --location koreacentral --license-type AHUB
az sql vm create --name vm-mes-qcdb1 --resource-group rg-prd-biz --location koreacentral --license-type AHUB

az sql vm create --name vm-biz-relaydb1 --resource-group rg-prd-biz --location koreacentral --license-type AHUB
az sql vm create --name vm-ehr-db1 --resource-group rg-prd-biz --location koreacentral --license-type AHUB

az sql vm create --name vm-dmz-remixdb1 --resource-group rg-prd-dmz --location koreacentral --license-type AHUB
az sql vm create --name vm-biz-gpsdb1 --resource-group rg-prd-biz --location koreacentral --license-type AHUB

az sql vm create --name vm-sperp-db2 --resource-group rg-prd-sperp --location koreacentral --license-type AHUB
az sql vm create --name vm-tycerp-db2 --resource-group rg-prd-tycerp --location koreacentral --license-type AHUB

### SQL temp setting
Select name, physical_name, state_desc from sys.master_files
Where database_id=DB_ID('tempdb')

alter database tempdb
modify file (name=tempdev, filename='e:\temp\tempdb.mdf')
alter database tempdb
modify file (name=templog, filename='e:\temp\templog.ldf')
 
alter database tempdb
modify file (name=temp2, filename='e:\temp\tempdb_mssql_2.ndf')
 
alter database tempdb
modify file (name=temp3, filename='e:\temp\tempdb_mssql_3.ndf')
 
alter database tempdb
modify file (name=temp4, filename='e:\temp\tempdb_mssql_4.ndf')
 
alter database tempdb
modify file (name=temp5, filename='e:\temp\tempdb_mssql_5.ndf')
 
alter database tempdb
modify file (name=temp6, filename='e:\temp\tempdb_mssql_6.ndf')
 
alter database tempdb
modify file (name=temp7, filename='e:\temp\tempdb_mssql_7.ndf')
 
alter database tempdb
modify file (name=temp8, filename='e:\temp\tempdb_mssql_8.ndf')



##### mariadb 로키리눅스

curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash

vi /etc/yum.repos.d/MariaDB.repo
# 아래 입력
[mariadb]
name = MariaDB-10.6.14
baseurl= http://archive.mariadb.org/mariadb-10.6.14/yum/rhel9-amd64/
gpgkey= https://archive.mariadb.org/PublicKey
gpgcheck=1

dnf clean all
sudo rpm --import https://supplychain.mariadb.com/MariaDB-Server-GPG-KEY

dnf -y install MariaDB-server-10.6.14 MariaDB-client-10.6.14 MariaDB-shared-10.6.14 MariaDB-backup-10.6.14 MariaDB-common-10.6.14

#################
https://dev.mysql.com/doc/refman/8.2/en/linux-installation-yum-repo.html