page 50105 "MNB Bonus Statistics"
{
    PageType = CardPart;
    SourceTable = "MNB Bonus Header";
    Caption = 'Bonus Statistics';

    layout
    {
        area(Content)
        {
            field("No."; 'No.')
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the bonus number.';
                Caption = 'No.';
            }
            field("Bonus Amount"; 'Bonus Amount')
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the bonus totat amount';
                Caption = 'Bonus Amount';
            }
        }
    }
}