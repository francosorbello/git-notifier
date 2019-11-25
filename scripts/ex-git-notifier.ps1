$dir = 'C:\Users\Rulo\git-notifier'
#creo la carpeta si es que no existe todavia
if (Test-Path $dir){
    echo "La carpeta ya existe"
} else {
    New-Item -Path $dir -ItemType Directory
    $texto = "Se ha creado una carpeta en "+$dir+".Clone los projectos que quiera seguir alli."
    New-BurntToastNotification -Text "Git Notifier", $texto
    exit    
}

#New-BurntToastNotification -Text "git notifier running",$dir

cd $dir
Get-ChildItem -Recurse -Directory | ForEach-Object {
    $rta = ""
    cd $_.FullName #entro al repo 
    git fetch 
    git status | Select-String -Pattern "Your branch is up to date"  | Tee-Object -Variable rta
    if ($rta -eq ""){
            $texto = ""
            $texto = "Cambios en el repo "+$_.Name
            New-BurntToastNotification -AppLogo C:\Users\Rulo\Documents\git-notifier\icon.png -Text "Git Notifier", $texto
    }
}
exit