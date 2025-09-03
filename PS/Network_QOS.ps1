
# Windows Network QOS 설정
New-NetQosPolicy -Name "ThrottleReplication-cbe" -AppPathNameMatchCondition "cbengine.exe" -ThrottleRateActionBitsPerSecond 50MB
