#libreria
[reflection.assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null

function AddToRepoList([string]$dir){
    
    #si no exite el archivo lo creo
    if ( -NOT(Test-Path C:\Users\Rulo\git-notifier.txt) ) {
          New-Item 'C:\Users\Rulo\git-notifier.txt'
    }
    Add-Content C:\Users\Rulo\git-notifier.txt $dir 
}


#crea la venta principal
$folderForm = New-Object System.Windows.Forms.Form

#añado campo de texto
$pathTextBox = New-Object System.Windows.Forms.TextBox
$pathTextBox.Location = '23,23'
$pathTextBox.Size = '150,23'
$folderForm.Controls.Add($pathTextBox)

#añado boton para seleccionar carpeta
$selectButton = New-Object System.Windows.Forms.Button
$selectButton.Text = 'Select'
$selectButton.Location = '196,23'
$folderForm.Controls.Add($selectButton)

$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog

$selectButton.Add_Click({
    $folderBrowser.ShowDialog()
    $pathTextBox.Text = $folderBrowser.SelectedPath #direccion
})


#helper
$helper = New-Object System.Windows.Forms.TextBox
$helper.Location='26,80'
$helper.ReadOnly = $true
$folderForm.Controls.Add($helper)


#boton para añadir la carpeta
$addButton= New-Object System.Windows.Forms.Button

$addButton.Location = '26,52'
$addButton.text = 'Add'
$addButton.Add_Click({
    $helper.Text=""
    If($folderBrowser.SelectedPath){
        $dir = $folderBrowser.SelectedPath
        If((Test-Path $folderBrowser.SelectedPath) -AND (Test-Path $dir\.git)){
            $helper.Text="True"
            AddToRepoList $folderBrowser.SelectedPath
        }
        else {
            $helper.Text="False"
        }
    }
})

$folderForm.Controls.Add($addButton)


$folderForm.ShowDialog()

