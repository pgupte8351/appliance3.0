create or replace function create_mof (
P_STR IN CLOB,
P_NAME IN VARCHAR
) return VARCHAR2 is
PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(256);
begin
    result := 'OK';
    begin
        UPDATE CPE_RULE_HEADER SET RULE_CONFIG= to_clob ( P_STR )
           WHERE   id IN 
                   (select distinct c.id from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= P_NAME ); 
        commit;            
        exception
           when others then result := 'could not insert mof snippet';
    end;    
    return result;
end;
/

create or replace function add_mof_data 
return varchar2 is
PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(256);v_total number; v_success number;
v_str CLOB;
begin
   
    v_total := 0 ; v_success := 0;
    result := 'result : ';
 

     v_str := 'instance of DSCRegistry as $DSCRegistry1ref
{
ResourceID = "[DSCRegistry]V-15696-1";
 ValueName = "AllowLLTDIOOndomain";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::20::9::DSCRegistry";
 RuleNumber = "V-15696-1";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};
instance of DSCRegistry as $DSCRegistry2ref
{
ResourceID = "[DSCRegistry]V-15696-2";
 ValueName = "AllowLLTDIOOnPublicNet";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::32::9::DSCRegistry";
 RuleNumber = "V-15696-2";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};
instance of DSCRegistry as $DSCRegistry3ref
{
ResourceID = "[DSCRegistry]V-15696-3";
 ValueName = "EnableLLTDIO";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::43::9::DSCRegistry";
 RuleNumber = "V-15696-3";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};
instance of DSCRegistry as $DSCRegistry4ref
{
ResourceID = "[DSCRegistry]V-15696-4";
 ValueName = "ProhibitLLTDIOOnPrivateNet";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::54::9::DSCRegistry";
 RuleNumber = "V-15696-4";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15696' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry5ref
{
ResourceID = "[DSCRegistry]V-15697-1";
 ValueName = "AllowRspndrOndomain";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::65::9::DSCRegistry";
 RuleNumber = "V-15697-1";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};
instance of DSCRegistry as $DSCRegistry6ref
{
ResourceID = "[DSCRegistry]V-15697-2";
 ValueName = "AllowRspndrOnPublicNet";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::76::3::DSCRegistry";
 RuleNumber = "V-15697-2";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};
instance of DSCRegistry as $DSCRegistry7ref
{
ResourceID = "[DSCRegistry]V-15697-3";
 ValueName = "EnableRspndr";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::87::9::DSCRegistry";
 RuleNumber = "V-15697-3";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};
instance of DSCRegistry as $DSCRegistry8ref
{
ResourceID = "[DSCRegistry]V-15697-4";
 ValueName = "ProhibitRspndrOnPrivateNet";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::98::9::DSCRegistry";
 RuleNumber = "V-15697-4";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15697' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry9ref
{
ResourceID = "[DSCRegistry]V-15666";
 ValueName = "Disabled";
 Key = "HKLM:\\Software\\policies\\Microsoft\\Peernet";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::109::3::DSCRegistry";
 RuleNumber = "V-15666";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15666' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry10ref
{
ResourceID = "[DSCRegistry]V-15667";
 ValueName = "NC_AllowNetBridge_NLA";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Network Connections";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::120::9::DSCRegistry";
 RuleNumber = "V-15667";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15667' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry11ref
{
ResourceID = "[DSCRegistry]V-21960";
 ValueName = "NC_StdDomainUserSetLocation";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Network Connections";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::131::9::DSCRegistry";
 RuleNumber = "V-21960";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21960' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry12ref
{
ResourceID = "[DSCRegistry]V-21961";
 ValueName = "Force_Tunneling";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::142::9::DSCRegistry";
 RuleNumber = "V-21961";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "Enabled";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21961' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry13ref
{
ResourceID = "[DSCRegistry]V-26575";
 ValueName = "6to4_State";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::153::9::DSCRegistry";
 RuleNumber = "V-26575";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "Disabled";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-26575' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry14ref
{
ResourceID = "[DSCRegistry]V-26576";
 ValueName = "IPHTTPS_ClientState";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition\\IPHTTPS\\IPHTTPSInterface";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::164::9::DSCRegistry";
 RuleNumber = "V-26576";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-26576' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry15ref
{
ResourceID = "[DSCRegistry]V-26577";
 ValueName = "ISATAP_State";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-26577";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "Disabled";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-26577' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry16ref
{
ResourceID = "[DSCRegistry]V-26578";
 ValueName = "Teredo_State";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::186::3::DSCRegistry";
 RuleNumber = "V-26578";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "Disabled";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-26578' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry17ref
{
ResourceID = "[DSCRegistry]V-36673";
 ValueName = "EnableIPAutoConfigurationLimits";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::197::9::DSCRegistry";
 RuleNumber = "V-36673";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36673' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry18ref
{
ResourceID = "[DSCRegistry]V-15698-1";
 ValueName = "DisableFlashConfigRegistrar";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WCN\\Registrars";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::208::3::DSCRegistry";
 RuleNumber = "V-15698-1";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};
instance of DSCRegistry as $DSCRegistry19ref
{
ResourceID = "[DSCRegistry]V-15698-2";
 ValueName = "DisableInBand802DOT11Registrar";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WCN\\Registrars";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::219::6::DSCRegistry";
 RuleNumber = "V-15698-2";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};
instance of DSCRegistry as $DSCRegistry20ref
{
ResourceID = "[DSCRegistry]V-15698-3";
 ValueName = "DisableUPnPRegistrar";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WCN\\Registrars";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::230::6::DSCRegistry";
 RuleNumber = "V-15698-3";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};
instance of DSCRegistry as $DSCRegistry21ref
{
ResourceID = "[DSCRegistry]V-15698-4";
 ValueName = "DisableWPDRegistrar";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WCN\\Registrars";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::241::6::DSCRegistry";
 RuleNumber = "V-15698-4";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};
instance of DSCRegistry as $DSCRegistry22ref
{
ResourceID = "[DSCRegistry]V-15698-5";
 ValueName = "EnableRegistrars";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WCN\\Registrars";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::252::6::DSCRegistry";
 RuleNumber = "V-15698-5";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15698' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry23ref
{
ResourceID = "[DSCRegistry]V-15699";
 ValueName = "DisableWcnUi";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WCN\\UI";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::263::3::DSCRegistry";
 RuleNumber = "V-15699";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15699' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry24ref
{
ResourceID = "[DSCRegistry]V-21963";
 ValueName = "DoNotInstallCompatibleDriverFromWindowsUpdate";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Printers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::274::6::DSCRegistry";
 RuleNumber = "V-21963";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21963' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry25ref
{
ResourceID = "[DSCRegistry]V-36677";
 ValueName = "UseWindowsUpdate";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Servicing";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::285::6::DSCRegistry";
 RuleNumber = "V-36677";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36677' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry26ref
{
ResourceID = "[DSCRegistry]V-15700";
 ValueName = "AllowRemoteRPC";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DeviceInstall\\Settings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::296::6::DSCRegistry";
 RuleNumber = "V-15700";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15700' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry27ref
{
ResourceID = "[DSCRegistry]V-15702";
 ValueName = "DisableSendGenericDriverNotFoundToWER";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DeviceInstall\\Settings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::307::6::DSCRegistry";
 RuleNumber = "V-15702";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15702' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry28ref
{
ResourceID = "[DSCRegistry]V-15701";
 ValueName = "DisableSystemRestore";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DeviceInstall\\Settings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::318::9::DSCRegistry";
 RuleNumber = "V-15701";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15701' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry29ref
{
ResourceID = "[DSCRegistry]V-21964";
 ValueName = "PreventDeviceMetadataFromNetwork";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Device Metadata";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::329::6::DSCRegistry";
 RuleNumber = "V-21964";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21964' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry30ref
{
ResourceID = "[DSCRegistry]V-28504";
 ValueName = "DisableSendRequestAdditionalSoftwareToWER";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DeviceInstall\\Settings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::340::7::DSCRegistry";
 RuleNumber = "V-28504";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-28504' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry31ref
{
ResourceID = "[DSCRegistry]V-21965";
 ValueName = "SearchOrderConfig";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DriverSearching";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::351::9::DSCRegistry";
 RuleNumber = "V-21965";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21965' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry32ref
{
ResourceID = "[DSCRegistry]V-36678";
 ValueName = "DriverServerSelection";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DriverSearching";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::362::9::DSCRegistry";
 RuleNumber = "V-36678";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36678' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry33ref
{
ResourceID = "[DSCRegistry]V-15703";
 ValueName = "DontPromptForWindowsUpdate";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DriverSearching";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::373::9::DSCRegistry";
 RuleNumber = "V-15703";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15703' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry34ref
{
ResourceID = "[DSCRegistry]V-36679";
 ValueName = "DriverLoadPolicy";
 Key = "HKLM:\\System\\CurrentControlSet\\Policies\\EarlyLaunch";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::384::3::DSCRegistry";
 RuleNumber = "V-36679";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36679' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry35ref
{
ResourceID = "[DSCRegistry]V-4448";
 ValueName = "NoGPOListChanges";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Group Policy\\{\n            RuleNumber = \"35378EAC-683F-11D2-A89A-00C04FBBCFA2}";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::395::6::DSCRegistry";
 RuleNumber = "V-4448";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-4448' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry36ref
{
ResourceID = "[DSCRegistry]V-3469";
 ValueName = "DisableBkGndGroupPolicy";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\system";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::407::6::DSCRegistry";
 RuleNumber = "V-3469";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3469' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry37ref
{
ResourceID = "[DSCRegistry]V-36680";
 ValueName = "NoUseStoreOpenWith";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::418::6::DSCRegistry";
 RuleNumber = "V-36680";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36680' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry38ref
{
ResourceID = "[DSCRegistry]V-14260";
 ValueName = "DisableWebPnPDownload";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Printers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::429::7::DSCRegistry";
 RuleNumber = "V-14260";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14260' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry39ref
{
ResourceID = "[DSCRegistry]V-15672";
 ValueName = "MicrosoftEventVwrDisableLinks";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\EventViewer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::440::6::DSCRegistry";
 RuleNumber = "V-15672";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15672' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry40ref
{
ResourceID = "[DSCRegistry]V-15704";
 ValueName = "PreventHandwritingErrorReports";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\HandwritingErrorReports";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::451::3::DSCRegistry";
 RuleNumber = "V-15704";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15704' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry41ref
{
ResourceID = "[DSCRegistry]V-15674";
 ValueName = "NoInternetOpenWith";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::462::6::DSCRegistry";
 RuleNumber = "V-15674";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15674' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry42ref
{
ResourceID = "[DSCRegistry]V-14259";
 ValueName = "DisableHTTPPrinting";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Printers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::473::6::DSCRegistry";
 RuleNumber = "V-14259";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14259' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry43ref
{
ResourceID = "[DSCRegistry]V-16020";
 ValueName = "CEIPEnable";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\SQMClient\\Windows";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::484::6::DSCRegistry";
 RuleNumber = "V-16020";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-16020' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry44ref
{
ResourceID = "[DSCRegistry]V-14261";
 ValueName = "DontSearchWindowsUpdate";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DriverSearching";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::495::6::DSCRegistry";
 RuleNumber = "V-14261";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14261' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry45ref
{
ResourceID = "[DSCRegistry]V-36681";
 ValueName = "BlockUserInputMethodsForSignIn";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Control Panel\\International";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::507::6::DSCRegistry";
 RuleNumber = "V-36681";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36681' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry46ref
{
ResourceID = "[DSCRegistry]V-15680";
 ValueName = "LogonType";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::518::6::DSCRegistry";
 RuleNumber = "V-15680";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15680' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry47ref
{
ResourceID = "[DSCRegistry]V-36684";
 ValueName = "EnumerateLocalUsers";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::529::9::DSCRegistry";
 RuleNumber = "V-36684";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36684' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry48ref
{
ResourceID = "[DSCRegistry]V-36687";
 ValueName = "DisableLockScreenAppNotifications";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::540::6::DSCRegistry";
 RuleNumber = "V-36687";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36687' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry49ref
{
ResourceID = "[DSCRegistry]V-15705";
 ValueName = "DCSettingIndex";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Power\\PowerSettings\\0e796bdb-100d-47d6-a2d5-f7d2daa51f51";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::551::6::DSCRegistry";
 RuleNumber = "V-15705";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15705' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry50ref
{
ResourceID = "[DSCRegistry]V-15706";
 ValueName = "ACSettingIndex";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Power\\PowerSettings\\0e796bdb-100d-47d6-a2d5-f7d2daa51f51";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::562::3::DSCRegistry";
 RuleNumber = "V-15706";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15706' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry51ref
{
ResourceID = "[DSCRegistry]V-3470";
 ValueName = "fAllowUnsolicited";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::573::3::DSCRegistry";
 RuleNumber = "V-3470";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3470' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry52ref
{
ResourceID = "[DSCRegistry]V-3343";
 ValueName = "fAllowToGetHelp";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::584::3::DSCRegistry";
 RuleNumber = "V-3343";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3343' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry53ref
{
ResourceID = "[DSCRegistry]V-15707";
 ValueName = "LoggingEnabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::595::3::DSCRegistry";
 RuleNumber = "V-15707";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15707' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry53ref
{
ResourceID = "[DSCRegistry]V-15707";
 ValueName = "LoggingEnabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::595::3::DSCRegistry";
 RuleNumber = "V-15707";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15707' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry54ref
{
ResourceID = "[DSCRegistry]V-14254";
 ValueName = "EnableAuthEpResolution";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Rpc";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::606::9::DSCRegistry";
 RuleNumber = "V-14254";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14254' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry55ref
{
ResourceID = "[DSCRegistry]V-14253";
 ValueName = "RestrictRemoteClients";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Rpc";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::617::9::DSCRegistry";
 RuleNumber = "V-14253";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14253' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry56ref
{
ResourceID = "[DSCRegistry]V-36696";
 ValueName = "DisablePcaUI";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\AppCompat";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::628::9::DSCRegistry";
 RuleNumber = "V-36696";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36696' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry57ref
{
ResourceID = "[DSCRegistry]V-21967";
 ValueName = "DisableQueryRemoteServer";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\ScriptedDiagnosticsProvider\\Policy";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::639::9::DSCRegistry";
 RuleNumber = "V-21967";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21967' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry58ref
{
ResourceID = "[DSCRegistry]V-21969";
 ValueName = "EnableQueryRemoteServer";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\ScriptedDiagnosticsProvider\\Policy";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::651::6::DSCRegistry";
 RuleNumber = "V-21969";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21969' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry59ref
{
ResourceID = "[DSCRegistry]V-21970";
 ValueName = "ScenarioExecutionEnabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WDI\\{\n            RuleNumber = \"9c5a40da-b965-4fc3-8781-88dd50a6299d}";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::662::9::DSCRegistry";
 RuleNumber = "V-21970";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21970' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry60ref
{
ResourceID = "[DSCRegistry]V-36697";
 ValueName = "AllowAllTrustedApps";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Appx";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::675::3::DSCRegistry";
 RuleNumber = "V-36697";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36697' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry61ref
{
ResourceID = "[DSCRegistry]V-21971";
 ValueName = "DisableInventory";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\AppCompat";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::686::8::DSCRegistry";
 RuleNumber = "V-21971";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21971' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry62ref
{
ResourceID = "[DSCRegistry]V-21973";
 ValueName = "NoAutoplayfornonVolume";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::697::9::DSCRegistry";
 RuleNumber = "V-21973";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21973' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry63ref
{
ResourceID = "[DSCRegistry]V-22692";
 ValueName = "NoAutorun";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::708::3::DSCRegistry";
 RuleNumber = "V-22692";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-22692' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry64ref
{
ResourceID = "[DSCRegistry]V-36698";
 ValueName = "Enabled";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Biometrics";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::719::9::DSCRegistry";
 RuleNumber = "V-36698";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36698' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry65ref
{
ResourceID = "[DSCRegistry]V-36700";
 ValueName = "DisablePasswordReveal";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\CredUI";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::730::9::DSCRegistry";
 RuleNumber = "V-36700";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36700' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of CustomRegistry as $CustomRegistry1ref
{
ResourceID = "[CustomRegistry]V-26579";
 Minimum = "32768";
 Registry = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-26579";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Application";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-26579' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of CustomRegistry as $CustomRegistry2ref
{
ResourceID = "[CustomRegistry]V-26580";
 Minimum = "196608";
 Registry = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::751::2::CustomRegistry";
 RuleNumber = "V-26580";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Security";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-26580' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of CustomRegistry as $CustomRegistry3ref
{
ResourceID = "[CustomRegistry]V-26581";
 Minimum = "32768";
 Registry = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::761::2::CustomRegistry";
 RuleNumber = "V-26581";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Setup";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-26581' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of CustomRegistry as $CustomRegistry4ref
{
ResourceID = "[CustomRegistry]V-26582";
 Minimum = "32768";
 Registry = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::771::2::CustomRegistry";
 RuleNumber = "V-26582";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\System";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-26582' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry66ref
{
ResourceID = "[DSCRegistry]V-36707";
 ValueName = "EnableSmartScreen";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::781::3::DSCRegistry";
 RuleNumber = "V-36707";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36707' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry67ref
{
ResourceID = "[DSCRegistry]V-21980";
 ValueName = "NoDataExecutionPrevention";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::792::3::DSCRegistry";
 RuleNumber = "V-21980";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21980' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry68ref
{
ResourceID = "[DSCRegistry]V-15718";
 ValueName = "NoHeapTerminationOnCorruption";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::803::3::DSCRegistry";
 RuleNumber = "V-15718";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15718' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry69ref
{
ResourceID = "[DSCRegistry]V-15683";
 ValueName = "PreXPSP2ShellProtocolBehavior";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::814::3::DSCRegistry";
 RuleNumber = "V-15683";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15683' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry70ref
{
ResourceID = "[DSCRegistry]V-36708";
 ValueName = "DisableLocation";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LocationAndSensors";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::825::3::DSCRegistry";
 RuleNumber = "V-36708";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36708' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry71ref
{
ResourceID = "[DSCRegistry]V-14247";
 ValueName = "DisablePasswordSaving";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::836::3::DSCRegistry";
 RuleNumber = "V-14247";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14247' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry72ref
{
ResourceID = "[DSCRegistry]V-14249";
 ValueName = "fDisableCdm";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::847::3::DSCRegistry";
 RuleNumber = "V-14249";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14249' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry73ref
{
ResourceID = "[DSCRegistry]V-3453";
 ValueName = "fPromptForPassword";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::858::3::DSCRegistry";
 RuleNumber = "V-3453";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3453' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry74ref
{
ResourceID = "[DSCRegistry]V-3454";
 ValueName = "MinEncryptionLevel";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::869::3::DSCRegistry";
 RuleNumber = "V-3454";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3454' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry75ref
{
ResourceID = "[DSCRegistry]V-3458";
 ValueName = "MaxIdleTime";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::880::9::DSCRegistry";
 RuleNumber = "V-3458";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "900000";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3458' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry76ref
{
ResourceID = "[DSCRegistry]V-3457";
 ValueName = "MaxDisconnectionTime";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::891::3::DSCRegistry";
 RuleNumber = "V-3457";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "60000";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3457' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry77ref
{
ResourceID = "[DSCRegistry]V-3456";
 ValueName = "DeleteTempDirsOnExit";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::902::3::DSCRegistry";
 RuleNumber = "V-3456";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3456' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry78ref
{
ResourceID = "[DSCRegistry]V-3455";
 ValueName = "PerSessionTempDir";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::913::3::DSCRegistry";
 RuleNumber = "V-3455";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3455' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry79ref
{
ResourceID = "[DSCRegistry]V-15682";
 ValueName = "DisableEnclosureDownload";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Internet Explorer\\Feeds";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::924::3::DSCRegistry";
 RuleNumber = "V-15682";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15682' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry80ref
{
ResourceID = "[DSCRegistry]V-36709";
 ValueName = "AllowBasicAuthInClear";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Internet Explorer\\Feeds";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::935::9::DSCRegistry";
 RuleNumber = "V-36709";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36709' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry81ref
{
ResourceID = "[DSCRegistry]V-15713";
 ValueName = "SpyNetReporting";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows Defender\\Spynet";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::946::9::DSCRegistry";
 RuleNumber = "V-15713";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15713' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry82ref
{
ResourceID = "[DSCRegistry]V-15714";
 ValueName = "LoggingDisabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::957::9::DSCRegistry";
 RuleNumber = "V-15714";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15714' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry83ref
{
ResourceID = "[DSCRegistry]V-15715";
 ValueName = "Disabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::968::9::DSCRegistry";
 RuleNumber = "V-15715";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15715' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry84ref
{
ResourceID = "[DSCRegistry]V-15717";
 ValueName = "DontSendAdditionalData";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::979::3::DSCRegistry";
 RuleNumber = "V-15717";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15717' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry85ref
{
ResourceID = "[DSCRegistry]V-15685";
 ValueName = "EnableUserControl";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::990::3::DSCRegistry";
 RuleNumber = "V-15685";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15685' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry86ref
{
ResourceID = "[DSCRegistry]V-34974";
 ValueName = "AlwaysInstallElevated";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1001::3::DSCRegistry";
 RuleNumber = "V-34974";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-34974' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry87ref
{
ResourceID = "[DSCRegistry]V-15684";
 ValueName = "SafeForScripting";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1013::3::DSCRegistry";
 RuleNumber = "V-15684";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15684' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry88ref
{
ResourceID = "[DSCRegistry]V-15686";
 ValueName = "DisableLUAPatching";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1024::3::DSCRegistry";
 RuleNumber = "V-15686";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15686' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry89ref
{
ResourceID = "[DSCRegistry]V-15719";
 ValueName = "ReportControllerMissing";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1035::3::DSCRegistry";
 RuleNumber = "V-15719";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15719' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry90ref
{
ResourceID = "[DSCRegistry]V-15722";
 ValueName = "DisableOnline";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\WMDRM";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1046::3::DSCRegistry";
 RuleNumber = "V-15722";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15722' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry91ref
{
ResourceID = "[DSCRegistry]V-15687";
 ValueName = "GroupPrivacyAcceptance";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\WindowsMediaPlayer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1057::9::DSCRegistry";
 RuleNumber = "V-15687";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15687' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry92ref
{
ResourceID = "[DSCRegistry]V-3480";
 ValueName = "DisableAutoupdate";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\WindowsMediaPlayer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1068::3::DSCRegistry";
 RuleNumber = "V-3480";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3480' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry93ref
{
ResourceID = "[DSCRegistry]V-36712";
 ValueName = "AllowBasic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Client";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1078::9::DSCRegistry";
 RuleNumber = "V-36712";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36712' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry94ref
{
ResourceID = "[DSCRegistry]V-36713";
 ValueName = "AllowUnencryptedTraffic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Client";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1090::3::DSCRegistry";
 RuleNumber = "V-36713";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36713' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry95ref
{
ResourceID = "[DSCRegistry]V-36714";
 ValueName = "AllowDigest";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Client";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1101::3::DSCRegistry";
 RuleNumber = "V-36714";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36714' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry96ref
{
ResourceID = "[DSCRegistry]V-36718";
 ValueName = "AllowBasic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Service";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1112::3::DSCRegistry";
 RuleNumber = "V-36718";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36718' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry97ref
{
ResourceID = "[DSCRegistry]V-36719";
 ValueName = "AllowUnencryptedTraffic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Service";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1124::3::DSCRegistry";
 RuleNumber = "V-36719";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36719' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry98ref
{
ResourceID = "[DSCRegistry]V-36720";
 ValueName = "DisableRunAs";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Service";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1135::3::DSCRegistry";
 RuleNumber = "V-36720";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36720' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry99ref
{
ResourceID = "[DSCRegistry]V-4447";
 ValueName = "fEncryptRPCTraffic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1146::3::DSCRegistry";
 RuleNumber = "V-4447";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-4447' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry100ref
{
ResourceID = "[DSCRegistry]V-3449";
 ValueName = "fSingleSessionPerUser";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1156::9::DSCRegistry";
 RuleNumber = "V-3449";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3449' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry101ref
{
ResourceID = "[DSCRegistry]V-15997";
 ValueName = "fDisableCcm";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1167::3::DSCRegistry";
 RuleNumber = "V-15997";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15997' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry102ref
{
ResourceID = "[DSCRegistry]V-15998";
 ValueName = "fDisableLPT";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1178::3::DSCRegistry";
 RuleNumber = "V-15998";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15998' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry103ref
{
ResourceID = "[DSCRegistry]V-16000";
 ValueName = "fEnableSmartCard";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1189::3::DSCRegistry";
 RuleNumber = "V-16000";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-16000' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry104ref
{
ResourceID = "[DSCRegistry]V-15999";
 ValueName = "fDisablePNPRedir";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1200::3::DSCRegistry";
 RuleNumber = "V-15999";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15999' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry105ref
{
ResourceID = "[DSCRegistry]V-16005";
 ValueName = "NoDisconnect";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1211::3::DSCRegistry";
 RuleNumber = "V-16005";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-16005' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry106ref
{
ResourceID = "[DSCRegistry]V-3344";
 ValueName = "LimitBlankPasswordUse";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1222::9::DSCRegistry";
 RuleNumber = "V-3344";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3344' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry107ref
{
ResourceID = "[DSCRegistry]V-14228";
 ValueName = "AuditBaseObjects";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1233::9::DSCRegistry";
 RuleNumber = "V-14228";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14228' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry108ref
{
ResourceID = "[DSCRegistry]V-14229";
 ValueName = "FullPrivilegeAuditing";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1244::9::DSCRegistry";
 RuleNumber = "V-14229";
 ValueType = "Binary";
 ModuleName = "xDSCRegistry";
 ValueData = "00 ";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14229' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry109ref
{
ResourceID = "[DSCRegistry]V-14230";
 ValueName = "SCENoApplyLegacyAuditPolicy";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1256::9::DSCRegistry";
 RuleNumber = "V-14230";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14230' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry110ref
{
ResourceID = "[DSCRegistry]V-1171";
 ValueName = "AllocateDASD";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1267::9::DSCRegistry";
 RuleNumber = "V-1171";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1171' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry111ref
{
ResourceID = "[DSCRegistry]V-6831";
 ValueName = "RequireSignOrSeal";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1279::3::DSCRegistry";
 RuleNumber = "V-6831";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-6831' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry112ref
{
ResourceID = "[DSCRegistry]V-1163";
 ValueName = "SealSecureChannel";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1291::3::DSCRegistry";
 RuleNumber = "V-1163";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1163' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry113ref
{
ResourceID = "[DSCRegistry]V-1164";
 ValueName = "SignSecureChannel";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1303::3::DSCRegistry";
 RuleNumber = "V-1164";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1164' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry114ref
{
ResourceID = "[DSCRegistry]V-1165";
 ValueName = "DisablePasswordChange";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1315::9::DSCRegistry";
 RuleNumber = "V-1165";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1165' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry115ref
{
ResourceID = "[DSCRegistry]V-3373";
 ValueName = "MaximumPasswordAge";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1326::3::DSCRegistry";
 RuleNumber = "V-3373";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "30";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3373' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry116ref
{
ResourceID = "[DSCRegistry]V-3374";
 ValueName = "RequireStrongKey";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1337::3::DSCRegistry";
 RuleNumber = "V-3374";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3374' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry117ref
{
ResourceID = "[DSCRegistry]V-11806";
 ValueName = "DontDisplayLastUserName";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1349::3::DSCRegistry";
 RuleNumber = "V-11806";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-11806' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry118ref
{
ResourceID = "[DSCRegistry]V-1154";
 ValueName = "DisableCAD";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1362::3::DSCRegistry";
 RuleNumber = "V-1154";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1154' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry119ref
{
ResourceID = "[DSCRegistry]V-36773";
 ValueName = "InactivityTimeoutSecs";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1374::3::DSCRegistry";
 RuleNumber = "V-36773";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "900";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36773' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of CustomRegistry as $CustomRegistry5ref
{
ResourceID = "[CustomRegistry]V-1089";
 RuleStatus = "Default";
 Registry = "LegalNoticeText";
 ValueType = "STRING";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1386::3::CustomRegistry";
 RuleNumber = "V-1089";
 DesiredValue = "You are accessing a Private Information System, all rights reserved";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1089' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of CustomRegistry as $CustomRegistry6ref
{
ResourceID = "[CustomRegistry]V-26359";
 RuleStatus = "Default";
 Registry = "LegalNoticeCaption";
 ValueType = "STRING";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1396::3::CustomRegistry";
 RuleNumber = "V-26359";
 DesiredValue = "Notice and Consent Banner";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-26359' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of CustomRegistry as $CustomRegistry7ref
{
ResourceID = "[CustomRegistry]V-1090";
 RuleStatus = "Default";
 Registry = "CachedLogonsCount";
 ValueType = "STRING";
 Maximum = "4";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1406::3::CustomRegistry";
 RuleNumber = "V-1090";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1090' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of CustomRegistry as $CustomRegistry8ref
{
ResourceID = "[CustomRegistry]V-1172";
 Minimum = "14";
 Registry = "PasswordExpiryWarning";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1416::3::CustomRegistry";
 RuleNumber = "V-1172";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1172' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of CustomRegistry as $CustomRegistry9ref
{
ResourceID = "[CustomRegistry]V-1157";
 Minimum = "1";
 Registry = "SCRemoveOption";
 ValueType = "STRING";
 Maximum = "2";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1426::5::CustomRegistry";
 RuleNumber = "V-1157";
 DesiredValue = "";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1157' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry120ref
{
ResourceID = "[DSCRegistry]V-6832";
 ValueName = "RequireSecuritySignature";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanmanWorkstation\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1438::3::DSCRegistry";
 RuleNumber = "V-6832";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-6832' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry121ref
{
ResourceID = "[DSCRegistry]V-1166";
 ValueName = "EnableSecuritySignature";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanmanWorkstation\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1449::3::DSCRegistry";
 RuleNumber = "V-1166";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1166' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry122ref
{
ResourceID = "[DSCRegistry]V-1141";
 ValueName = "EnablePlainTextPassword";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanmanWorkstation\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1460::3::DSCRegistry";
 RuleNumber = "V-1141";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1141' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of CustomRegistry as $CustomRegistry10ref
{
ResourceID = "[CustomRegistry]V-1174";
 RuleStatus = "Default";
 Registry = "AutoDisconnect";
 ValueType = "Dword";
 Maximum = "15";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1471::9::CustomRegistry";
 RuleNumber = "V-1174";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1174' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry123ref
{
ResourceID = "[DSCRegistry]V-6833";
 ValueName = "RequireSecuritySignature";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1481::9::DSCRegistry";
 RuleNumber = "V-6833";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-6833' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry124ref
{
ResourceID = "[DSCRegistry]V-1162";
 ValueName = "EnableSecuritySignature1";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1493::9::DSCRegistry";
 RuleNumber = "V-1162";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1162' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry125ref
{
ResourceID = "[DSCRegistry]V-1136";
 ValueName = "EnableForcedLogoff";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1504::3::DSCRegistry";
 RuleNumber = "V-1136";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1136' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry126ref
{
ResourceID = "[DSCRegistry]V-21950";
 ValueName = "SmbServerNameHardeningLevel";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1515::3::DSCRegistry";
 RuleNumber = "V-21950";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21950' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry127ref
{
ResourceID = "[DSCRegistry]V-1145";
 ValueName = "AutoAdminLogon";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1527::3::DSCRegistry";
 RuleNumber = "V-1145";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1145' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry128ref
{
ResourceID = "[DSCRegistry]V-21955";
 ValueName = "DisableIpSourceRouting";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip6\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1539::3::DSCRegistry";
 RuleNumber = "V-21955";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21955' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry129ref
{
ResourceID = "[DSCRegistry]V-4110";
 ValueName = "DisableIPSourceRouting";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1551::3::DSCRegistry";
 RuleNumber = "V-4110";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";
};
'  ; 

  if create_mof ( v_str , 'V-4110' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry130ref
{
ResourceID = "[DSCRegistry]V-4111";
 ValueName = "EnableICMPRedirect";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1562::3::DSCRegistry";
 RuleNumber = "V-4111";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-4111' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of CustomRegistry as $CustomRegistry11ref
{
ResourceID = "[CustomRegistry]V-4113";
 RuleStatus = "Default";
 Registry = "KeepAliveTime";
 ValueType = "Dword";
 Maximum = "300000";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1573::9::CustomRegistry";
 RuleNumber = "V-4113";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-4113' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry131ref
{
ResourceID = "[DSCRegistry]V-14232";
 ValueName = "NoDefaultExempt";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\IPSEC";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1583::3::DSCRegistry";
 RuleNumber = "V-14232";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14232' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry132ref
{
ResourceID = "[DSCRegistry]V-4116";
 ValueName = "NoNameReleaseOnDemand";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netbt\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1594::3::DSCRegistry";
 RuleNumber = "V-4116";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-4116' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry133ref
{
ResourceID = "[DSCRegistry]V-4112";
 ValueName = "PerformRouterDiscovery";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1606::3::DSCRegistry";
 RuleNumber = "V-4112";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-4112' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry134ref
{
ResourceID = "[DSCRegistry]V-3479";
 ValueName = "SafeDllSearchMode";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1617::3::DSCRegistry";
 RuleNumber = "V-3479";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3479' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry135ref
{
ResourceID = "[DSCRegistry]V-4442";
 ValueName = "ScreenSaverGracePeriod";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1629::3::DSCRegistry";
 RuleNumber = "V-4442";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "5";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-4442' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry136ref
{
ResourceID = "[DSCRegistry]V-21956";
 ValueName = "TcpMaxDataRetransmissions";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip6\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1641::3::DSCRegistry";
 RuleNumber = "V-21956";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21956' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry137ref
{
ResourceID = "[DSCRegistry]V-4438";
 ValueName = "TcpMaxDataRetransmissions";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1653::3::DSCRegistry";
 RuleNumber = "V-4438";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-4438' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of CustomRegistry as $CustomRegistry12ref
{
ResourceID = "[CustomRegistry]V-4108";
 RuleStatus = "Default";
 Registry = "WarningLevel";
 ValueType = "Dword";
 Maximum = "90";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1664::3::CustomRegistry";
 RuleNumber = "V-4108";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\System\\CurrentControlSet\\Services\\Eventlog\\Security";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-4108' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry138ref
{
ResourceID = "[DSCRegistry]V-26283";
 ValueName = "RestrictAnonymousSAM";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1674::3::DSCRegistry";
 RuleNumber = "V-26283";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-26283' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry139ref
{
ResourceID = "[DSCRegistry]V-1093";
 ValueName = "RestrictAnonymous";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1685::3::DSCRegistry";
 RuleNumber = "V-1093";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1093' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry140ref
{
ResourceID = "[DSCRegistry]V-3376";
 ValueName = "DisableDomainCreds";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1696::3::DSCRegistry";
 RuleNumber = "V-3376";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3376' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry141ref
{
ResourceID = "[DSCRegistry]V-3377";
 ValueName = "EveryoneIncludesAnonymous";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1707::3::DSCRegistry";
 RuleNumber = "V-3377";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3377' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry142ref
{
ResourceID = "[DSCRegistry]V-3338";
 ValueName = "NullSessionPipes";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1718::3::DSCRegistry";
 RuleNumber = "V-3338";
 ValueType = "MultiString";
 ModuleName = "xDSCRegistry";
 ValueData = "";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3338' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry143ref
{
ResourceID = "[DSCRegistry]V-3339";
 ValueName = "Machine";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\SecurePipeServers\\Winreg\\AllowedExactPaths";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1729::9::DSCRegistry";
 RuleNumber = "V-3339";
 ValueType = "MultiString";
 ModuleName = "xDSCRegistry";
 ValueData = "System\\CurrentControlSet\\Control\\ProductOptions\n			 System\\CurrentControlSet\\Control\\Server Applications\n			 Software\\Microsoft\\Windows NT\\CurrentVersion";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3339' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry144ref
{
ResourceID = "[DSCRegistry]V-4443";
 ValueName = "Machine";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\SecurePipeServers\\Winreg\\AllowedPaths";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1742::3::DSCRegistry";
 RuleNumber = "V-4443";
 ValueType = "MultiString";
 ModuleName = "xDSCRegistry";
 ValueData = "Software\\Microsoft\\OLAP Server\n			 Software\\Microsoft\\Windows NT\\CurrentVersion\\Perflib\n			 Software\\Microsoft\\Windows NT\\CurrentVersion\\Print\n			 Software\\Microsoft\\Windows NT\\CurrentVersion\\Windows\n			 System\\CurrentControlSet\\Control\\ContentIndex\n			 System\\CurrentControlSet\\Control\\Print\\Printers\n			 System\\CurrentControlSet\\Control\\Terminal Server\n			 System\\CurrentControlSet\\Control\\Terminal Server\\UserConfig\n			 System\\CurrentControlSet\\Control\\Terminal Server\\DefaultUserConfiguration\n			 System\\CurrentControlSet\\Services\\Eventlog\n			 System\\CurrentControlSet\\Services\\Sysmonlog";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-4443' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry145ref
{
ResourceID = "[DSCRegistry]V-6834";
 ValueName = "RestrictNullSessAccess";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1764::9::DSCRegistry";
 RuleNumber = "V-6834";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-6834' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry146ref
{
ResourceID = "[DSCRegistry]V-3340";
 ValueName = "NullSessionShares";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1775::3::DSCRegistry";
 RuleNumber = "V-3340";
 ValueType = "MultiString";
 ModuleName = "xDSCRegistry";
 ValueData = "";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3340' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry147ref
{
ResourceID = "[DSCRegistry]V-3378";
 ValueName = "ForceGuest";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1786::3::DSCRegistry";
 RuleNumber = "V-3378";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3378' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry148ref
{
ResourceID = "[DSCRegistry]V-21951";
 ValueName = "UseMachineId";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\LSA";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1796::3::DSCRegistry";
 RuleNumber = "V-21951";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21951' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry149ref
{
ResourceID = "[DSCRegistry]V-21952";
 ValueName = "allownullsessionfallback";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\LSA\\MSV1_0";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1807::3::DSCRegistry";
 RuleNumber = "V-21952";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21952' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry150ref
{
ResourceID = "[DSCRegistry]V-3379";
 ValueName = "NoLMHash";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1818::9::DSCRegistry";
 RuleNumber = "V-3379";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3379' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry151ref
{
ResourceID = "[DSCRegistry]V-1153";
 ValueName = "LmCompatibilityLevel";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1829::3::DSCRegistry";
 RuleNumber = "V-1153";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "5";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1153' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry152ref
{
ResourceID = "[DSCRegistry]V-3381";
 ValueName = "LDAPClientIntegrity";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LDAP";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1840::3::DSCRegistry";
 RuleNumber = "V-3381";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3381' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry153ref
{
ResourceID = "[DSCRegistry]V-3382";
 ValueName = "NTLMMinClientSec";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa\\MSV1_0";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1851::3::DSCRegistry";
 RuleNumber = "V-3382";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "537395200";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3382' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry154ref
{
ResourceID = "[DSCRegistry]V-3666";
 ValueName = "NTLMMinServerSec";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa\\MSV1_0";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1862::3::DSCRegistry";
 RuleNumber = "V-3666";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "537395200";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3666' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry155ref
{
ResourceID = "[DSCRegistry]V-1159";
 ValueName = "SecurityLevel";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Setup\\RecoveryConsole";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1873::9::DSCRegistry";
 RuleNumber = "V-1159";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1159' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry156ref
{
ResourceID = "[DSCRegistry]V-1158";
 ValueName = "SetCommand";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Setup\\RecoveryConsole";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1884::3::DSCRegistry";
 RuleNumber = "V-1158";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1158' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry157ref
{
ResourceID = "[DSCRegistry]V-1075";
 ValueName = "ShutdownWithoutLogon";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1895::3::DSCRegistry";
 RuleNumber = "V-1075";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; if create_mof ( v_str , 'V-1075' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry158ref
{
ResourceID = "[DSCRegistry]V-3383";
 ValueName = "Enabled";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa\\FIPSAlgorithmPolicy";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1906::5::DSCRegistry";
 RuleNumber = "V-3383";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3383' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry159ref
{
ResourceID = "[DSCRegistry]V-3385";
 ValueName = "ObCaseInsensitive";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager\\Kernel";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1917::3::DSCRegistry";
 RuleNumber = "V-3385";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3385' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry160ref
{
ResourceID = "[DSCRegistry]V-1173";
 ValueName = "ProtectionMode";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1928::3::DSCRegistry";
 RuleNumber = "V-1173";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1173' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry161ref
{
ResourceID = "[DSCRegistry]V-14234";
 ValueName = "FilterAdministratorToken";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1939::3::DSCRegistry";
 RuleNumber = "V-14234";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14234' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry162ref
{
ResourceID = "[DSCRegistry]V-14235";
 ValueName = "ConsentPromptBehaviorAdmin";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1950::3::DSCRegistry";
 RuleNumber = "V-14235";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14235' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry163ref
{
ResourceID = "[DSCRegistry]V-14236";
 ValueName = "ConsentPromptBehaviorUser";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1961::3::DSCRegistry";
 RuleNumber = "V-14236";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14236' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry164ref
{
ResourceID = "[DSCRegistry]V-14237";
 ValueName = "EnableInstallerDetection";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1972::3::DSCRegistry";
 RuleNumber = "V-14237";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14237' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry165ref
{
ResourceID = "[DSCRegistry]V-16008";
 ValueName = "ValidateAdminCodeSignatures";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1983::3::DSCRegistry";
 RuleNumber = "V-16008";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-16008' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry166ref
{
ResourceID = "[DSCRegistry]V-14239";
 ValueName = "EnableSecureUIAPaths";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1994::3::DSCRegistry";
 RuleNumber = "V-14239";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14239' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry167ref
{
ResourceID = "[DSCRegistry]V-14240";
 ValueName = "EnableLUA";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2005::9::DSCRegistry";
 RuleNumber = "V-14240";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14240' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry168ref
{
ResourceID = "[DSCRegistry]V-14241";
 ValueName = "PromptOnSecureDesktop";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2016::3::DSCRegistry";
 RuleNumber = "V-14241";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14241' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry169ref
{
ResourceID = "[DSCRegistry]V-14242";
 ValueName = "EnableVirtualization";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2027::3::DSCRegistry";
 RuleNumber = "V-14242";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14242' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry170ref
{
ResourceID = "[DSCRegistry]V-15991";
 ValueName = "EnableUIADesktopToggle";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2038::3::DSCRegistry";
 RuleNumber = "V-15991";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15991' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry171ref
{
ResourceID = "[DSCRegistry]V-4446";
 ValueName = "AuthenticodeEnabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Safer\\CodeIdentifiers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2049::3::DSCRegistry";
 RuleNumber = "V-4446";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-4446' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry172ref
{
ResourceID = "[DSCRegistry]V-4445";
 ValueName = "Optional";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager\\Subsystems";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2060::3::DSCRegistry";
 RuleNumber = "V-4445";
 ValueType = "MultiString";
 ModuleName = "xDSCRegistry";
 ValueData = "";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-4445' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry173ref
{
ResourceID = "[DSCRegistry]V-1151";
 ValueName = "AddPrinterDrivers";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Print\\Providers\\LanMan Print Services\\Servers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2071::3::DSCRegistry";
 RuleNumber = "V-1151";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1151' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry174ref
{
ResourceID = "[DSCRegistry]V-2374";
 ValueName = "NoDriveTypeAutoRun";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2084::3::DSCRegistry";
 RuleNumber = "V-2374";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "255";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-2374' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry175ref
{
ResourceID = "[DSCRegistry]V-14243";
 ValueName = "EnumerateAdministrators";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\CredUI";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2095::5::DSCRegistry";
 RuleNumber = "V-14243";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14243' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry176ref
{
ResourceID = "[DSCRegistry]V-36439";
 ValueName = "LocalAccountTokenFilterPolicy";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2106::5::DSCRegistry";
 RuleNumber = "V-36439";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-36439' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry177ref
{
ResourceID = "[DSCRegistry]V-21953";
 ValueName = "AllowOnlineID";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\LSA\\pku2u\\";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2117::5::DSCRegistry";
 RuleNumber = "V-21953";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21953' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry178ref
{
ResourceID = "[DSCRegistry]V-21954";
 ValueName = "SupportedEncryptionTypes";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\Kerberos\\Parameters\\";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2128::5::DSCRegistry";
 RuleNumber = "V-21954";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21954' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry179ref
{
ResourceID = "[DSCRegistry]V-57453";
 ValueName = "BypassDataThrottling";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2139::5::DSCRegistry";
 RuleNumber = "V-57453";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-57453' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry180ref
{
ResourceID = "[DSCRegistry]V-57455";
 ValueName = "DontShowUI";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2150::7::DSCRegistry";
 RuleNumber = "V-57455";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-57455' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry181ref
{
ResourceID = "[DSCRegistry]V-57463";
 ValueName = "DisableArchive";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2161::7::DSCRegistry";
 RuleNumber = "V-57463";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-57463' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry182ref
{
ResourceID = "[DSCRegistry]V-57465";
 ValueName = "ConfigureArchive";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2172::7::DSCRegistry";
 RuleNumber = "V-57465";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-57465' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of CustomRegistry as $CustomRegistry13ref
{
ResourceID = "[CustomRegistry]V-57467";
 Minimum = "100";
 Registry = "MaxArchiveCount";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2183::5::CustomRegistry";
 RuleNumber = "V-57467";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-57467' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry183ref
{
ResourceID = "[DSCRegistry]V-57469";
 ValueName = "DisableQueue";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2193::7::DSCRegistry";
 RuleNumber = "V-57469";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-57469' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry184ref
{
ResourceID = "[DSCRegistry]V-57471";
 ValueName = "ForceQueue";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2204::7::DSCRegistry";
 RuleNumber = "V-57471";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-57471' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of CustomRegistry as $CustomRegistry14ref
{
ResourceID = "[CustomRegistry]V-57473";
 Minimum = "50";
 Registry = "MaxQueueCount";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2215::5::CustomRegistry";
 RuleNumber = "V-57473";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-57473' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry185ref
{
ResourceID = "[DSCRegistry]V-57475";
 ValueName = "QueuePesterInterval";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2225::7::DSCRegistry";
 RuleNumber = "V-57475";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-57475' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry186ref
{
ResourceID = "[DSCRegistry]V-57477";
 ValueName = "DefaultConsent";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting\\Consent";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2236::7::DSCRegistry";
 RuleNumber = "V-57477";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "4";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-57477' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry187ref
{
ResourceID = "[DSCRegistry]V-57479";
 ValueName = "DefaultOverrideBehavior";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting\\Consent";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2247::7::DSCRegistry";
 RuleNumber = "V-57479";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-57479' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry188ref
{
ResourceID = "[DSCRegistry]V-57639";
 ValueName = "ForceKeyProtection";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Cryptography";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2258::7::DSCRegistry";
 RuleNumber = "V-57639";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-57639' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege1ref
{
ResourceID = "[Privilege]V-26469";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2272::9::Privilege";
 RuleNumber = "V-26469";
 ModuleName = "xPrivilege";
 Privilege = "SeTrustedCredManAccessPrivilege";
 Operation = "Remove All";
};'  ; 

  if create_mof ( v_str , 'V-26469' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege2ref
{
ResourceID = "[Privilege]V-26470";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "BUILTIN\\Authenticated Users"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2280::9::Privilege";
 RuleNumber = "V-26470";
 ModuleName = "xPrivilege";
 Privilege = "SeNetworkLogonRight";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26470' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege3ref
{
ResourceID = "[Privilege]V-1102";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2290::9::Privilege";
 RuleNumber = "V-1102";
 ModuleName = "xPrivilege";
 Privilege = "SeTcbPrivilege";
 Operation = "Remove All";
};'  ; 

  if create_mof ( v_str , 'V-1102' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege4ref
{
ResourceID = "[Privilege]V-26471";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Authority\\Local Service",
    "NT Authority\\Network Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2298::9::Privilege";
 RuleNumber = "V-26471";
 ModuleName = "xPrivilege";
 Privilege = "SeIncreaseQuotaPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26471' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege5ref
{
ResourceID = "[Privilege]V-26472";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2307::9::Privilege";
 RuleNumber = "V-26472";
 ModuleName = "xPrivilege";
 Privilege = "SeInteractiveLogonRight";
 Operation = "Allow Only";
};
'  ; 

  if create_mof ( v_str , 'V-26472' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege6ref
{
ResourceID = "[Privilege]V-26473";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2316::9::Privilege";
 RuleNumber = "V-26473";
 ModuleName = "xPrivilege";
 Privilege = "SeRemoteInteractiveLogonRight";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26473' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege7ref
{
ResourceID = "[Privilege]V-26474";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2325::9::Privilege";
 RuleNumber = "V-26474";
 ModuleName = "xPrivilege";
 Privilege = "SeBackupPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26474' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege8ref
{
ResourceID = "[Privilege]V-26475";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "BUILTIN\\Authenticated Users",
    "NT AUTHORITY\\LOCAL SERVICE",
    "NT AUTHORITY\\NETWORK SERVICE",
    "Window Manager\\Window Manager Group"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2334::9::Privilege";
 RuleNumber = "V-26475";
 ModuleName = "xPrivilege";
 Privilege = "SeChangeNotifyPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26475' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege9ref
{
ResourceID = "[Privilege]V-26476";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Authority\\Local Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2343::9::Privilege";
 RuleNumber = "V-26476";
 ModuleName = "xPrivilege";
 Privilege = "SeSystemtimePrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26476' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege10ref
{
ResourceID = "[Privilege]V-26477";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Authority\\Local Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2352::9::Privilege";
 RuleNumber = "V-26477";
 ModuleName = "xPrivilege";
 Privilege = "SeTimeZonePrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26477' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege11ref
{
ResourceID = "[Privilege]V-26478";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2360::9::Privilege";
 RuleNumber = "V-26478";
 ModuleName = "xPrivilege";
 Privilege = "SeCreatePagefilePrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26478' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege12ref
{
ResourceID = "[Privilege]V-26479";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2370::9::Privilege";
 RuleNumber = "V-26479";
 ModuleName = "xPrivilege";
 Privilege = "SeCreateTokenPrivilege";
 Operation = "Remove All";
};'  ; 

  if create_mof ( v_str , 'V-26479' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege13ref
{
ResourceID = "[Privilege]V-26480";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Authority\\Service",
    "NT Authority\\Local Service",
    "NT Authority\\Network Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2378::9::Privilege";
 RuleNumber = "V-26480";
 ModuleName = "xPrivilege";
 Privilege = "SeCreateGlobalPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26480' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege14ref
{
ResourceID = "[Privilege]V-26481";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2387::9::Privilege";
 RuleNumber = "V-26481";
 ModuleName = "xPrivilege";
 Privilege = "SeCreatePermanentPrivilege";
 Operation = "Remove All";
};'  ; 

  if create_mof ( v_str , 'V-26481' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege15ref
{
ResourceID = "[Privilege]V-26482";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2395::9::Privilege";
 RuleNumber = "V-26482";
 ModuleName = "xPrivilege";
 Privilege = "SeCreateSymbolicLinkPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26482' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege16ref
{
ResourceID = "[Privilege]V-18010";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2404::9::Privilege";
 RuleNumber = "V-18010";
 ModuleName = "xPrivilege";
 Privilege = "SeDebugPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-18010' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege18ref
{
ResourceID = "[Privilege]V-26483";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2422::9::Privilege";
 RuleNumber = "V-26483";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyBatchLogonRight";
 Operation = "Add";
};'  ; 

  if create_mof ( v_str , 'V-26483' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege19ref
{
ResourceID = "[Privilege]V-26485";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2443::9::Privilege";
 RuleNumber = "V-26485";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyInteractiveLogonRight";
 Operation = "Add";
};'  ; 

  if create_mof ( v_str , 'V-26485' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege20ref
{
ResourceID = "[Privilege]V-26486";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2452::9::Privilege";
 RuleNumber = "V-26486";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyRemoteInteractiveLogonRight";
 Operation = "Add";
};'  ; 

  if create_mof ( v_str , 'V-26486' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege21ref
{
ResourceID = "[Privilege]V-26487";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2461::9::Privilege";
 RuleNumber = "V-26487";
 ModuleName = "xPrivilege";
 Privilege = "SeEnableDelegationPrivilege";
 Operation = "Remove All";
};'  ; 

  if create_mof ( v_str , 'V-26487' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege22ref
{
ResourceID = "[Privilege]V-26488";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2469::9::Privilege";
 RuleNumber = "V-26488";
 ModuleName = "xPrivilege";
 Privilege = "SeRemoteShutdownPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26488' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege23ref
{
ResourceID = "[Privilege]V-26489";
 RuleStatus = "Default";
 Members = {
    "NT Authority\\Local Service",
    "NT Authority\\Network Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2478::9::Privilege";
 RuleNumber = "V-26489";
 ModuleName = "xPrivilege";
 Privilege = "SeAuditPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26489' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege24ref
{
ResourceID = "[Privilege]V-26490";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Authority\\Service",
    "NT Authority\\Local Service",
    "NT Authority\\Network Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2487::9::Privilege";
 RuleNumber = "V-26490";
 ModuleName = "xPrivilege";
 Privilege = "SeImpersonatePrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26490' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege25ref
{
ResourceID = "[Privilege]V-26491";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Authority\\Local Service",
    "Window Manager\\Window Manager Group"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2496::9::Privilege";
 RuleNumber = "V-26491";
 ModuleName = "xPrivilege";
 Privilege = "SeIncreaseWorkingSetPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26491' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege26ref
{
ResourceID = "[Privilege]V-26492";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2505::9::Privilege";
 RuleNumber = "V-26492";
 ModuleName = "xPrivilege";
 Privilege = "SeIncreaseBasePriorityPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26492' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege27ref
{
ResourceID = "[Privilege]V-26493";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2514::9::Privilege";
 RuleNumber = "V-26493";
 ModuleName = "xPrivilege";
 Privilege = "SeLoadDriverPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26493' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege28ref
{
ResourceID = "[Privilege]V-26494";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2523::9::Privilege";
 RuleNumber = "V-26494";
 ModuleName = "xPrivilege";
 Privilege = "SeLockMemoryPrivilege";
 Operation = "Remove All";
};'  ; 

  if create_mof ( v_str , 'V-26494' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege29ref
{
ResourceID = "[Privilege]V-26495";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2531::9::Privilege";
 RuleNumber = "V-26495";
 ModuleName = "xPrivilege";
 Privilege = "SeBatchLogonRight";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26495' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege30ref
{
ResourceID = "[Privilege]V-26496";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2540::9::Privilege";
 RuleNumber = "V-26496";
 ModuleName = "xPrivilege";
 Privilege = "SeSecurityPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26496' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege31ref
{
ResourceID = "[Privilege]V-26497";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2549::9::Privilege";
 RuleNumber = "V-26497";
 ModuleName = "xPrivilege";
 Privilege = "SeRelabelPrivilege";
 Operation = "Remove All";
};'  ; 

  if create_mof ( v_str , 'V-26497' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege32ref
{
ResourceID = "[Privilege]V-26498";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2557::9::Privilege";
 RuleNumber = "V-26498";
 ModuleName = "xPrivilege";
 Privilege = "SeSystemEnvironmentPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26498' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege33ref
{
ResourceID = "[Privilege]V-26499";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2566::9::Privilege";
 RuleNumber = "V-26499";
 ModuleName = "xPrivilege";
 Privilege = "SeManageVolumePrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26499' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege34ref
{
ResourceID = "[Privilege]V-26500";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2575::9::Privilege";
 RuleNumber = "V-26500";
 ModuleName = "xPrivilege";
 Privilege = "SeProfileSingleProcessPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26500' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege35ref
{
ResourceID = "[Privilege]V-26501";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Service\\WdiServiceHost"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2584::9::Privilege";
 RuleNumber = "V-26501";
 ModuleName = "xPrivilege";
 Privilege = "SeSystemProfilePrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26501' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege36ref
{
ResourceID = "[Privilege]V-26503";
 RuleStatus = "Default";
 Members = {
    "NT Authority\\Local Service",
    "NT Authority\\Network Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2593::9::Privilege";
 RuleNumber = "V-26503";
 ModuleName = "xPrivilege";
 Privilege = "SeAssignPrimaryTokenPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26503' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege37ref
{
ResourceID = "[Privilege]V-26504";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2602::9::Privilege";
 RuleNumber = "V-26504";
 ModuleName = "xPrivilege";
 Privilege = "SeRestorePrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26504' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege38ref
{
ResourceID = "[Privilege]V-26505";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2611::9::Privilege";
 RuleNumber = "V-26505";
 ModuleName = "xPrivilege";
 Privilege = "SeShutdownPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26505' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Privilege as $Privilege39ref
{
ResourceID = "[Privilege]V-26506";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2620::9::Privilege";
 RuleNumber = "V-26506";
 ModuleName = "xPrivilege";
 Privilege = "SeTakeOwnershipPrivilege";
 Operation = "Allow Only";
};'  ; 

  if create_mof ( v_str , 'V-26506' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol1ref
{
ResourceID = "[AuditPol]V-26529";
 RuleStatus = "Default";
 AuditPolicy = "Credential Validation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2633::9::AuditPol";
 RuleNumber = "V-26529";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26529' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol2ref
{
ResourceID = "[AuditPol]V-26530";
 RuleStatus = "Default";
 AuditPolicy = "Credential Validation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2641::9::AuditPol";
 RuleNumber = "V-26530";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26530' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol3ref
{
ResourceID = "[AuditPol]V-26531";
 RuleStatus = "Default";
 AuditPolicy = "Computer Account Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2649::9::AuditPol";
 RuleNumber = "V-26531";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26531' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol4ref
{
ResourceID = "[AuditPol]V-26532";
 RuleStatus = "Default";
 AuditPolicy = "Computer Account Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2657::9::AuditPol";
 RuleNumber = "V-26532";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26532' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol5ref
{
ResourceID = "[AuditPol]V-26533";
 RuleStatus = "Default";
 AuditPolicy = "Other Account Management Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2665::9::AuditPol";
 RuleNumber = "V-26533";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26533' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol6ref
{
ResourceID = "[AuditPol]V-26534";
 RuleStatus = "Default";
 AuditPolicy = "Other Account Management Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2673::9::AuditPol";
 RuleNumber = "V-26534";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26534' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol7ref
{
ResourceID = "[AuditPol]V-26535";
 RuleStatus = "Default";
 AuditPolicy = "Security Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2681::9::AuditPol";
 RuleNumber = "V-26535";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26535' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol8ref
{
ResourceID = "[AuditPol]V-26536";
 RuleStatus = "Default";
 AuditPolicy = "Security Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2689::9::AuditPol";
 RuleNumber = "V-26536";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26536' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol9ref
{
ResourceID = "[AuditPol]V-26537";
 RuleStatus = "Default";
 AuditPolicy = "User Account Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2697::9::AuditPol";
 RuleNumber = "V-26537";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26537' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol10ref
{
ResourceID = "[AuditPol]V-26538";
 RuleStatus = "Default";
 AuditPolicy = "User Account Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2705::9::AuditPol";
 RuleNumber = "V-26538";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  

  if create_mof ( v_str , 'V-26538' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol11ref
{
ResourceID = "[AuditPol]V-26539";
 RuleStatus = "Default";
 AuditPolicy = "Process Creation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2713::9::AuditPol";
 RuleNumber = "V-26539";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26539' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol12ref
{
ResourceID = "[AuditPol]V-26540";
 RuleStatus = "Default";
 AuditPolicy = "Logoff";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2721::9::AuditPol";
 RuleNumber = "V-26540";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26540' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol13ref
{
ResourceID = "[AuditPol]V-26541";
 RuleStatus = "Default";
 AuditPolicy = "Logon";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2729::9::AuditPol";
 RuleNumber = "V-26541";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26541' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol14ref
{
ResourceID = "[AuditPol]V-26542";
 RuleStatus = "Default";
 AuditPolicy = "Logon";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2737::9::AuditPol";
 RuleNumber = "V-26542";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26542' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol15ref
{
ResourceID = "[AuditPol]V-26543";
 RuleStatus = "Default";
 AuditPolicy = "Special Logon";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2745::9::AuditPol";
 RuleNumber = "V-26543";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26543' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol16ref
{
ResourceID = "[AuditPol]V-26546";
 RuleStatus = "Default";
 AuditPolicy = "Audit Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2753::9::AuditPol";
 RuleNumber = "V-26546";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26546' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol17ref
{
ResourceID = "[AuditPol]V-26547";
 RuleStatus = "Default";
 AuditPolicy = "Audit Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2761::9::AuditPol";
 RuleNumber = "V-26547";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26547' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol18ref
{
ResourceID = "[AuditPol]V-26548";
 RuleStatus = "Default";
 AuditPolicy = "Authentication Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2769::9::AuditPol";
 RuleNumber = "V-26548";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26548' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol19ref
{
ResourceID = "[AuditPol]V-26549";
 RuleStatus = "Default";
 AuditPolicy = "Sensitive Privilege Use";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2777::9::AuditPol";
 RuleNumber = "V-26549";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26549' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol20ref
{
ResourceID = "[AuditPol]V-26550";
 RuleStatus = "Default";
 AuditPolicy = "Sensitive Privilege Use";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2785::9::AuditPol";
 RuleNumber = "V-26550";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26550' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol21ref
{
ResourceID = "[AuditPol]V-26551";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Driver";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2793::9::AuditPol";
 RuleNumber = "V-26551";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26551' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol22ref
{
ResourceID = "[AuditPol]V-26552";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Driver";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2801::9::AuditPol";
 RuleNumber = "V-26552";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26552' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol23ref
{
ResourceID = "[AuditPol]V-26553";
 RuleStatus = "Default";
 AuditPolicy = "Security State Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2809::9::AuditPol";
 RuleNumber = "V-26553";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26553' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol24ref
{
ResourceID = "[AuditPol]V-26554";
 RuleStatus = "Default";
 AuditPolicy = "Security State Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2817::9::AuditPol";
 RuleNumber = "V-26554";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26554' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol25ref
{
ResourceID = "[AuditPol]V-26555";
 RuleStatus = "Default";
 AuditPolicy = "Security System Extension";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2825::9::AuditPol";
 RuleNumber = "V-26555";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26555' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol26ref
{
ResourceID = "[AuditPol]V-26556";
 RuleStatus = "Default";
 AuditPolicy = "Security System Extension";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2833::9::AuditPol";
 RuleNumber = "V-26556";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26556' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol27ref
{
ResourceID = "[AuditPol]V-26557";
 RuleStatus = "Default";
 AuditPolicy = "System Integrity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2841::9::AuditPol";
 RuleNumber = "V-26557";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26557' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol28ref
{
ResourceID = "[AuditPol]V-26558";
 RuleStatus = "Default";
 AuditPolicy = "System Integrity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2849::9::AuditPol";
 RuleNumber = "V-26558";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-26558' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AccountSecurity as $AccountSecurity1ref
{
ResourceID = "[AccountSecurity]V-1097";
 Minimum = "1";
 RuleStatus = "Default";
 Maximum = "3";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2870::9::AccountSecurity";
 RuleNumber = "V-1097";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutThreshold";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-1097') = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AccountSecurity as $AccountSecurity2ref
{
ResourceID = "[AccountSecurity]V-1098";
 Minimum = "60";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2879::8::AccountSecurity";
 RuleNumber = "V-1098";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutWindow";
 ModuleVersion = "1.1";
DependsOn = {
    "[AccountSecurity]V-1099"};
};
instance of AccountSecurity as $AccountSecurity3ref
{
ResourceID = "[AccountSecurity]V-1099";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2888::9::AccountSecurity";
 RuleNumber = "V-1099";
 Desired = "No";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutDuration";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-1098' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

-- V-1098 depends on V-1099.
--     v_str := ''  ; 

  if create_mof ( v_str , 'V-1099' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AccountSecurity as $AccountSecurity4ref
{
ResourceID = "[AccountSecurity]V-1107";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2896::9::AccountSecurity";
 RuleNumber = "V-1107";
 Desired = "24";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "UniquePW";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-1107' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AccountSecurity as $AccountSecurity5ref
{
ResourceID = "[AccountSecurity]V-1104";
 Minimum = "1";
 RuleStatus = "Default";
 Maximum = "60";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2904::9::AccountSecurity";
 RuleNumber = "V-1104";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "MaxPWAge";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-1104' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AccountSecurity as $AccountSecurity6ref
{
ResourceID = "[AccountSecurity]V-1105";
 Minimum = "1";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2913::9::AccountSecurity";
 RuleNumber = "V-1105";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "MinPWAge";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-1105' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AccountSecurity as $AccountSecurity7ref
{
ResourceID = "[AccountSecurity]V-6836";
 Minimum = "14";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2921::9::AccountSecurity";
 RuleNumber = "V-6836";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "MinPWLen";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-6836' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AccountSecurity as $AccountSecurity8ref
{
ResourceID = "[AccountSecurity]V-3380";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2929::9::AccountSecurity";
 RuleNumber = "V-3380";
 Desired = "0";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "ForceLogoff";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-3380' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AccountSecurity as $AccountSecurity9ref
{
ResourceID = "[AccountSecurity]V-1113";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2937::9::AccountSecurity";
 RuleNumber = "V-1113";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "DisableGuest";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-1113' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AccountSecurity as $AccountSecurity10ref
{
ResourceID = "[AccountSecurity]V-1114";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2954::9::AccountSecurity";
 RuleNumber = "V-1114";
 Desired = "Visitor";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "RenameGuest";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-1114' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCService as $DSCService1ref
{
ResourceID = "[DSCService]V-40206";
 RuleStatus = "Default";
 RuleNumber = "V-40206";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3015::6::DSCService";
 Name = "SCPolicySvc";
 StartupType = "Automatic";
 ModuleName = "xDSCService";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-40206' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry38ref
{
ResourceID = "[GPRegistry]V-57600-1";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4108::9::GPRegistry";
 RuleNumber = "V-57600-1";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundEchoRequest";
};
instance of GPRegistry as $GPRegistry39ref
{
ResourceID = "[GPRegistry]V-57600-2";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4119::9::GPRegistry";
 RuleNumber = "V-57600-2";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundMaskRequest";
};
instance of GPRegistry as $GPRegistry40ref
{
ResourceID = "[GPRegistry]V-57600-3";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4130::9::GPRegistry";
 RuleNumber = "V-57600-3";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundRouterRequest";
};
instance of GPRegistry as $GPRegistry41ref
{
ResourceID = "[GPRegistry]V-57600-4";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4141::9::GPRegistry";
 RuleNumber = "V-57600-4";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundTimestampRequest";
};
instance of GPRegistry as $GPRegistry42ref
{
ResourceID = "[GPRegistry]V-57600-5";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4152::9::GPRegistry";
 RuleNumber = "V-57600-5";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundDestinationUnreachable";
};
instance of GPRegistry as $GPRegistry43ref
{
ResourceID = "[GPRegistry]V-57600-6";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4163::9::GPRegistry";
 RuleNumber = "V-57600-6";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundPacketTooBig";
};
instance of GPRegistry as $GPRegistry44ref
{
ResourceID = "[GPRegistry]V-57600-7";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4174::9::GPRegistry";
 RuleNumber = "V-57600-7";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundParameterProblem";
};
instance of GPRegistry as $GPRegistry45ref
{
ResourceID = "[GPRegistry]V-57600-8";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4186::9::GPRegistry";
 RuleNumber = "V-57600-8";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundSourceQuench";
};
instance of GPRegistry as $GPRegistry46ref
{
ResourceID = "[GPRegistry]V-57600-9";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4198::9::GPRegistry";
 RuleNumber = "V-57600-9";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundTimeExceeded";
};
instance of GPRegistry as $GPRegistry47ref
{
ResourceID = "[GPRegistry]V-57600-10";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4210::9::GPRegistry";
 RuleNumber = "V-57600-10";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowRedirect";
};'  ; 

  if create_mof ( v_str , 'V-57600' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry189ref
{
ResourceID = "[DSCRegistry]V-14256";
 ValueName = "NoWebServices";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-14256";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14256' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry190ref
{
ResourceID = "[DSCRegistry]V-15676";
 ValueName = "NoOnlinePrintsWizard";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3045::7::DSCRegistry";
 RuleNumber = "V-15676";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15676' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry191ref
{
ResourceID = "[DSCRegistry]V-15709";
 ValueName = "DownloadGameInfo";
 Key = "HKLM:\\\\Software\\Policies\\Microsoft\\Windows\\GameUX";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3056::7::DSCRegistry";
 RuleNumber = "V-15709";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-15709' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry192ref
{
ResourceID = "[DSCRegistry]V-14262";
 ValueName = "DisabledComponents";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip6\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3067::7::DSCRegistry";
 RuleNumber = "V-14262";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "255";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-14262' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry193ref
{
ResourceID = "[DSCRegistry]V-21975";
 ValueName = "DisableHomeGroup";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Homegroup";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3091::8::DSCRegistry";
 RuleNumber = "V-21975";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21975' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry194ref
{
ResourceID = "[DSCRegistry]V-16001";
 ValueName = "RedirectOnlyDefaultClientPrinter ";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3102::8::DSCRegistry";
 RuleNumber = "V-16001";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-16001' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry195ref
{
ResourceID = "[DSCRegistry]V-21974";
 ValueName = "GameUpdateOptions";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\GameUX";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3122::8::DSCRegistry";
 RuleNumber = "V-21974";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21974' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry196ref
{
ResourceID = "[DSCRegistry]V-21978";
 ValueName = "Disabled";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\WAU";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3133::9::DSCRegistry";
 RuleNumber = "V-21978";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-21978' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol29ref
{
ResourceID = "[AuditPol]V-56300";
 RuleStatus = "Default";
 AuditPolicy = "Kerberos Authentication Service";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3146::9::AuditPol";
 RuleNumber = "V-56300";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56300' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol30ref
{
ResourceID = "[AuditPol]V-56301";
 RuleStatus = "Default";
 AuditPolicy = "Kerberos Service Ticket Operations";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3154::9::AuditPol";
 RuleNumber = "V-56301";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56301' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol31ref
{
ResourceID = "[AuditPol]V-56302";
 RuleStatus = "Default";
 AuditPolicy = "Other Account Logon Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3162::9::AuditPol";
 RuleNumber = "V-56302";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56302' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol32ref
{
ResourceID = "[AuditPol]V-56303";
 RuleStatus = "Default";
 AuditPolicy = "Application Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3170::9::AuditPol";
 RuleNumber = "V-56303";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56303' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol33ref
{
ResourceID = "[AuditPol]V-56304";
 RuleStatus = "Default";
 AuditPolicy = "Distribution Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3178::9::AuditPol";
 RuleNumber = "V-56304";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56304' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol34ref
{
ResourceID = "[AuditPol]V-56305";
 RuleStatus = "Default";
 AuditPolicy = "DPAPI Activity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3186::9::AuditPol";
 RuleNumber = "V-56305";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56305' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol35ref
{
ResourceID = "[AuditPol]V-56306";
 RuleStatus = "Default";
 AuditPolicy = "Process Termination";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3194::9::AuditPol";
 RuleNumber = "V-56306";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56306' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol36ref
{
ResourceID = "[AuditPol]V-56307";
 RuleStatus = "Default";
 AuditPolicy = "RPC Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3202::9::AuditPol";
 RuleNumber = "V-56307";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56307' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol37ref
{
ResourceID = "[AuditPol]V-56308";
 RuleStatus = "Default";
 AuditPolicy = "Account Lockout";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3210::9::AuditPol";
 RuleNumber = "V-56308";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56308' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol38ref
{
ResourceID = "[AuditPol]V-56309";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Extended Mode";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3218::9::AuditPol";
 RuleNumber = "V-56309";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56309' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol39ref
{
ResourceID = "[AuditPol]V-56310";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Main Mode";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3226::9::AuditPol";
 RuleNumber = "V-56310";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56310' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol40ref
{
ResourceID = "[AuditPol]V-56311";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Quick Mode";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3234::9::AuditPol";
 RuleNumber = "V-56311";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};
'  ; 

  if create_mof ( v_str , 'V-56311' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol41ref
{
ResourceID = "[AuditPol]V-56312";
 RuleStatus = "Default";
 AuditPolicy = "Network Policy Server";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3242::9::AuditPol";
 RuleNumber = "V-56312";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56312' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol42ref
{
ResourceID = "[AuditPol]V-56313";
 RuleStatus = "Default";
 AuditPolicy = "Other Logon/Logoff Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3250::9::AuditPol";
 RuleNumber = "V-56313";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56313' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol43ref
{
ResourceID = "[AuditPol]V-56314";
 RuleStatus = "Default";
 AuditPolicy = "Application Generated";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3258::9::AuditPol";
 RuleNumber = "V-56314";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56314' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol44ref
{
ResourceID = "[AuditPol]V-56315";
 RuleStatus = "Default";
 AuditPolicy = "Central Policy Staging";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3266::9::AuditPol";
 RuleNumber = "V-56315";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56315' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol45ref
{
ResourceID = "[AuditPol]V-56316";
 RuleStatus = "Default";
 AuditPolicy = "Certification Services";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3274::9::AuditPol";
 RuleNumber = "V-56316";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56316' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol46ref
{
ResourceID = "[AuditPol]V-56317";
 RuleStatus = "Default";
 AuditPolicy = "Detailed File Share";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3282::9::AuditPol";
 RuleNumber = "V-56317";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56317' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol47ref
{
ResourceID = "[AuditPol]V-56318";
 RuleStatus = "Default";
 AuditPolicy = "File Share";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3290::9::AuditPol";
 RuleNumber = "V-56318";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56318' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol48ref
{
ResourceID = "[AuditPol]V-56319";
 RuleStatus = "Default";
 AuditPolicy = "File System";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3298::9::AuditPol";
 RuleNumber = "V-56319";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56319' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol49ref
{
ResourceID = "[AuditPol]V-56320";
 RuleStatus = "Default";
 AuditPolicy = "Filtering Platform Connection";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3306::9::AuditPol";
 RuleNumber = "V-56320";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56320' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol50ref
{
ResourceID = "[AuditPol]V-56321";
 RuleStatus = "Default";
 AuditPolicy = "Filtering Platform Packet Drop";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3314::9::AuditPol";
 RuleNumber = "V-56321";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56321' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol51ref
{
ResourceID = "[AuditPol]V-56322";
 RuleStatus = "Default";
 AuditPolicy = "Handle Manipulation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3322::9::AuditPol";
 RuleNumber = "V-56322";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56322' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol52ref
{
ResourceID = "[AuditPol]V-56323";
 RuleStatus = "Default";
 AuditPolicy = "Other Object Access Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3330::9::AuditPol";
 RuleNumber = "V-56323";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56323' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol53ref
{
ResourceID = "[AuditPol]V-56324";
 RuleStatus = "Default";
 AuditPolicy = "Registry";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3338::9::AuditPol";
 RuleNumber = "V-56324";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56324' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol54ref
{
ResourceID = "[AuditPol]V-56325";
 RuleStatus = "Default";
 AuditPolicy = "SAM";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3346::9::AuditPol";
 RuleNumber = "V-56325";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56325' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol55ref
{
ResourceID = "[AuditPol]V-56326";
 RuleStatus = "Default";
 AuditPolicy = "Filtering Platform Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3354::9::AuditPol";
 RuleNumber = "V-56326";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56326' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol56ref
{
ResourceID = "[AuditPol]V-56327";
 RuleStatus = "Default";
 AuditPolicy = "MPSSVC Rule-Level Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3362::9::AuditPol";
 RuleNumber = "V-56327";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56327' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol57ref
{
ResourceID = "[AuditPol]V-56328";
 RuleStatus = "Default";
 AuditPolicy = "Other Policy Change Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3370::9::AuditPol";
 RuleNumber = "V-56328";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56328' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol58ref
{
ResourceID = "[AuditPol]V-56329";
 RuleStatus = "Default";
 AuditPolicy = "Non Sensitive Privilege Use";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3378::9::AuditPol";
 RuleNumber = "V-56329";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56329' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol59ref
{
ResourceID = "[AuditPol]V-56331";
 RuleStatus = "Default";
 AuditPolicy = "Other System Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3393::9::AuditPol";
 RuleNumber = "V-56331";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56331' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol60ref
{
ResourceID = "[AuditPol]V-56379";
 RuleStatus = "Default";
 AuditPolicy = "Kernel Object";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3400::9::AuditPol";
 RuleNumber = "V-56379";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56379' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry1ref
{
ResourceID = "[GPRegistry]V-56332";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3408::9::GPRegistry";
 RuleNumber = "V-56332";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "DisableUnicastResponsesToMulticastBroadcast";
};'  ; 

  if create_mof ( v_str , 'V-56332' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry2ref
{
ResourceID = "[GPRegistry]V-56333";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3419::9::GPRegistry";
 RuleNumber = "V-56333";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalIPsecPolicyMerge";
};'  ; 

  if create_mof ( v_str , 'V-56333' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry3ref
{
ResourceID = "[GPRegistry]V-56334";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3430::9::GPRegistry";
 RuleNumber = "V-56334";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalPolicyMerge";
};'  ; 

  if create_mof ( v_str , 'V-56334' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry4ref
{
ResourceID = "[GPRegistry]V-56335";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3441::9::GPRegistry";
 RuleNumber = "V-56335";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "DisableNotifications";
};'  ; 

  if create_mof ( v_str , 'V-56335' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry5ref
{
ResourceID = "[GPRegistry]V-56336";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3452::9::GPRegistry";
 RuleNumber = "V-56336";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "EnableFirewall";
};'  ; 

  if create_mof ( v_str , 'V-56336' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry6ref
{
ResourceID = "[GPRegistry]V-56337";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3463::9::GPRegistry";
 RuleNumber = "V-56337";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "DefaultInboundAction";
};'  ; 

  if create_mof ( v_str , 'V-56337' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry7ref
{
ResourceID = "[GPRegistry]V-56338";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3474::9::GPRegistry";
 RuleNumber = "V-56338";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "DefaultOutboundAction";
};'  ; 

  if create_mof ( v_str , 'V-56338' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry8ref
{
ResourceID = "[GPRegistry]V-56339";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3485::9::GPRegistry";
 RuleNumber = "V-56339";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "DisableUnicastResponsesToMulticastBroadcast";
};'  ; 

  if create_mof ( v_str , 'V-56339' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry9ref
{
ResourceID = "[GPRegistry]V-56340";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3496::9::GPRegistry";
 RuleNumber = "V-56340";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalIPsecPolicyMerge";
};'  ; 

  if create_mof ( v_str , 'V-56340' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry10ref
{
ResourceID = "[GPRegistry]V-56341";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3507::9::GPRegistry";
 RuleNumber = "V-56341";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalPolicyMerge";
};'  ; 

  if create_mof ( v_str , 'V-56341' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry11ref
{
ResourceID = "[GPRegistry]V-56342";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3518::9::GPRegistry";
 RuleNumber = "V-56342";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "DisableNotifications";
};'  ; 

  if create_mof ( v_str , 'V-56342' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry12ref
{
ResourceID = "[GPRegistry]V-56343";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3529::9::GPRegistry";
 RuleNumber = "V-56343";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "EnableFirewall";
};'  ; 

  if create_mof ( v_str , 'V-56343' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry13ref
{
ResourceID = "[GPRegistry]V-56344";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3540::9::GPRegistry";
 RuleNumber = "V-56344";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "DefaultInboundAction";
};'  ; 

  if create_mof ( v_str , 'V-56344' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry14ref
{
ResourceID = "[GPRegistry]V-56345";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3551::9::GPRegistry";
 RuleNumber = "V-56345";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "DefaultOutboundAction";
};'  ; 

  if create_mof ( v_str , 'V-56345' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry15ref
{
ResourceID = "[GPRegistry]V-56346";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3562::9::GPRegistry";
 RuleNumber = "V-56346";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "DisableUnicastResponsesToMulticastBroadcast";
};'  ; 

  if create_mof ( v_str , 'V-56346' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry16ref
{
ResourceID = "[GPRegistry]V-56347";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3573::9::GPRegistry";
 RuleNumber = "V-56347";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalIPsecPolicyMerge";
};'  ; 

  if create_mof ( v_str , 'V-56347' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry17ref
{
ResourceID = "[GPRegistry]V-56348";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3584::9::GPRegistry";
 RuleNumber = "V-56348";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalPolicyMerge";
};'  ; 

  if create_mof ( v_str , 'V-56348' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry18ref
{
ResourceID = "[GPRegistry]V-56349";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3595::9::GPRegistry";
 RuleNumber = "V-56349";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "DisableNotifications";
};'  ; 

  if create_mof ( v_str , 'V-56349' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry19ref
{
ResourceID = "[GPRegistry]V-56350";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3606::9::GPRegistry";
 RuleNumber = "V-56350";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "EnableFirewall";
};'  ; 

  if create_mof ( v_str , 'V-56350' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry20ref
{
ResourceID = "[GPRegistry]V-56351";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3617::9::GPRegistry";
 RuleNumber = "V-56351";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "DefaultInboundAction";
};'  ; 

  

  if create_mof ( v_str , 'V-56351' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry21ref
{
ResourceID = "[GPRegistry]V-56352";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3628::9::GPRegistry";
 RuleNumber = "V-56352";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "DefaultOutboundAction";
};'  ; 

  if create_mof ( v_str , 'V-56352' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCService as $DSCService3ref
{
ResourceID = "[DSCService]V-56359";
 RuleStatus = "Default";
 State = "Running";
 RuleNumber = "V-56359";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3640::9::DSCService";
 Name = "EventLog";
 StartupType = "Automatic";
 ModuleName = "xDSCService";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56359' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry197ref
{
ResourceID = "[DSCRegistry]V-56360";
 ValueName = "AnnounceFlags";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\Config";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3649::8::DSCRegistry";
 RuleNumber = "V-56360";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "5";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56360' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry198ref
{
ResourceID = "[DSCRegistry]V-56361";
 ValueName = "Type";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3661::9::DSCRegistry";
 RuleNumber = "V-56361";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "NTP";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56361' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry199ref
{
ResourceID = "[DSCRegistry]V-56362";
 ValueName = "Enabled";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\TimeProviders\\NtpServer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3671::9::DSCRegistry";
 RuleNumber = "V-56362";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56362' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry200ref
{
ResourceID = "[DSCRegistry]V-56363";
 ValueName = "SpecialPollInterval";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\TimeProviders\\NtpClient";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3681::9::DSCRegistry";
 RuleNumber = "V-56363";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "900";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56363' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry201ref
{
ResourceID = "[DSCRegistry]V-56371";
 ValueName = "crashonauditfail";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3691::9::DSCRegistry";
 RuleNumber = "V-56371";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56371' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry202ref
{
ResourceID = "[DSCRegistry]V-56372";
 ValueName = "ClearPageFileAtShutdown";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Memory Management";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3701::9::DSCRegistry";
 RuleNumber = "V-56372";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56372' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry22ref
{
ResourceID = "[GPRegistry]V-56364-1";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Application";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3712::9::GPRegistry";
 RuleNumber = "V-56364-1";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AutoBackupLogFiles";
};
instance of GPRegistry as $GPRegistry23ref
{
ResourceID = "[GPRegistry]V-56364-2";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Application";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3724::9::GPRegistry";
 RuleNumber = "V-56364-2";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "Retention";
};'  ; 

  if create_mof ( v_str , 'V-56364' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry203ref
{
ResourceID = "[DSCRegistry]V-56365";
 ValueName = "undockwithoutlogon";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\policies\\system";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3736::9::DSCRegistry";
 RuleNumber = "V-56365";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56365' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry204ref
{
ResourceID = "[DSCRegistry]V-56366";
 ValueName = "AllocateCDRoms";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3747::9::DSCRegistry";
 RuleNumber = "V-56366";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56366' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry205ref
{
ResourceID = "[DSCRegistry]V-56367";
 ValueName = "AllocateFloppies";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3758::9::DSCRegistry";
 RuleNumber = "V-56367";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56367' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry206ref
{
ResourceID = "[DSCRegistry]V-56369";
 ValueName = "ForceUnlockLogon";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\Currentversion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3769::9::DSCRegistry";
 RuleNumber = "V-56369";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56369' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry24ref
{
ResourceID = "[GPRegistry]V-56370-1";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Security";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3780::9::GPRegistry";
 RuleNumber = "V-56370-1";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AutoBackupLogFiles";
};
instance of GPRegistry as $GPRegistry25ref
{
ResourceID = "[GPRegistry]V-56370-2";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Security";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3792::9::GPRegistry";
 RuleNumber = "V-56370-2";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "Retention";
};'  ; 

  if create_mof ( v_str , 'V-56370' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry26ref
{
ResourceID = "[GPRegistry]V-56373-1";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\System";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3803::9::GPRegistry";
 RuleNumber = "V-56373-1";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AutoBackupLogFiles";
};
instance of GPRegistry as $GPRegistry27ref
{
ResourceID = "[GPRegistry]V-56373-2";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\System";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3815::9::GPRegistry";
 RuleNumber = "V-56373-2";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "Retention";
};'  ; 

  if create_mof ( v_str , 'V-56373' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol61ref
{
ResourceID = "[AuditPol]V-56378";
 RuleStatus = "Default";
 AuditPolicy = "Authorization Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3827::9::AuditPol";
 RuleNumber = "V-56378";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56378' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of SystemCheck as $SystemCheck1ref
{
ResourceID = "[SystemCheck]V-56353";
 Manual = "False";
 RuleNumber = "V-56353";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3835::9::SystemCheck";
 ServiceCategory = "DNS";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56353' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of SystemCheck as $SystemCheck2ref
{
ResourceID = "[SystemCheck]V-56356";
 Manual = "False";
 RuleNumber = "V-56356";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3850::9::SystemCheck";
 ServiceCategory = "TimeServer";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56356' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of SystemCheck as $SystemCheck3ref
{
ResourceID = "[SystemCheck]V-56357";
 Manual = "False";
 RuleNumber = "V-56357";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3858::9::SystemCheck";
 ServiceCategory = "Services";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56357' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of SystemCheck as $SystemCheck4ref
{
ResourceID = "[SystemCheck]V-56358";
 Manual = "False";
 RuleNumber = "V-56358";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3866::9::SystemCheck";
 ServiceCategory = "Software";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56358' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry28ref
{
ResourceID = "[GPRegistry]V-56500-1";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3893::9::GPRegistry";
 RuleNumber = "V-56500-1";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundEchoRequest";
};
instance of GPRegistry as $GPRegistry29ref
{
ResourceID = "[GPRegistry]V-56500-2";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3904::9::GPRegistry";
 RuleNumber = "V-56500-2";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundMaskRequest";
};
instance of GPRegistry as $GPRegistry30ref
{
ResourceID = "[GPRegistry]V-56500-3";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3915::9::GPRegistry";
 RuleNumber = "V-56500-3";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundRouterRequest";
};
instance of GPRegistry as $GPRegistry31ref
{
ResourceID = "[GPRegistry]V-56500-4";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3926::9::GPRegistry";
 RuleNumber = "V-56500-4";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundTimestampRequest";
};
instance of GPRegistry as $GPRegistry32ref
{
ResourceID = "[GPRegistry]V-56500-5";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3937::9::GPRegistry";
 RuleNumber = "V-56500-5";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundDestinationUnreachable";
};
instance of GPRegistry as $GPRegistry33ref
{
ResourceID = "[GPRegistry]V-56500-6";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3948::9::GPRegistry";
 RuleNumber = "V-56500-6";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundPacketTooBig";
};
instance of GPRegistry as $GPRegistry34ref
{
ResourceID = "[GPRegistry]V-56500-7";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3959::9::GPRegistry";
 RuleNumber = "V-56500-7";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundParameterProblem";
};
instance of GPRegistry as $GPRegistry35ref
{
ResourceID = "[GPRegistry]V-56500-8";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3970::9::GPRegistry";
 RuleNumber = "V-56500-8";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundSourceQuench";
};
instance of GPRegistry as $GPRegistry36ref
{
ResourceID = "[GPRegistry]V-56500-9";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3981::9::GPRegistry";
 RuleNumber = "V-56500-9";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundTimeExceeded";
};
instance of GPRegistry as $GPRegistry37ref
{
ResourceID = "[GPRegistry]V-56500-10";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3992::9::GPRegistry";
 RuleNumber = "V-56500-10";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowRedirect";
};'  ; 

  if create_mof ( v_str , 'V-56500' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry48ref
{
ResourceID = "[GPRegistry]V-56512";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4222::9::GPRegistry";
 RuleNumber = "V-56512";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "DisableNotifications";
};'  ; 

  if create_mof ( v_str , 'V-56512' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of GPRegistry as $GPRegistry49ref
{
ResourceID = "[GPRegistry]V-56513";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4234::9::GPRegistry";
 RuleNumber = "V-56513";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "EnableFirewall";
};'  ; 

  if create_mof ( v_str , 'V-56513' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry207ref
{
ResourceID = "[DSCRegistry]V-56526";
 ValueName = "AUOptions";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4285::9::DSCRegistry";
 RuleNumber = "V-56526";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56526' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry208ref
{
ResourceID = "[DSCRegistry]V-56528";
 ValueName = "NoRDS";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Conferencing";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4295::9::DSCRegistry";
 RuleNumber = "V-56528";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56528' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry209ref
{
ResourceID = "[DSCRegistry]V-56529";
 ValueName = "NoAUShutdownOption";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4305::9::DSCRegistry";
 RuleNumber = "V-56529";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56529' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry210ref
{
ResourceID = "[DSCRegistry]V-56533";
 ValueName = "EnableSecureCredentialPrompting";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\policies\\CredUI";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4335::9::DSCRegistry";
 RuleNumber = "V-56533";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56533' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry211ref
{
ResourceID = "[DSCRegistry]V-56534-1";
 ValueName = "RescheduleWaitTimeEnabled";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4345::9::DSCRegistry";
 RuleNumber = "V-56534-1";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};
instance of DSCRegistry as $DSCRegistry212ref
{
ResourceID = "[DSCRegistry]V-56534-2";
 ValueName = "RescheduleWaitTime";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4355::9::DSCRegistry";
 RuleNumber = "V-56534-2";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56534' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry213ref
{
ResourceID = "[DSCRegistry]V-56539";
 ValueName = "NtfsDisable8dot3NameCreation";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\FileSystem";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4383::9::DSCRegistry";
 RuleNumber = "V-56539";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56539' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry214ref
{
ResourceID = "[DSCRegistry]V-56542";
 ValueName = "DisableContentFileUpdates";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\SearchCompanion";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4393::9::DSCRegistry";
 RuleNumber = "V-56542";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56542' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry215ref
{
ResourceID = "[DSCRegistry]V-56543";
 ValueName = "NoPublishingWizard";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4403::9::DSCRegistry";
 RuleNumber = "V-56543";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56543' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Secpol as $Secpol1ref
{
ResourceID = "[Secpol]V-1150";
 Manual = "False";
 RuleStatus = "Default";
 Policy = "PasswordComplexity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4513::9::Secpol";
 RuleNumber = "V-1150";
 ModuleName = "xSecpol";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-1150' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Secpol as $Secpol2ref
{
ResourceID = "[Secpol]V-2372";
 Manual = "False";
 RuleStatus = "Default";
 Policy = "ClearTextPassword";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4520::9::Secpol";
 RuleNumber = "V-2372";
 ModuleName = "xSecpol";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-2372' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of Secpol as $Secpol3ref
{
ResourceID = "[Secpol]V-3337";
 Manual = "False";
 RuleStatus = "Default";
 Policy = "SIDTranslation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4527::9::Secpol";
 RuleNumber = "V-3337";
 ModuleName = "xSecpol";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3337' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCRegistry as $DSCRegistry1ref
{
ResourceID = "[DSCRegistry]V-3372";
 ValueName = "UndockWithoutLogon";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4543::8::DSCRegistry";
 RuleNumber = "V-3372";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-3372' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol1ref
{
ResourceID = "[AuditPol]V-57633";
 RuleStatus = "Default";
 AuditPolicy = "Authorization Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4554::8::AuditPol";
 RuleNumber = "V-57633";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-57633' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AuditPol as $AuditPol2ref
{
ResourceID = "[AuditPol]V-57635";
 RuleStatus = "Default";
 AuditPolicy = "Authorization Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4562::8::AuditPol";
 RuleNumber = "V-57635";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-57635' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of DSCService as $DSCService2ref
{
ResourceID = "[DSCService]V-56511";
 RuleStatus = "Default";
 State = "Running";
 RuleNumber = "V-56511";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3023::6::DSCService";
 Name = "WerSvc";
 StartupType = "Automatic";
 ModuleName = "xDSCService";
 ModuleVersion = "1.0";
};'  ; 

  if create_mof ( v_str , 'V-56511' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AccountSecurity as $AccountSecurity12ref
{
ResourceID = "[AccountSecurity]V-56375";
 Manual = "False";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3876::9::AccountSecurity";
 RuleNumber = "V-56375";
 Desired = "";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LastLoginTime";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-56375' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     v_str := 'instance of AccountSecurity as $AccountSecurity10ref
{
ResourceID = "[AccountSecurity]V-1115";
 Manual = "False";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2945::9::AccountSecurity";
 RuleNumber = "V-1115";
 Desired = "NotAdmin";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "RenameAdministrator";
 ModuleVersion = "1.1";
};'  ; 

  if create_mof ( v_str , 'V-1115' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  result := result || ' Total attempted : ' || v_total || ' , Total success : ' || v_success;
  return result;
end;
/

select add_mof_data() from dual;
--/
