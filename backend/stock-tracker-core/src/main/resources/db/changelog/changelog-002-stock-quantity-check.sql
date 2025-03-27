--liquibase formatted sql

--changeset savic:002-add-stock-quantity-check
--comment Add CHECK constraint to ensure stock_quantity is non-negative

ALTER TABLE product
ADD CONSTRAINT chk_stock_quantity_non_negative
CHECK (stock_quantity >= 0);
