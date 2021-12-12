page 50102 "MNB Bonus Card"
{
    PageType = Document;
    SourceTable = "MNB Bonus Header";
    Caption = 'Bonus Card';
    DataCaptionFields = "No.";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; 'No.')
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus number.';
                    Caption = 'No';
                }
                field("Customer No."; 'Customer No.')
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus customer number.';
                    Caption = 'Customer No';
                }
                field("Customer Name"; 'Customer Name')
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus customer name.';
                    Caption = 'Customer Name';
                }
                field("Starting Date"; 'Starting Date')
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus starting date.';
                    Caption = 'Starting Date';
                }
                field("Ending Date"; 'Ending Date')
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus ending date.';
                    Caption = 'Ending Date';
                }
                field(Status; 'Status')
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus status.';
                    Caption = 'Status';
                }
            }
            part(Lines; "MNB Bonus Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(FactBoxes)
        {
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
            part(MNBBonusStatistics; "MNB Bonus Statistics")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
                Caption = 'Statistics';
            }

        }
    }
    actions
    {
        area(Navigation)
        {
            action(CustomerCard)
            {
                ApplicationArea = All;
                Caption = 'Customer Card';
                Image = Customer;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer No.");
                ToolTip = 'Opens customer card.';
            }
            action(BonusEntries)
            {
                ApplicationArea = All;
                Caption = 'Bonus Entries';
                Image = Entry;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "MNB Bonus Entries";
                RunPageLink = "Bonus No." = field("No.");
                ToolTip = 'Opens bonus entries.';
            }
        }
    }
}