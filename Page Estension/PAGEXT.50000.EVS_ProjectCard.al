pageextension 50000 EVS_ProjectCard extends "Job Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("No. of Archived Versions")
        {
            field("Total Invoice Amount"; Rec."Total Invoice Amount")
            {
                ApplicationArea = All;
                Caption = 'Total Invoice Amount';
                ToolTip = 'Total Invoice Amount';
                Editable = false;
            }
            field("Invoice Remaining Amount"; Rec."Invoice Remaining Amount")
            {
                ApplicationArea = All;
                Caption = 'Invoice Remaining Amount';
                ToolTip = 'Invoice Remaining Amount';
                Editable = false;
            }
        }
    }
    actions
    {
    }
    var
        myInt: Integer;
    // ProjectCardInvoiceamount: Codeunit "ProjectCardCalculation";

    trigger OnAfterGetCurrRecord()
    var
        tbl_postedpurchaseorderheader: Record "Purch. Inv. Header";
        tbl_postedpurchaseorderline: Record "Purch. Inv. Line";
        tbl_postedsalesinvoiceheader: Record "Sales Invoice Header";
        tbl_postedsalesinvoiceline: Record "Sales Invoice Line";
        tbl_job: Record "Job";
        product: Decimal;
        totalinvoiceamount: Decimal;
        totalremainingamount: Decimal;

    begin
        clear(totalinvoiceamount);
        clear(totalremainingamount);
        tbl_postedsalesinvoiceline.Init();
        tbl_postedsalesinvoiceline.Reset();
        tbl_postedsalesinvoiceline.SetRange(tbl_postedsalesinvoiceline."Job No.", rec."No.");
        tbl_postedsalesinvoiceline.SetFilter(tbl_postedsalesinvoiceline."Line No.", '10000');
        if tbl_postedsalesinvoiceline.Find('-') then begin
            repeat begin
                tbl_postedsalesinvoiceheader.Init();
                tbl_postedsalesinvoiceheader.Reset();
                tbl_postedsalesinvoiceheader.SetRange(tbl_postedsalesinvoiceheader."No.", tbl_postedsalesinvoiceline."Document No.");
                if tbl_postedsalesinvoiceheader.Find('-') then begin
                    tbl_postedsalesinvoiceheader.CalcFields(Amount);
                    tbl_postedsalesinvoiceheader.CalcFields("Remaining Amount");
                    totalinvoiceamount += tbl_postedsalesinvoiceheader."Amount";
                    totalremainingamount += tbl_postedsalesinvoiceheader."Remaining Amount";
                end;
            end until tbl_postedsalesinvoiceline.Next = 0;

            //21-October-2024
            tbl_job.Init();
            tbl_job.Reset();
            tbl_job.SetRange(tbl_job."No.", Rec."No.");
            if tbl_job.Find('-') then begin
                tbl_job."Total Invoice Amount" := totalinvoiceamount;
                tbl_job."Invoice Remaining Amount" := totalremainingamount;
                tbl_job.Modify;
            end;
            //21-October-2024
        end;
        //rec.Modify();
    end;
}