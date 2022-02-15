using test1_eric from '../db/schema';

service Main {
    entity Order_Header as projection on test1_eric.Order_Header;
    entity Order_Item as projection on test1_eric.Order_Item;
    function getTotalOrderPrice() returns Integer;
}