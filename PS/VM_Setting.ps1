# 윈도우 초기 세팅
Set-WinSystemLocale ko-kr
# Set-ItemProperty HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Name NoAutoUpdate -Value 1
# Set-ItemProperty HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU -Name AUOptions -Value 3
Stop-Service -Name wuauserv -Force
Set-Service -Name wuauserv -StartupType Disabled
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
Start-Process "C:\Windows\System32\tzutil.exe" "/s `"Korea Standard Time`""
Start-Process "C:\Windows\System32\net.exe" "user cntadmin azs@mpyo!@34 /ADD"
sleep 1
Start-Process "C:\Windows\System32\net.exe" "localgroup administrators cntadmin /add"
sleep 1
Start-Process "C:\Windows\System32\wbem\WMIC.exe" "USERACCOUNT WHERE Name='cntadmin' SET PasswordExpires=FALSE"
# Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\cdrom -Name Start -Value 4 -Type Dword
# Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\cdrom -Name Start -Value 1 -Type Dword

# netsh trace start capture=yes ipv4.address=8.8.8.8 tracefile=C:\temp\trace.etl protocol=tcp
# netsh trace stop

## 메모
# 접근 포트변경
# AHB적용 # windows
# 페이징 옮기기 # windows
# 템프디스크 바꾸기 # windows
# 한글설치 # windows
# TLS 설정 # windows
# 프로메테우스 세팅
# 초기세팅 스크립트 실행 # windows
# 태그달기
# SQL 설치 확인
# 고객사 계정확인

# 리눅스 타임존
timedatectl set-timezone Asia/Seoul

# 로키 버그수정
unlink /etc/init.d
mkdir /etc/init.d
cd /etc/init.d
ln -s /usr/java/latest/.java/init.d/jexec jexec

# 삼바 설정
[share] 
path = /data/share
comment = SAMBA SERVER
read only = no
valid user = sbuser
write list = sbuser
guest ok = no
writable = yes
browseable = yes
create mask = 0777
directory mask = 0777


## 리눅스 disk 확장
# 미리 fdisk 등 세팅

#아래는 로키기준
growpart /dev/sda 3
xfs_growfs /

# fstab
rw,nouser,auto,exec,suid,nofail
# 안될때는 옵션을 default 대신 위에꺼로 대체

DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:f:\sources\sxs



# 리눅스 GUI 세팅
yum install epel-release -y
yum groupinstall -y "GNOME Desktop" "Graphical Adminstration Tools"
yum -y install xrdp tigervnc-server
systemctl enable xrdp.service

reboot



