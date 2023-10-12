@echo off
setlocal enabledelayedexpansion

:: 랜카드의 이름 입니다.
set _adapter="이더넷"

:: IP 정보를 수동으로 입력 받습니다.
:: 값을 직접 입력 할 수도 있고, IP 주소 값을
:: 슬라이싱 해서 게이트웨이를 자동으로 입력 할 수도 있을 겁니다.

::변수에 대한 값의 입력 받는부문. set /p 을 사용하여 프롬프트에서 입력하는 값을 변수에 저장.
cls
echo.
set /p _ip=IP:
set /p _subnet=SUBNET:
set /p _gateway=GATEWAY:
set /p _dns1=DNS1:
set /p _dns2=DNS2:
echo.
:: IP / SUBNET / GATEWAY
netsh interface ip set address %_adapter% static %_ip% %_subnet% %_gateway%
:: DNS 1
netsh -c int ip set dns name=%_adapter% static "%_dns1%" primary
:: DNS 2
netsh -c int ip add dns name=%_adapter% "%_dns2%" index=2
pause