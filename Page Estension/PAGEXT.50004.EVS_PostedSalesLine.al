//Have added this code for myself
pageextension 50004 EVS_PostedSalesLine extends "Posted Sales Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
        modify("Job No.")
        {
            ApplicationArea = All;
            Visible = true;
            Editable = true;
        }
        modify("Job Task No.")
        {
            ApplicationArea = All;
            Visible = true;
            Editable = true;
        }
    }
    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}