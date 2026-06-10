# Battery Monitor Alert

A lightweight Windows 11 battery monitoring solution built with PowerShell and BurntToast.

## Features

- Low battery alerts at configurable thresholds
- Full battery alerts at configurable thresholds
- Windows toast notifications
- Audible alerts
- Duplicate-notification prevention
- Task Scheduler integration
- Lightweight and open source

## Architecture

BatteryMonitor.ps1
       ->
Win32_Battery
         ->
Threshold Check
       ->
BurntToast
        ->
Windows Notification Center

## Installation

### 1. Install BurntToast

powershell
Install-Module BurntToast -Scope CurrentUser -Force

### 2. Download Script

...

### 3. Configure Task Scheduler

...

## Default Thresholds

| Alert Type | Threshold |
|------------|------------|
| Low Battery | 25% |
| Full Battery | 90% |

## License

MIT
