// codeunit 50000 ProjectCardCalculation
// {
//     trigger OnRun()
//     begin
//     end;

//     var
//         myInt: Integer;
//         tbl_postedpurchaseorderheader: Record "Purch. Inv. Header";
//         tbl_postedpurchaseorderline: Record "Purch. Inv. Line";
//         tbl_postedsalesinvoiceheader: Record "Sales Invoice Header";
//         tbl_postedsalesinvoiceline: Record "Sales Invoice Line";
//         product: Decimal;
//         localjobNo: Record "Job";

//     procedure UpdateInvoiceAmount(tablejob: Record "Job")
//     var

//     begin
//         localjobNo := tablejob;
//         clear(localjobNo."Total Invoice Amount");
//         tbl_postedsalesinvoiceline.Init();
//         tbl_postedsalesinvoiceline.Reset();
//         tbl_postedsalesinvoiceline.SetRange(tbl_postedsalesinvoiceline."Job No.", localjobNo."No.");
//         tbl_postedsalesinvoiceline.SetFilter(tbl_postedsalesinvoiceline."Line No.", '10000');
//         if tbl_postedsalesinvoiceline.Find('-') then begin
//             repeat begin
//                 tbl_postedsalesinvoiceheader.Init();
//                 tbl_postedsalesinvoiceheader.Reset();
//                 tbl_postedsalesinvoiceheader.SetRange(tbl_postedsalesinvoiceheader."No.", tbl_postedsalesinvoiceline."Document No.");
//                 if tbl_postedsalesinvoiceheader.Find('-') then begin
//                     tbl_postedsalesinvoiceheader.CalcFields(Amount);
//                     localjobNo."Total Invoice Amount" += tbl_postedsalesinvoiceheader."Amount";
//                 end;
//             end until tbl_postedsalesinvoiceline.Next = 0;
//         end;
//         localjobNo.Modify();
//     end;

//     procedure UpdateRemainingInvoiceAmount(tablejob: Record "Job")
//     begin
//         localjobNo := tablejob;
//         clear(localjobNo."Total Invoice Amount");
//         tbl_postedsalesinvoiceline.Init();
//         tbl_postedsalesinvoiceline.Reset();
//         tbl_postedsalesinvoiceline.SetRange(tbl_postedsalesinvoiceline."Job No.", localjobNo."No.");
//         tbl_postedsalesinvoiceline.SetFilter(tbl_postedsalesinvoiceline."Line No.", '10000');
//         if tbl_postedsalesinvoiceline.Find('-') then begin
//             repeat begin
//                 tbl_postedsalesinvoiceheader.Init();
//                 tbl_postedsalesinvoiceheader.Reset();
//                 tbl_postedsalesinvoiceheader.SetRange(tbl_postedsalesinvoiceheader."No.", tbl_postedsalesinvoiceline."Document No.");
//                 if tbl_postedsalesinvoiceheader.Find('-') then begin
//                     tbl_postedsalesinvoiceheader.CalcFields("Remaining Amount");
//                     localjobNo."Invoice Remaining Amount" += tbl_postedsalesinvoiceheader."Remaining Amount";
//                 end;
//             end until tbl_postedsalesinvoiceline.Next = 0;
//         end;
//         localjobNo.Modify();
//     end;
// }