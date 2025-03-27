--liquibase formatted sql

--changeset savic:003-insert-test-data context:dev

-- Insert suppliers
INSERT INTO supplier (name, email, phone) VALUES
  ('Dell', 'contact@dell.com', '123456789'),
  ('HP', 'support@hp.com', '987654321');

-- Insert products
INSERT INTO product (name, category, sku, description, stock_quantity, supplier_id) VALUES
  ('Laptop X15', 'Electronics', 'LAP-X15', 'Powerful business laptop with 15-inch display.', 50, 1),
  ('Monitor 27"', 'Displays', 'MON-27', 'Ultra HD 4K monitor', 20, 2);

-- Insert users
INSERT INTO app_user (username, password, role) VALUES
  ('admin', 'admin-pass', 'ADMIN'),
  ('manager', 'manager-pass', 'MANAGER'),
  ('staff', 'warehouse-pass', 'WAREHOUSE_STAFF');

-- Insert stock movements
INSERT INTO stock_movement (product_id, quantity, timestamp, type, user_id) VALUES
  (1, 20, CURRENT_TIMESTAMP, 'INBOUND', 3),
  (1, 5, CURRENT_TIMESTAMP, 'OUTBOUND', 3),
  (2, 10, CURRENT_TIMESTAMP, 'INBOUND', 2);

-- Insert notification recipient
INSERT INTO notification_recipient (email) VALUES
  ('alerts@stocktracker.test');
