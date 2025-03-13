# Use Case Diagram - StockTracker

## Overview
This diagram represents the key interactions between users and the system.

## **Description**
The following PlantUML code serves as the **source for generating a diagram**.  
It can be copied and pasted into the **[PlantUML Online Editor](http://www.plantuml.com/plantuml/uml)**
to visualize or export the diagram as an image.

---

#### **PlantUML Source Code:**
```plantuml
@startuml
left to right direction
actor "Admin" as a_a
actor "Manager" as a_m
actor "Warehouse Staff" as a_ws

package "Stock Tracker" {
  usecase "Manage Users" as uc_mu
  usecase "Register Product in System" as uc_rp
  usecase "Update Stock Level" as uc_usl
  usecase "Assign Supplier to Product" as uc_s
  usecase "Add Stock Item" as uc_asi
  usecase "Remove Stock Item" as uc_rsi
  usecase "View Inventory" as uc_vi
  usecase "Generate Reports" as uc_gr
  usecase "View Stock Trends" as uc_vst
}

a_ws <|- a_m
a_m <|- a_a
a_ws -- uc_asi
a_ws -- uc_rsi
a_ws -- uc_vi
a_m -- uc_gr
a_m -- uc_vst
a_m -- uc_rp
a_a -- uc_mu
uc_rp --> uc_s
uc_asi ..> uc_usl : <<include>>
uc_rsi ..> uc_usl : <<include>>
@startuml
```