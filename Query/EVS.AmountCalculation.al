// query 50000 "EVS_AmountCalculation"
// {
//     QueryType = Normal;
//     Caption = 'EVS Amount Calculation';
//     elements
//     {
//         // dataitem(Sales_Invoice_Header; "Sales Invoice Header")
//         // {
//         //     dataitem(Sales_Invoice_Line; "Sales Invoice Line")
//         //     {
//         //         DataItemLink = "Document No." = Sales_Invoice_Header."No.";
//         //         column(Document_No_; "Document No.")
//         //         {
//         //         }
//         //     }
//         // }

//         // dataitem(Job_1; Job)
//         // {
//         dataitem(Sales_Invoice_Line_01; "Sales Invoice Line")
//         {
//             DataItemTableFilter = "Job No." = filter(<> '');

//             // DataItemTableFilter = "Line No." = filter('10000');
//             column(Job_No_; "Job No.")
//             {
//                 Caption = 'Job';
//                 Method = Count;
//             }

//             dataitem(Sales_Invoice_Header_01; "Sales Invoice Header")
//             {
//                 DataItemLink = "No." = Sales_Invoice_Line_01."Document No.";
//                 column(Amount; Amount)
//                 {
//                     Method = Sum;
//                     Caption = 'Total Amount';
//                 }
//                 column(Remaining_Amount; "Remaining Amount")
//                 {
//                     Method = Sum;
//                     Caption = 'Total Remaining Amount';
//                 }
//             }
//             //}
//         }
//     }
// }