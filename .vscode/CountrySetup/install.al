codeunit 50102 "Country/Region Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany();
    var
        UpgradeTag: Codeunit "Upgrade Tag";
        myAppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(myAppInfo);

        if myAppInfo.DataVersion = Version.Create(0, 0, 0, 0) then
            HandleFreshInstall()
        else
            HandleReinstall();

        UpgradeTag.SetAllUpgradeTags();
    end;

    procedure HandleFreshInstall();
    var
        CountryRegionSetup: Record "Country Setup";
    begin
        CountryRegionSetup.Init();
        CountryRegionSetup."Country/Region Code" := 'RS';
        if not CountryRegionSetup.Insert() then;
    end;

    local procedure HandleReinstall();
    var
        CountryRegionSetup: Record "Country Setup";
    begin
        CountryRegionSetup.Init();
        CountryRegionSetup."Country/Region Code" := 'RS';
        if not CountryRegionSetup.Insert() then;
    end;
}