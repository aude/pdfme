@echo off

REM ------------ Copyright ------------
REM -----------------------------------
REM Copyright (C) 2013-toyear  aude
REM
REM This program is free software: you can redistribute it and/or modify
REM it under the terms of the GNU General Public License as published by
REM the Free Software Foundation, either version 3 of the License, or
REM (at your option) any later version.
REM
REM This program is distributed in the hope that it will be useful,
REM but WITHOUT ANY WARRANTY; without even the implied warranty of
REM MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
REM GNU General Public License for more details.
REM
REM You should have received a copy of the GNU General Public License
REM along with this program.  If not, see <http://www.gnu.org/licenses/>.

REM Intro.
echo Will convert input files to PDF using LibreOffice...
echo.

REM Variables.
set libreofficeexe="C:\Program Files\LibreOffice 4\program\soffice.exe"
set input=%*

REM If not file was input, go to the end of the batch.
if not exist %1 (
	echo No file was input.
	echo Will now exit...
	echo.
	
	REM Flee!
	goto endmessage
)

REM Loop through input files, and convert 'em all.
for %%a in (%input%) do (
    REM Make working directory the path of the current processing file.
    cd /d %%~dpa
	REM Inform.
	echo Will convert "%%~a" to "%cd:"=%\%%~na.pdf"...
	
	REM Execute.
	%libreofficeexe% --headless --convert-to pdf "%%~a"
    
    REM Make space.
    echo.
)

:endmessage
echo -------- End of batch --------
echo.
