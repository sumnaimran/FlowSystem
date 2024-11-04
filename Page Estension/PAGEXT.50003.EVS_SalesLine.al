//Have added this code for myself
pageextension 50003 EVS_SalesInvoice extends "Sales Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
        modify("Job No.")
        {
            ApplicationArea = All;
            Visible = true;
            Editable = true;
            // trigger OnAfterValidate()
            // var
            // begin

            // end;
        }
        modify("Job Task No.")
        {
            ApplicationArea = All;
            Visible = true;
            Editable = true;
        }
        // addafter("Job No.")
        // {
        //     field("Project No Key"; Rec."Project No Key")
        //     {
        //         ApplicationArea = All;
        //         Visible = true;
        //     }
        // }
    }
    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        demo: record "sales line";
}