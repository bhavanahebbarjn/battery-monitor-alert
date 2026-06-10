Import-Module BurntToast -ErrorAction SilentlyContinue

$Battery = Get-CimInstance Win32_Battery

if ($null -eq $Battery) {
    exit
}

$Level = $Battery.EstimatedChargeRemaining

$StateFile = "$env:LOCALAPPDATA\BatteryMonitor.state"

if (!(Test-Path $StateFile)) {
    "NONE" | Set-Content $StateFile
}

$LastState = (Get-Content $StateFile -Raw).Trim()

# =========================
# LOW BATTERY ALERT (25%)
# =========================
if ($Level -le 25 -and $LastState -ne "LOW") {

    1..2 | ForEach-Object {

        New-BurntToastNotification `
            -Text "Low Battery Alert", "Battery is $Level%. Connect your charger."

        [console]::beep(1000,1000)

        Start-Sleep -Seconds 2
    }

    "LOW" | Set-Content $StateFile
}

# =========================
# FULL BATTERY ALERT (90%)
# =========================
elseif ($Level -ge 90 -and $LastState -ne "FULL") {


    1..2 | ForEach-Object {

        New-BurntToastNotification `
            -Text "Battery Charged", "Battery reached $Level%. You can unplug the charger."

        [console]::beep(1500,1000)

        Start-Sleep -Seconds 2
    }

    "FULL" | Set-Content $StateFile
}

# =========================
# RESET STATE
# =========================
elseif ($Level -gt 30 -and $Level -lt 85) {

    "NONE" | Set-Content $StateFile
}