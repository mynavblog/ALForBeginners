table 50100 "MNB Bonus Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Bonus Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }

        field(2; "Bonus Nos."; Code[20])
        {
            Caption = 'Bonus Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
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