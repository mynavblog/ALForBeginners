page 65401 "MNB Bonus Card"
{
    PageType = Document;
    SourceTable = "MNB Bonus Header";
    Caption = 'Bonus Card';
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus number.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus customer number.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer name.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus starting date.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus ending date.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus status.';
                }
                field("Last Released Date"; Rec."Last Released Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date and time when the bonus was last released.';
                }
            }
            part(Lines; "MNB Bonus Subform")
            {
                ApplicationArea = All;
                Caption = 'Lines';
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(FactBoxes)
        {
            part(Statistics; "MNB Bonus Statistics")
            {
                SubPageLink = "No." = field("No.");
                ApplicationArea = All;
            }
            systempart(Links; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = Notes;
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
                ToolTip = 'Open customer card for the bonus.';
                Image = Customer;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer No.");
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
        area(Reporting)
        {
            action(Print)
            {
                ApplicationArea = All;
                Caption = 'Print';
                Image = Print;
                RunObject = report "MNB Bonus Printout";
                ToolTip = 'Prints bonus card.';
            }
        }
    }
}