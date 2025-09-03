# 서비스 볼트 강제삭제
disConnect-AzAccount
Connect-AzAccount -tenantid "628a73e0-e29b-43fd-86b5-9c2fc6d86185"
Select-AzSubscription -Subscriptionid "c679d50d-c9db-4274-b2eb-4aa0761226c4"
$vault = Get-AzRecoveryServicesVault -Name "mig-sampyo-MigrateVault-573027499"
Remove-AzRecoveryServicesVault -Vault $vault


Stop-AzVM -ResourceGroupName "RG-PRD-HUB" -Name "vm-hub-forti-FGT-A" -SkipShutdown