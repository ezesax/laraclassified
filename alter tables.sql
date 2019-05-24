ALTER TABLE posts
ADD price_usd varchar(255),
ADD price_eur varchar(255),
ADD price_brl varchar(255),
ADD price_clp varchar(255),
ADD price_ars varchar(255),
ADD negotiable_usd varchar(255),
ADD negotiable_eur varchar(255),
ADD negotiable_brl varchar(255),
ADD negotiable_clp varchar(255),
ADD negotiable_ars varchar(255),
ADD currency varchar(255)

ALTER TABLE payments
ADD status varchar(255)

ALTER TABLE payments
MODIFY COLUMN payment_method_id varchar(255)