tableextension 50000 EVS_JobTask extends "Job Task"
{
    fields
    {
#pragma warning disable AL0468
        field(50000; "Outstanding Committed Cost On PO"; Decimal)
#pragma warning restore AL0468
        {
            CalcFormula = Sum("Purchase Line"."Outstanding Amount (LCY)" WHERE("Document Type" = FILTER(Order),
                                                     "Job No." = FIELD("Job No."),
                                                     "Job Task No." = FIELD("Job Task No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "Total Cost"; decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}