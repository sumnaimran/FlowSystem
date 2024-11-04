//Have added this code for myself
pageextension 50002 EVS_PurchaseOrder extends "Purchase Order Subform"
{
    layout
    {
        // Add changes to page layout here
        modify("Job No.")
        {
            ApplicationArea = All;
            Visible = true;
        }
        modify("Job Task No.")
        {
            ApplicationArea = All;
            Visible = true;
        }
        modify("Job Line Type")
        {
            ApplicationArea = All;
            Visible = true;
        }
    }
    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}