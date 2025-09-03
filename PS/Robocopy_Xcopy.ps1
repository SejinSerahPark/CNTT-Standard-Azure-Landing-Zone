#### 165 파일서버
# e
robocopy e:\TYC_ERP_FILE\ V:\TYC_ERP_FILE\ /e /v /COPYALL /log:C:\robolog_e_0131.txt /mt /tee /r:10 /w:10

# i 
robocopy i:\SP_ERP_FILE\ X:\SP_ERP_FILE\ /e /v /COPYALL /log:C:\temp\robolog_i_0131.txt /mt /tee /r:10

########### 30 번 전용
# G
xcopy g:\ACYJ_GUMEExcel\* h:\ACYJ_GUMEExcel\ /e /h /k /y
xcopy g:\BackUpReport\* h:\BackUpReport\ /e /h /k /y
xcopy g:\DAEWON_GUMEExcel\* h:\DAEWON_GUMEExcel\ /e /h /k /y
xcopy g:\DMAPIMG_ERP\* h:\DMAPIMG_ERP\ /e /h /k /y
xcopy g:\DRMONE\* h:\DRMONE\ /e /h /k /y
xcopy g:\DRMONE2\* h:\DRMONE2\ /e /h /k /y
xcopy g:\ExcelReport\* h:\ExcelReport\ /e /h /k /y
xcopy g:\Log\* h:\Log\ /e /h /k /y
xcopy g:\NDRC_GUMEExcel\* h:\NDRC_GUMEExcel\ /e /h /k /y
xcopy g:\NDW_GUMEExcel\* h:\NDW_GUMEExcel\ /e /h /k /y
xcopy g:\NRC_GUMEExcel\* h:\NRC_GUMEExcel\ /e /h /k /y
xcopy g:\RMC_GUMEExcel\* h:\RMC_GUMEExcel\ /e /h /k /y
xcopy g:\SPBM_GUMEExcel\* h:\SPBM_GUMEExcel\ /e /h /k /y
xcopy g:\SPI_GUMEExcel\* h:\SPI_GUMEExcel\ /e /h /k /y
xcopy g:\SPL_GUMEExcel\* h:\SPL_GUMEExcel\ /e /h /k /y
xcopy g:\TOWER_GUMEExcel\* h:\TOWER_GUMEExcel\ /e /h /k /y
xcopy g:\UNICON_GUMEExcel\* h:\UNICON_GUMEExcel\ /e /h /k /y
xcopy g:\uniERP_GUMEExcel\* h:\uniERP_GUMEExcel\ /e /h /k /y
xcopy g:\uniERP_GUMEExcel.zip h:\ /e /h /k /y
xcopy g:\lgs-g.txt h:\ /e /h /k /y
## 커서 따로
xcopy g:\DRM_DB\ h:\DRM_DB\ /e /h /k /y


######## 27 번
ftp 활용