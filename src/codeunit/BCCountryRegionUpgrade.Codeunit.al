codeunit 50103 "BC Country/Region Upgrade"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        UpgradeTag: Codeunit "Upgrade Tag";
    begin
        if UpgradeTag.HasUpgradeTag(ReasonLbl) then exit;

        PerformUpgrade();

        UpgradeTag.SetUpgradeTag(ReasonLbl);
    end;

    local procedure PerformUpgrade()
    var
        CountryRegionSetup: Record "Country Setup";
        CountryRegionInstall: Codeunit "Country/Region Install";
    begin
        if not CountryRegionSetup.FindFirst() then
            CountryRegionInstall.HandleFreshInstall()
        else begin
            case CountryRegionSetup."Country/Region Code" of
                'Si':
<<<<<<< HEAD:.vscode/CountrySetup/Upgrade.al
                    CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::IT;
=======
                    CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::ME;
>>>>>>> 595fb73d03dbbfaf064f55df8151b8c3e601ba4f:src/codeunit/BCCountryRegionUpgrade.Codeunit.al
                'RS':
                    CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::RS;
                'CR':
                    CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::CR;
                else
                    CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::Sl;
            end
        end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyUpgradeTags(var PerCompanyUpgradeTags: List of [Code[250]]);
    begin
        PerCompanyUpgradeTags.Add(ReasonLbl);
    end;


    var
        ReasonLbl: Label 'BeTerna-SetupEnum-20220406', Locked = true;
}