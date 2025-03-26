--liquibase formatted sql

--changeset savic:001-init
--comment Initial changeset for creating tables

CREATE TABLE supplier (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE product (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    category VARCHAR(100),
    sku VARCHAR(30) NOT NULL UNIQUE,
    description TEXT,
    stock_quantity INT NOT NULL,
    supplier_id BIGINT NOT NULL,
    CONSTRAINT fk_product_supplier FOREIGN KEY (supplier_id)
        REFERENCES supplier(id) ON DELETE CASCADE
);

CREATE TABLE app_user (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(30) NOT NULL,
    CONSTRAINT chk_app_user_role CHECK (role IN ('ADMIN', 'MANAGER', 'WAREHOUSE_STAFF'))
);

CREATE TABLE stock_movement (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    timestamp TIMESTAMP,
    type VARCHAR(20) NOT NULL,
    user_id BIGINT,
    CONSTRAINT fk_stock_movement_product FOREIGN KEY (product_id)
        REFERENCES product(id) ON DELETE CASCADE,
    CONSTRAINT fk_stock_movement_user FOREIGN KEY (user_id)
        REFERENCES app_user(id) ON DELETE SET NULL,
    CONSTRAINT chk_stock_movement_type CHECK (type IN ('INBOUND', 'OUTBOUND'))
);

CREATE TABLE audit_log (
    id BIGSERIAL PRIMARY KEY,
    entity_name VARCHAR(30) NOT NULL,
    action VARCHAR(30) NOT NULL,
    entity_id VARCHAR(100) NOT NULL,
    details TEXT,
    username VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP,
    CONSTRAINT chk_audit_entity CHECK (entity_name IN ('PRODUCT', 'SUPPLIER', 'STOCK_MOVEMENT', 'USER')),
    CONSTRAINT chk_audit_action CHECK (action IN ('CREATED', 'UPDATED', 'DELETED'))
);

CREATE TABLE notification_recipient (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL
);
