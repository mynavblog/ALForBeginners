pageextension 65401 "MNB Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("MNB Bonus Nos."; Rec."MNB Bonus Nos.")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies the code for the number series that will be used to assign numbers to bonuses.';
            }
        }
    }
}