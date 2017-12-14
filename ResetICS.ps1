regsvr32 /s hnetcfg.dll
$MainAdapter = Get-NetAdapter | Where-Object {$_.Name -eq 'Wi-Fi'}                                                                                                  
$ID = $MainAdapter.InterfaceGuid                                                                                                                                    
$SecondAdapter = Get-NetAdapter | Where-Object {$_.Name -eq 'vEthernet (Hyper-V Switch (Wifi))'}                                                                      
$ID2 = $SecondAdapter.InterfaceGuid                                                                                                                                 
$m = New-Object -ComObject HNetCfg.HNetShare                                                                                                                        
# $m.EnumEveryConnection |% { $m.NetConnectionProps.Invoke($_).Guid }                                                                                                 
$c = $m.EnumEveryConnection |? { $m.NetConnectionProps.Invoke($_).Guid -eq $ID }                                                                                    
$config = $m.INetSharingConfigurationForINetConnection.Invoke($c)                                                                                               
$d = $m.EnumEveryConnection |? { $m.NetConnectionProps.Invoke($_).Guid -eq $ID2 }                                                                                   
$config2 = $m.INetSharingConfigurationForINetConnection.Invoke($d)                                                                                                  
$config.DisableSharing()
$config2.DisableSharing()                                                                                                                                         
$config.EnableSharing(0)                                                                                                                                            
$config2.EnableSharing(1)     