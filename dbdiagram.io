Table "je"."scentity" {
  "id" int [pk]
  "merchant_name" varchar(30)
  "mobile" varchar(15)
  "email" varchar(50)
  "address" varchar(40)
  "created at" timestamp
  "status" int
  "due_ammount" float
  "gst" varchar(255)
  "created_by" varchar(10)
}

Table "je"."sdentity" {
  "id" int [pk]
  "merchant_name" varchar(30)
  "mobile" varchar(15)
  "email" varchar(50)
  "address" varchar(40)

  "created at" timestamp
  "status" int
  "due_ammount" float
  "gst" varchar(17)
  "created_by" varchar(10)
}
Table "je"."product_main" {
  "id" int [pk]
  "name" varchar(50)
  "created at" timestamp
  "unit" varchar(255)
  "current_stock" float
  "status" int
}
Table "je"."product_sub" {
  "id" int [pk]
  "main_prod" varchar(5)
  "name" varchar(50)
  "created at" timestamp
  "current_stock" float
  "status" int
}
Table "je"."product_entry_main" {
  "id" int [pk]
  "chalan_no" varchar
  "from" varchar(20)
  "recived_date" date
  "delivary_mode" varchar(10)
  "created at" timestamp
  "total_amount" float
  "remarks" varchar(100)
  "created_by" varchar(10)
}

Table "je"."product_entry_history" {
  "id" int
  "entry_id" int
  "created at" timestamp
  "product" varchar(20)
  "qty" float
  "amount" float
  "remarks" varchar(100)

  Indexes {
    (id, entry_id) [pk]
  }
}
Table "je"."secuence" {
  "id" int [pk]
  "type" varchar(20)
  "head" varchar(20)
  "sno" varchar(20)
  "remarks" varchar(40)
  "status" bool
  "created at" timestamp
}

Table "je"."appinfo" {
  "id" int
  "name" varchar(50)
  "logo" varchar(100)
  "address" varchar(100)
  "gstno" varchar(17)
}

Table "je"."appuser" {
  "id" int
  "name" varchar(50)
  "mobile" varchar(15)
  "email" varchar(50)
  "password" varchar(255)
  "role" varchar(2)
  "sign" varchar(100)
  "status" varchar(1)
  "is_logedin" varchar(1)
  "lastlogin_time" timestamp
  "lastlogin_from" varchar(30)
}
Table "je"."product_delivary_main" {
  "id" int [pk]
  "chalan_no" varchar(50)
  "to" varchar(20)
  "delivary_date" date
  "delivary_mode" varchar(10)
  "created_at" timestamp
  "total_amount" float
  "remarks" varchar(100)
  "created_by" varchar(10)
}

Table "je"."product_delivery_history" {
  "id" int
  "entry_id" int
  "created_at" timestamp
  "product" varchar(10)
  "qty" float
  "amount" float
  "remarks" varchar(100)

  Indexes {
    (id, entry_id) [pk]
  }
}
Table "je"."sc_payment_entry" {
  "id" int [pk]
  "scid" int
  "created_at" timestamp
  "amount" float
  "mode" varchar(10)
  "hisamount" float
  "curamount" float
  "remarks" varchar(100)
  "created_by" varchar(10)
}

Table "je"."sd_payment_entry" {
  "id" int [pk]
  "sdid" int
  "created_at" timestamp
  "amount" float
  "mode" varchar(10)
  "hisamount" float
  "curamount" float
  "remarks" varchar(100)
  "created_by" varchar(10)
}

Table "je"."invoice_gst_main" {
  "id" int [pk]
  "invoice_no" varchar(30)
  "to" varchar(20)
  "gst" varbinary
  "inovice_date" date
  "gross_amount" float
  "cgst_amount" float
  "ssgst_amount" float
  "total_amount" float
  "remarks" varchar(100)
  "created_at" timestamp
  "created_by" varchar(10)
  "paid" bool
}

Table "je"."invoice_gst_history" {
  "id" int
  "entry_id" int
  "created at" timestamp
  "product" varchar(255)
  "qty" float
  "HSN" varchar(8)
  "cgst" varchar(10)
  "sgst" varchar(10)
  "gross_amount" float
  "total_ammount" float
  "remarks" varchar(100)

  Indexes {
    (id, entry_id) [pk]
  }
}

Table "je"."leadger_sc" {
  "id" int [pk]
  "name" varchar(50)
  "date" date
  "type" varchar(20)
  "current_amomount" float
  "truns_ammount" float
  "mode" varchar(10)
  "remarks" varchar(50)
  "refno" varchar(50)
  "created at" timestamp
  "created by" varchar(20)
}

Table "je"."leadger_sd" {
  "id" int [pk]
  "name" varchar(50)
  "date" date
  "type" varchar(20)
  "current_amomount" float
  "truns_ammount" float
  "mode" varchar(10)
  "remarks" varchar(50)
  "refno" varchar(50)
  "created at" timestamp
  "created by" varchar(20)
}

Ref: "je"."product_sub"."main_prod" < "je"."product_main"."id"

Ref: "je"."product_sub"."id" < "je"."product_entry_history"."product"

Ref: "je"."product_entry_history"."entry_id" < "je"."product_entry_main"."id"

Ref: "je"."scentity"."id" < "je"."product_entry_main"."from"

Ref: "je"."appuser"."id" < "je"."product_entry_main"."created_by"

Ref: "je"."sdentity"."id" < "je"."product_delivary_main"."to"

Ref: "je"."product_delivary_main"."id" < "je"."product_delivery_history"."entry_id"

Ref: "je"."sc_payment_entry"."scid" < "je"."scentity"."id"

Ref: "je"."sd_payment_entry"."id" < "je"."sdentity"."id"

Ref: "je"."sd_payment_entry"."created_by" < "je"."appuser"."id"

Ref: "je"."sc_payment_entry"."created_by" < "je"."appuser"."id"

Ref: "je"."scentity"."created_by" < "je"."appuser"."id"

Ref: "je"."sdentity"."created_by" < "je"."appuser"."id"

Ref: "je"."invoice_gst_main"."id" < "je"."invoice_gst_history"."entry_id"

Ref: "je"."invoice_gst_main"."created_by" < "je"."appuser"."id"

Ref: "je"."invoice_gst_main"."to" < "je"."sd_payment_entry"."id"

Ref: "je"."invoice_gst_history"."product" < "je"."product_sub"."id"

Ref: "je"."leadger_sc"."name" < "je"."sc_payment_entry"."id"

Ref: "je"."leadger_sd"."name" < "je"."sd_payment_entry"."id"

Ref: "je"."leadger_sd"."created by" < "je"."appuser"."id"

Ref: "je"."leadger_sc"."created by" < "je"."appuser"."id"