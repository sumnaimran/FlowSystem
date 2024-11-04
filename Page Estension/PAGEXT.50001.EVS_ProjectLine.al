pageextension 50001 EVS_ProjectLines extends "Job Task Lines Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Usage (Total Cost)")
        {
            field("Oustanding Committed Cost On PO"; Rec."Outstanding Committed Cost On PO")
            {
                ApplicationArea = All;
                Caption = 'Oustanding Committed Cost On PO';
                ToolTip = 'Oustanding Committed Cost On PO';
            }
            field("Total Cost"; Rec."Total Cost")
            {
                ApplicationArea = All;
                Caption = 'Total Cost';
                ToolTip = 'Total Cost';
            }
        }
    }
    actions
    {
        // Add changes to page actions here
    }
    var
        myInt: Integer;

    trigger OnAfterGetRecord()
    var
        tbl_purchaseorderline: Record "purchase line";
        tbl_postedpurchaseorderline: Record "Purch. Inv. Line";
        tbl_salesline: Record "Sales Line";
        tbl_postedsalesline: Record "Sales Invoice Line";
        purchaseline_product: Decimal;
        salesline_product: Decimal;

    begin

        //18-Oct-2024
        Clear(Rec."Total Cost");
        if Rec."Job Task Type" <> Rec."Job Task Type"::"Begin-Total" then begin
            tbl_purchaseorderline.Init();
            tbl_purchaseorderline.Reset();
            tbl_purchaseorderline.SetRange(tbl_purchaseorderline."Document Type", tbl_purchaseorderline."Document Type"::Order);
            tbl_purchaseorderline.SetRange(tbl_purchaseorderline."Job No.", rec."Job No.");
            tbl_purchaseorderline.SetRange(tbl_purchaseorderline."Job Task No.", rec."Job Task No.");
            if tbl_purchaseorderline.Find('-') then begin
                repeat begin
                    purchaseline_product += tbl_purchaseorderline."Outstanding Amount (LCY)";
                end until tbl_purchaseorderline.Next = 0;
            end;
            rec."Total Cost" := purchaseline_product + rec."Schedule (Total Cost)";
            Rec.Modify();
        end;
        //18-Oct-2024
    end;
}