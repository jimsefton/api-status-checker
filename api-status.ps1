clear
while($true){

try{
$url='https://server/endpoint.asmx';
$HTTP_Request = [System.Net.WebRequest]::Create($url)
$HTTP_Response = $HTTP_Request.GetResponse()
$HTTP_Status = [int]$HTTP_Response.StatusCode

$theDate=Get-Date -Format s; 
Write-Host $theDate $url "- OK" 
Add-Content c:\LOG.txt "$theDate $url - OK"

$HTTP_Response.Close()

}
catch{
    try{
    $url='http://google.com';
    $HTTP_Request = [System.Net.WebRequest]::Create($url)
    $HTTP_Response = $HTTP_Request.GetResponse()
    $HTTP_Status = [int]$HTTP_Response.StatusCode

    $theDate=Get-Date -Format s; 

    $HTTP_Response.Close()

        $exceptionMessage = $_.Exception.Message
        $exceptionItem = $_.Exception.ItemName
        "$theDate $exceptionMessage - Internet is UP"
        Add-Content c:\LOG.txt "$theDate $exceptionMessage - Internet is UP"
    }
    catch{
        "$theDate $exceptionMessage - Internet is DOWN"
        Add-Content c:\LOG.txt "$theDate $exceptionMessage - Internet is DOWN"
    }
}

Start-Sleep -s 10
}
