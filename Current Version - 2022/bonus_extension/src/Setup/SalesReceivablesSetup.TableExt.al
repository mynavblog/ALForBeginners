tableextension 65401 "MNB Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(65400; "MNB Bonus Nos."; Code[20])
        {
            Caption = 'Bonus Nos.';
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }
    }
}
