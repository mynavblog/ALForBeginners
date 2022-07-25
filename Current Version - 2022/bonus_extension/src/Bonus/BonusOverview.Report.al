report 65400 "MNB Bonus Overview"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Bonus Overview';
    DefaultLayout = Excel;
    ExcelLayout = './src/Bonus/BonusOverview.xlsx';


    dataset
    {
        dataitem("MNB Bonus Header"; "MNB Bonus Header")
        {
            RequestFilterFields = "No.", "Customer No.";

            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Customer_No_; "Customer No.")
            {
                IncludeCaption = true;
            }
            column(Starting_Date; "Starting Date")
            {
                IncludeCaption = true;
            }
            column(Ending_Date; "Ending Date")
            {
                IncludeCaption = true;
            }

            dataitem("MNB Bonus Entry"; "MNB Bonus Entry")
            {
                DataItemLink = "Bonus No." = field("No.");
                RequestFilterFields = "Posting Date";

                column(Document_No_; "Document No.")
                {
                    IncludeCaption = true;
                }
                column(Posting_Date; "Posting Date")
                {
                    IncludeCaption = true;
                }
                column(Item_No_; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(Bonus_Amount; "Bonus Amount")
                {
                    IncludeCaption = true;
                }
            }
        }
    }
}
