table 50125 "Country Setup"
{
    Caption = 'Country Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = SystemMetadata;
            TableRelation = "Country/Region";
            ObsoleteState = Pending;
            ObsoleteReason = 'In version 2.0 this field will be removed';


            trigger OnValidate()
            begin
                CalcFields("Country/Region Name");
            end;
        }

        field(3; "Country/Region Name"; Text[50])
        {
            Caption = 'Country/Region Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Country/Region".Name Where(Code = field("Country/Region Code")));
            Editable = false;
        }

        field(4; "Country/Region Enum"; Enum "Country/Region Enum")
        {

            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
