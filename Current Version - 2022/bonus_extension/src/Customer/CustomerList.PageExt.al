pageextension 65400 "MNB Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("MNB Bonuses"; Rec."MNB Bonuses")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies number of assgined bonuses to the customer.';
            }
        }
    }
    actions
    {
        addlast(navigation)
        {
            action(MNBBonuses)
            {
                Caption = 'Bonuses';
                ToolTip = 'Open the list of bonuses assigned to the customer.';
                ApplicationArea = All;
                Image = Discount;
                RunObject = page "MNB Bonus List";
                RunPageLink = "Customer No." = field("No.");
            }
        }
    }
}