# ER Diagram – Database Model

This diagram provides a visual representation of the **relational database structure** for the StockTracker system,
targeting PostgreSQL.

```mermaid
erDiagram
    product {
        bigint id PK "NN"
        varchar(200) name "NN"
        varchar(100) category
        varchar(30) sku UK "NN"
        text description
        int stock_quantity "NN"
        bigint supplier_id FK
    }

    supplier {
        bigint id PK "NN"
        varchar(255) name "NN"
        varchar(100) email
        varchar(20) phone
    }

    stock_movement {
        bigint id PK "NN"
        bigint product_id FK "NN"
        int quantity "NN"
        timestamp timestamp
        varchar(20) type "NN, CHECK (IN ('INBOUND', 'OUTBOUND'))"
        bigint user_id FK
    }

    app_user {
        bigint id PK "NN"
        varchar(50) username UK "NN"
        varchar(255) password "NN"
        varchar(30) role "NN, CHECK (IN ('ADMIN', 'MANAGER', 'WAREHOUSE_STAFF'))"
    }

    audit_log {
        bigint id PK "NN"
        varchar(30) entity_name "NN, CHECK (IN ('PRODUCT', 'SUPPLIER', 'STOCK_MOVEMENT', 'USER'))"
        varchar(30) action "NN, CHECK (IN ('CREATED', 'UPDATED', 'DELETED'))"
        varchar(100) entity_id "NN"
        text details
        varchar(50) username "NN"
        timestamp timestamp
    }

    notification_recipient {
        bigint id PK "NN"
        varchar(100) email "NN"
    }

    product }o--|| supplier : "supplied by"
    stock_movement }o--|| product : "affects"
    stock_movement }o--|| app_user : "performed by"
```

---

## Notes
- The table `app_user` represents the system users.
- Enums like `MovementType`, `UserRole`, etc., are modeled via `CHECK` constraints in varchar columns.
- The `audit_log` and `notification_recipient` tables are standalone, but used by the system services.
- Foreign key relations are marked with `FK`, primary keys with `PK`, unique key with `UK`, not null columns with "NN",<br> and constraint `CHECK` is included as documentation hints of expected values.