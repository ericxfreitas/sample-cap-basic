namespace test1_eric;

entity Order_Item {
   key C_ORDER:         Integer;
   key C_ORDER_ITEM:    Integer;
   C_ITEM_DESC:         String;
   C_PICTURE_URL:       String;
   C_DATE_CREATED:      Date;
   C_VALUE:             Decimal;
}

entity Order_Header {
    key C_ORDER    : Integer;
        C_NAME  : String;
        C_DATE_CREATED: Date;
        C_TOTAL: Decimal;
        Status     : Association to Status;
        items: Association to many Order_Item on items.C_ORDER = $self.C_ORDER;
}

entity Status {
    key C_ID    : Integer;
        C_NAME  : String;
        Order_Header     : Association to many Order_Header on Order_Header.Status = $self;
}