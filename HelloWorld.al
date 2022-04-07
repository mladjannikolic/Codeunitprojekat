// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50120 CustomerListExt extends "Customer List"
{

    actions
    {

        addlast("&Customer")
        {
            action(CallPublisher)
            {
                ApplicationArea = All;
                Tooltip = 'Trinidad';
                Promoted = true;
                PromotedCategory = Process;
                Image = "8ball";

                trigger OnAction()
                begin
                    OnCallPublisher(Rec);
                end;
            }
        }
    }

    //novagrana 

    [IntegrationEvent(false, false)]
    local procedure OnCallPublisher(var Customer: Record Customer)
    begin
    end;

    /* trigger OnOpenPage();
     var
         mladjan: Codeunit Mladjan;
     begin
         /*mladjan.Run();
         mladjan.Mladjan();
         mladjan.setKristina(5);
         Message('%1', mladjan.getKristina())
     end; */



}