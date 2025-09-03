# 0) wget 설치
dnf -y install wget

# 1) prometheus User 생성 및 로그인

useradd -m -s /bin/bash prometheus
su - prometheus

# 2) Node_exporter 다운로드 및 압축 해제

wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
tar -xzvf node_exporter-1.0.1.linux-amd64.tar.gz
mv node_exporter-1.0.1.linux-amd64/ node_exporter

# 3) Node_exporter 서비스 등록 (root 계정으로 진행)
exit

cat << EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Prometheus Node Exporter
Documentation=https://prometheus.io/docs/guides/node-exporter/
Wants=network-online.target
After=network-online.target
[Service]
User=prometheus
Restart=on-failure
ExecStart=/home/prometheus/node_exporter/node_exporter
[Install]
WantedBy=multi-user.target
EOF

# 4) Node_exporter 시작

systemctl start node_exporter
systemctl enable node_exporter


# systemctl restart node_exporter

# 5) 접속 상태 정상 확인 (Node_exporter 기본 설치 포트 9100)

curl -X GET http://localhost:9100/metrics

