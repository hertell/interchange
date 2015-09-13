Database  transactions  transactions.txt __SQLDSN__
Database  transactions  DEFAULT_TYPE varchar(128)
Database  transactions  COLUMN_DEF   "code=varchar(24) NOT NULL PRIMARY KEY"
Database  transactions  COLUMN_DEF   "store_id=varchar(9)"
Database  transactions  COLUMN_DEF   "order_number=varchar(24) NOT NULL"
Database  transactions  COLUMN_DEF   "session=varchar(64) NOT NULL"
Database  transactions  COLUMN_DEF   "username=varchar(32) DEFAULT '' NOT NULL"
Database  transactions  COLUMN_DEF   "shipmode=varchar(255)"
Database  transactions  COLUMN_DEF   "nitems=int NOT NULL"
Database  transactions  COLUMN_DEF   "subtotal=decimal(12,2) NOT NULL"
Database  transactions  COLUMN_DEF   "shipping=decimal(12,2) NOT NULL"
Database  transactions  COLUMN_DEF   "handling=decimal(12,2)"
Database  transactions  COLUMN_DEF   "salestax=decimal(12,2)"
Database  transactions  COLUMN_DEF   "total_cost=decimal(12,2) NOT NULL"
Database  transactions  COLUMN_DEF   "fname=varchar(128)"
Database  transactions  COLUMN_DEF   "lname=varchar(128)"
Database  transactions  COLUMN_DEF   "company=varchar(128)"
Database  transactions  COLUMN_DEF   "address1=varchar(128)"
Database  transactions  COLUMN_DEF   "address2=varchar(128)"
Database  transactions  COLUMN_DEF   "city=varchar(128) NOT NULL"
Database  transactions  COLUMN_DEF   "state=varchar(32)"
Database  transactions  COLUMN_DEF   "zip=varchar(32)"
Database  transactions  COLUMN_DEF   "country=varchar(32)"
Database  transactions  COLUMN_DEF   "phone_day=varchar(32)"
Database  transactions  COLUMN_DEF   "phone_night=varchar(32)"
Database  transactions  COLUMN_DEF   "fax=varchar(32)"
Database  transactions  COLUMN_DEF   "email=varchar(128)"
Database  transactions  COLUMN_DEF   "b_fname=varchar(128)"
Database  transactions  COLUMN_DEF   "b_lname=varchar(128)"
Database  transactions  COLUMN_DEF   "b_company=varchar(128)"
Database  transactions  COLUMN_DEF   "b_address1=varchar(128)"
Database  transactions  COLUMN_DEF   "b_address2=varchar(128)"
Database  transactions  COLUMN_DEF   "b_city=varchar(128)"
Database  transactions  COLUMN_DEF   "b_state=varchar(32)"
Database  transactions  COLUMN_DEF   "b_zip=varchar(32)"
Database  transactions  COLUMN_DEF   "b_country=varchar(32)"
Database  transactions  COLUMN_DEF   "b_phone=varchar(32)"
Database  transactions  COLUMN_DEF   "payment_method=varchar(255)"
Database  transactions  COLUMN_DEF   "avs=varchar(255)"
Database  transactions  COLUMN_DEF   "order_id=varchar(32)"
Database  transactions  COLUMN_DEF   "auth_code=varchar(32)"
Database  transactions  COLUMN_DEF   "tracking_number=varchar(64)"
Database  transactions  COLUMN_DEF   "order_date=varchar(32) NOT NULL"
Database  transactions  COLUMN_DEF   "update_date=timestamp"
Database  transactions  COLUMN_DEF   "archived=varchar(1) DEFAULT ''"
Database  transactions  COLUMN_DEF   "deleted=varchar(1) DEFAULT ''"
Database  transactions  COLUMN_DEF   "complete=varchar(1) DEFAULT ''"
Database  transactions  COLUMN_DEF   "status=varchar(32)"
Database  transactions  COLUMN_DEF   "parent=varchar(9)"
Database  transactions  COLUMN_DEF   "comments=text"
Database  transactions  COLUMN_DEF   "currency_locale=varchar(32)"
Database  transactions  COLUMN_DEF   "pay_cert_total=varchar(16)"
Database  transactions  COLUMN_DEF   "pay_cert_ord_total=varchar(16)"
Database  transactions  INDEX         store_id
Database  transactions  INDEX         order_number
Database  transactions  INDEX         order_date
Database  transactions  INDEX         archived
Database  transactions  INDEX         deleted
