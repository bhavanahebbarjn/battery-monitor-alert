\# Battery Monitor Alert



Windows 11 battery monitoring script using PowerShell and BurntToast.



\## Features



\- Low battery alert at 25%

\- Full battery alert at 90%

\- Windows toast notifications

\- Audible beep alerts

\- Prevents duplicate notifications

\- Designed for Task Scheduler automation



\## Requirements



\- Windows 11

\- PowerShell

\- BurntToast module



\## Install BurntToast



```powershell

Install-Module BurntToast -Scope CurrentUser -Force

```



\## Run Script



```powershell

powershell -ExecutionPolicy Bypass -File "BatteryMonitor.ps1"

```



\## Task Scheduler



Create a task:



\- Trigger: At logon

\- Repeat every 1 minute

\- Duration: Indefinitely



\## Alert Thresholds



\- Low Battery: 25%

\- Full Battery: 90%



\## License



MIT

