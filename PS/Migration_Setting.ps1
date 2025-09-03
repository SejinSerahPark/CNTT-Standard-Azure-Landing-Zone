# 윈도우 기준
# 진행 전 설치파일과 암호파일을 C:\temp 로 옮겨놓을것

cd C:\temp
.\\Microsoft-ASR_UA_9.55.0.0_Windows_GA_11Jul2023_Release.exe /q /x:"C:\Program Files (x86)\Microsoft Azure Site Recovery"
cd "C:\Program Files (x86)\Microsoft Azure Site Recovery"

.\UNIFIEDAGENT.EXE /Role "MS" /Platform "VmWare" /Silent /CSType CSLegacy

cd "C:\Program Files (x86)\Microsoft Azure Site Recovery\agent"
.\UnifiedAgentConfigurator.exe /CSEndPoint 128.134.123.131 /PassphraseFilePath C:\temp\migapppas.txt


# 리눅스 기준

cd /cntt
# tar -xvf Microsoft-ASR_UA_version_LinuxVersion_GA_date_release.tar.gz
tar -xvf Microsoft-ASR_UA_9.55.0.0_RHEL7-64_GA_11Jul2023_Release.tar.gz

sudo ./install -r MS -v VmWare -q -c CSLegacy
/usr/local/ASR/Vx/bin/UnifiedAgentConfigurator.sh -i 128.134.123.131 -P migapppas.txt -c CSLegacy
