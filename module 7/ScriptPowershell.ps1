Invoke-Command -Computername LON-SVR1,LON-SVR2 -command {Install-WindowsFeature NLB,RSAT-NLB}

New-NlbCluster -InterfaceName "Ethernet" -OperationMode Multicast -ClusterPrimaryIP 172.16.0.42 -ClusterName LON-NLB

Invoke-Command -Computername LON-DC1 -command {Add-DNSServerResourceRecordA -zonename adatum.com -name LON-NLB -Ipv4Address 172.16.0.42}

Add-NlbClusterNode -InterfaceName "Ethernet" -NewNodeName "LON-SVR2" -NewNodeInterface "Ethernet"
