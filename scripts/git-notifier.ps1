#si no exite el archivo lo creo
$dir_file = 'C:\Users\Rulo\git-notifier.txt'
if ( -NOT(Test-Path $dir_file) ) {
    New-Item $dir_file
}

Get-Content $dir_file | ForEach-Object{ 
    cd $_ 
    #check si es un repo de git
    if(Test-Path $_\.git)
    {
        git fetch
        git status | Select-String -Pattern "Your branch is up to date"  | Tee-Object -Variable rta
        if ($rta -eq ""){
            $texto = ""
            $texto = "Cambios en el repo "+$_
            New-BurntToastNotification -AppLogo C:\Users\Rulo\Documents\git-notifier\scripts\icon.png -Text "Git Notifier", $texto
        }
    }
    else {
        $texto = ""
        $texto = $_+" no es un repositorio!"
        New-BurntToastNotification -AppLogo C:\Users\Rulo\Documents\git-notifier\scripts\icon.png -Text "Git Notifier", $texto
    }

}

exit