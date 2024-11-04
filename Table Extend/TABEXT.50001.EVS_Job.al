tableextension 50001 EVS_JobTableExt extends Job
{
    fields
    {
        field(50001; "Total Invoice Amount"; Decimal)
        {
            Caption = 'Total Invoice Amount';
            DataClassification = ToBeClassified;
        }
        field(50002; "Invoice Remaining Amount"; Decimal)
        {
            Caption = 'Invoice Remaining Amount';
            DataClassification = ToBeClassified;
        }
    }
}
