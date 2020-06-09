@echo off

SET /P PROJ=Select folder containing las files to process:

pushd %PROJ%
if exist filelst.txt del filelst.txt


DIR /B *.las > filelst.txt

FOR /F "delims=." %%x in (filelst.txt) do (
	lasinfo -i %%x.las -no_header -no_vlrs -no_min_max -compute_density -o %%x_info.txt
	)

del filelst.txt

copy *.txt Density_and_Spacing.txt

set VAR_1 = Density_and_Spacing.txt

"C:\Users\gcopple\Desktop\Code_After_Github\Project3\Return_Spacing\WORK\Get_Density_V2.exe %1 %VAR_1%" "C:\Users\gcopple\Desktop\Code_After_Github\Project3\Return_Spacing\WORKGet_Density_V2.py %1 %VAR_1%"

:END
