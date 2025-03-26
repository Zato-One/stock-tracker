# Class Diagram – Domain Model

This diagram provides an overview of the **core domain model** of the StockTracker system.  
It shows all key entities (business-focused classes) and their relationships.  
The model includes products, stock movements, suppliers, users, roles, audit logs, and notification recipients.

```mermaid
classDiagram
    class Product {
        -Long id
        -String name
        -String category
        -String sku
        -String description
        -int stockQuantity
        -Supplier supplier
        
        -String generateSku()
    }

    class Supplier {
        -Long id
        -String name
        -String email
        -String phone
    }

    class StockMovement {
        -Long id
        -Product product
        -int quantity
        -LocalDateTime timestamp
        -MovementType type
        -User user
    }

    class MovementType {
        <<enumeration>>
        INBOUND
        OUTBOUND
    }

    class User {
        -Long id
        -String username
        -String password
        -UserRole role
    }

    class UserRole {
        <<enumeration>>
        ADMIN
        MANAGER
        WAREHOUSE_STAFF
    }

    class AuditLog {
        -Long id
        -EntityName entityName
        -AuditLogAction action
        -String entityId
        -String username
        -LocalDateTime timestamp
    }
    
    class EntityName {
        <<enumeration>>
        PRODUCT
        STOCK_MOVEMENT
        SUPPLIER
        USER
    }
    
    class AuditLogAction {
        <<enumeration>>
        CREATED
        UPDATED
        DELETED
    }

    class NotificationRecipient {
        -Long id
        -String email
    }

    %% Relationships
    StockMovement "*" --> "1" MovementType
    StockMovement "*" --> "1" User : performed by
    Product "*" o-- "1" Supplier : supplied by
    StockMovement "*" o-- "1" Product
    User "*" o-- "1" UserRole 
    AuditLog "*" --> "1" EntityName
    AuditLog "*" --> "1" AuditLogAction

    %% Notes
    note for AuditLog "Logs changes made to core entities<br/> by authenticated users."
    note for NotificationRecipient "The recipients are used by EmailService<br> to send system notifications to their email<br> (e.g. low stock alerts)."
```