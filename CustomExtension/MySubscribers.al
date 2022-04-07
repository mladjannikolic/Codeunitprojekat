codeunit 50101 MySubscribers
{
    [EventSubscriber(ObjectType::Page, Page::"Customer List", 'OnCallPublisher', '', true, true)]
    local procedure MessageOnCallPublisher(var Customer: Record Customer)
    var
        TxtMsg: Label 'You have succceeded %1.', Comment = '%1: Customer Name';
    begin
        Message(TxtMsg, Customer.Name);
    end;
}