@echo off
setlocal enabledelayedexpansion

:: ��ī���� �̸� �Դϴ�.
set _adapter="�̴���"

:: IP ������ �������� �Է� �޽��ϴ�.
:: ���� ���� �Է� �� ���� �ְ�, IP �ּ� ����
:: �����̽� �ؼ� ����Ʈ���̸� �ڵ����� �Է� �� ���� ���� �̴ϴ�.

::������ ���� ���� �Է� �޴ºι�. set /p �� ����Ͽ� ������Ʈ���� �Է��ϴ� ���� ������ ����.
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