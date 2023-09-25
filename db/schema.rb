# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "Categories", primary_key: "CategoryID", force: :cascade do |t|
    t.text "CategoryName"
    t.text "Description"
    t.binary "Picture"
  end

  create_table "CustomerCustomerDemo", primary_key: ["CustomerID", "CustomerTypeID"], force: :cascade do |t|
    t.text "CustomerID", null: false
    t.text "CustomerTypeID", null: false
  end

  create_table "CustomerDemographics", primary_key: "CustomerTypeID", id: :text, force: :cascade do |t|
    t.text "CustomerDesc"
  end

  create_table "Customers", primary_key: "CustomerID", id: :text, force: :cascade do |t|
    t.text "CompanyName"
    t.text "ContactName"
    t.text "ContactTitle"
    t.text "Address"
    t.text "City"
    t.text "Region"
    t.text "PostalCode"
    t.text "Country"
    t.text "Phone"
    t.text "Fax"
  end

  create_table "EmployeeTerritories", primary_key: ["EmployeeID", "TerritoryID"], force: :cascade do |t|
    t.integer "EmployeeID", null: false
    t.text "TerritoryID", null: false
  end

  create_table "Employees", primary_key: "EmployeeID", force: :cascade do |t|
    t.text "LastName"
    t.text "FirstName"
    t.text "Title"
    t.text "TitleOfCourtesy"
    t.date "BirthDate"
    t.date "HireDate"
    t.text "Address"
    t.text "City"
    t.text "Region"
    t.text "PostalCode"
    t.text "Country"
    t.text "HomePhone"
    t.text "Extension"
    t.binary "Photo"
    t.text "Notes"
    t.integer "ReportsTo"
    t.text "PhotoPath"
  end

# Could not dump table "Order Details" because of following StandardError
#   Unknown type 'REAL' for column 'Discount'

  create_table "Orders", primary_key: "OrderID", force: :cascade do |t|
    t.text "CustomerID"
    t.integer "EmployeeID"
    t.datetime "OrderDate", precision: nil
    t.datetime "RequiredDate", precision: nil
    t.datetime "ShippedDate", precision: nil
    t.integer "ShipVia"
    t.decimal "Freight", default: "0.0"
    t.text "ShipName"
    t.text "ShipAddress"
    t.text "ShipCity"
    t.text "ShipRegion"
    t.text "ShipPostalCode"
    t.text "ShipCountry"
  end

  create_table "Products", primary_key: "ProductID", force: :cascade do |t|
    t.text "ProductName", null: false
    t.integer "SupplierID"
    t.integer "CategoryID"
    t.text "QuantityPerUnit"
    t.decimal "UnitPrice", default: "0.0"
    t.integer "UnitsInStock", default: 0
    t.integer "UnitsOnOrder", default: 0
    t.integer "ReorderLevel", default: 0
    t.text "Discontinued", default: "0", null: false
  end

  create_table "Regions", primary_key: "RegionID", force: :cascade do |t|
    t.text "RegionDescription", null: false
  end

  create_table "Shippers", primary_key: "ShipperID", force: :cascade do |t|
    t.text "CompanyName", null: false
    t.text "Phone"
  end

  create_table "Suppliers", primary_key: "SupplierID", force: :cascade do |t|
    t.text "CompanyName", null: false
    t.text "ContactName"
    t.text "ContactTitle"
    t.text "Address"
    t.text "City"
    t.text "Region"
    t.text "PostalCode"
    t.text "Country"
    t.text "Phone"
    t.text "Fax"
    t.text "HomePage"
  end

  create_table "Territories", primary_key: "TerritoryID", id: :text, force: :cascade do |t|
    t.text "TerritoryDescription", null: false
    t.integer "RegionID", null: false
  end

  add_foreign_key "CustomerCustomerDemo", "CustomerDemographics", column: "CustomerTypeID", primary_key: "CustomerTypeID"
  add_foreign_key "CustomerCustomerDemo", "Customers", column: "CustomerID", primary_key: "CustomerID"
  add_foreign_key "EmployeeTerritories", "Employees", column: "EmployeeID", primary_key: "EmployeeID"
  add_foreign_key "EmployeeTerritories", "Territories", column: "TerritoryID", primary_key: "TerritoryID"
  add_foreign_key "Employees", "Employees", column: "ReportsTo", primary_key: "EmployeeID"
  add_foreign_key "Order Details", "Orders", column: "OrderID", primary_key: "OrderID"
  add_foreign_key "Order Details", "Products", column: "ProductID", primary_key: "ProductID"
  add_foreign_key "Orders", "Customers", column: "CustomerID", primary_key: "CustomerID"
  add_foreign_key "Orders", "Employees", column: "EmployeeID", primary_key: "EmployeeID"
  add_foreign_key "Orders", "Shippers", column: "ShipVia", primary_key: "ShipperID"
  add_foreign_key "Products", "Categories", column: "CategoryID", primary_key: "CategoryID"
  add_foreign_key "Products", "Suppliers", column: "SupplierID", primary_key: "SupplierID"
  add_foreign_key "Territories", "Regions", column: "RegionID", primary_key: "RegionID"
end
