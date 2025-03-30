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
actor "Email Service" as a_es <<service>>

package "Stock Tracker Use Case Diagram" {
  usecase "Add Stock Item" as uc_asi
  usecase "Remove Stock Item" as uc_rsi
  usecase "Update Stock Quantity" as uc_usq
  usecase "View Stock Inventory" as uc_vsi
  usecase "Manage Products" as uc_mp
  usecase "Manage Suppliers" as uc_ms
  usecase "Register Product" as uc_rp
  usecase "Assign Supplier to Product" as uc_s
  usecase "Generate Reports" as uc_gr
  usecase "View Stock Trends" as uc_vst
  usecase "Manage Users" as uc_mu
  usecase "Manage Notification Recipients" as uc_mnr
  usecase "Notify Recipients" as uc_nr
  usecase "Send Low Stock Notification" as uc_lsn
}

a_ws <|- a_m
a_m <|- a_a
a_ws -- uc_asi
a_ws -- uc_rsi
a_ws -- uc_vsi
a_m -- uc_gr
a_m -- uc_vst
a_m -- uc_mp
a_m -- uc_ms
a_a -- uc_mu
a_a -- uc_mnr
uc_nr -- a_es
uc_mp ..> uc_rp : <<include>>
uc_rp <.. uc_s : <<extend>>
uc_asi ..> uc_usq : <<include>>
uc_rsi ..> uc_usq : <<include>>
uc_lsn .u.> uc_rsi : <<extend>>
uc_lsn <.. uc_nr : <<include>>
@startuml
```