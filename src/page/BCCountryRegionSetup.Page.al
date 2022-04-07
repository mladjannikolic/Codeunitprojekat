page 50125 "BC Country/Region Setup"
{
    Caption = 'Country/Region Setup';
    PageType = Card;
    SourceTable = "Country Setup";
    UsageCategory = Administration;
    ApplicationArea = All;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(CountryRegion; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Select Country/Region for your Locatization';
                    Visible = false;
                }

                field(Name; Rec."Country/Region Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows selected country/region name';
                    Visible = false;
                }

                field(CountryRegionEnum; Rec."Country/Region Enum")
                {

                    ApplicationArea = All;
                    ToolTip = 'Select selected country/region';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        If not Rec.FindFirst() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

    //Kristinaizmena
}

