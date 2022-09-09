CREATE TABLE `tbl_fault_log_prod` (
  `ID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `VacItemID` varchar(50) NOT NULL
,  `FaultID` integer DEFAULT NULL
,  `DateIn` datetime DEFAULT NULL
,  `DateFixed` datetime DEFAULT NULL
,  `WhoFixed` varchar(255) DEFAULT NULL
,  `DocumentLink` text DEFAULT NULL
,  `Status` integer DEFAULT NULL
,  `FaultDetails` text DEFAULT NULL
,  `Supplier Reference` varchar(255) DEFAULT NULL
,  UNIQUE (`ID`)
);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE `tbl_loan_log` (
  `LoanID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `VacItemID` varchar(50) DEFAULT NULL
,  `VacItemTypeID` varchar(8) NOT NULL
,  `LoanedTo:` varchar(255) DEFAULT NULL
,  `LoanedBy:` varchar(255) DEFAULT NULL
,  `Comments` text DEFAULT NULL
,  `DateOut` datetime DEFAULT NULL
,  `ExpectedReturnDate` datetime DEFAULT NULL
,  `StorageLocation` varchar(50) DEFAULT NULL
,  `LoanedFrom:` integer DEFAULT NULL
,  UNIQUE (`LoanID`)
,  UNIQUE (`VacItemID`)
);
CREATE TABLE `tbl_stock_goods-in_prods` (
  `Goods-inItemID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `EprocNumber` varchar(255) NOT NULL
,  `VacItemTypeID` varchar(8) NOT NULL
,  `VacItemID` varchar(13) DEFAULT NULL
,  `SerialNumber` varchar(50) DEFAULT NULL
,  `Quantity` integer NOT NULL
,  `WarrantyExpiryDate` datetime DEFAULT NULL
,  `Dispatched` integer NOT NULL
,  `Unitprice` float DEFAULT NULL
,  `Comments` text DEFAULT NULL
,  `StorageLocation` varchar(255) DEFAULT NULL
,  `Owner` integer DEFAULT NULL
,  UNIQUE (`Goods-inItemID`)
,  UNIQUE (`SerialNumber`)
,  CONSTRAINT `tbl_stock_goods-in_prods_EprocNumber_fk` FOREIGN KEY (`EprocNumber`) REFERENCES `tbl_stock_goods-in` (`EprocNumber`)
,  CONSTRAINT `tbl_stock_goods-in_prods_VacItemTypeID_fk` FOREIGN KEY (`VacItemTypeID`) REFERENCES `xtbl_vacuum_catalogue` (`VacItemTypeID`)
);
CREATE TABLE `tbl_stock_quanties_by_owners` (
  `ID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `VacItemTypeID` varchar(8) NOT NULL
,  `Owner` integer DEFAULT NULL
,  `Quantity` integer DEFAULT NULL
,  `Storage Location` varchar(255) DEFAULT NULL
,  UNIQUE (`ID`)
,  CONSTRAINT `tbl_stock_quanties_by_owners_VacItemTypeID_fk` FOREIGN KEY (`VacItemTypeID`) REFERENCES `xtbl_vacuum_catalogue` (`VacItemTypeID`)
);
CREATE TABLE `tbl_transaction_history` (
  `ID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `Date_time` datetime DEFAULT NULL
,  `Who` varchar(50) DEFAULT NULL
,  `VacItemID` varchar(50) NOT NULL
,  `SerialNumber` varchar(50) DEFAULT NULL
,  `Quantity` varchar(50) DEFAULT NULL
,  `Job` varchar(50) DEFAULT NULL
,  `location` varchar(50) DEFAULT NULL
,  `comments` text DEFAULT NULL
,  `VacItemTypeID` varchar(50) DEFAULT NULL
,  `TransactionType` varchar(50) DEFAULT NULL
,  `Owner` varchar(255) DEFAULT NULL
,  UNIQUE (`ID`)
,  CONSTRAINT `tbl_transaction_history_VacItemTypeID_fk` FOREIGN KEY (`VacItemTypeID`) REFERENCES `xtbl_vacuum_catalogue` (`VacItemTypeID`)
);
CREATE TABLE `tbl_vac_hold` (
  `HoldAreaID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `HoldAreaName` varchar(50) NOT NULL
,  `HoldDescription` varchar(50) NOT NULL
,  `HoldOwner` integer NOT NULL
,  `DesignatedLocation` varchar(50) DEFAULT NULL
,  `DateCreated` datetime NOT NULL
,  `DateClosed` datetime DEFAULT NULL
,  `HoldType` varchar(50) DEFAULT NULL
,  UNIQUE (`HoldAreaID`)
);
CREATE TABLE `tbl_vac_hold_prod` (
  `HoldAreaID` integer NOT NULL
,  `VacItemTypeID` varchar(8) NOT NULL
,  `SerialNumber` varchar(50) DEFAULT NULL
,  `HereSince` datetime NOT NULL
,  `WarrantyExpires` datetime DEFAULT NULL
,  `Cost` float DEFAULT NULL
,  `SignedInBy` varchar(50) NOT NULL
,  `Comments` varchar(50) DEFAULT NULL
,  `StorageLocation` varchar(50) DEFAULT NULL
,  `FaultLogged` integer NOT NULL
,  `VacItemID` varchar(13) NOT NULL
,  `HoldID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `DateIn` varchar(50) DEFAULT NULL
,  `EprocID` varchar(50) DEFAULT NULL
,  UNIQUE (`HoldID`)
,  UNIQUE (`VacItemID`)
,  CONSTRAINT `tbl_vac_hold_prod_HoldAreaID_fk` FOREIGN KEY (`HoldAreaID`) REFERENCES `tbl_vac_hold` (`HoldAreaID`)
,  CONSTRAINT `tbl_vac_hold_prod_VacItemTypeID_fk` FOREIGN KEY (`VacItemTypeID`) REFERENCES `xtbl_vacuum_catalogue` (`VacItemTypeID`)
);
CREATE TABLE `tmp_shopping_list_template` (
  `ID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `VacItemID` varchar(50) DEFAULT NULL
,  `Quantity` integer NOT NULL
,  `Location` varchar(50) NOT NULL
,  `Comments` text DEFAULT NULL
,  `Job` varchar(50) NOT NULL
,  `VacItemTypeID` varchar(8) DEFAULT NULL
,  `SerialNumber` varchar(50) DEFAULT NULL
,  `CommonName` varchar(50) DEFAULT NULL
,  `StoreLocation` varchar(50) DEFAULT NULL
,  UNIQUE (`ID`)
,  CONSTRAINT `tmp_shopping_list_template_VacItemID_fk` FOREIGN KEY (`VacItemID`) REFERENCES `tbl_stock_spares_prod` (`VacItemID`) ON DELETE CASCADE
);
CREATE TABLE `xtbl_diamond_area_deviceNumbers` (
  `Area&DeviceNumberID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `Area&DeviceNumber` varchar(50) DEFAULT NULL
,  UNIQUE (`Area&DeviceNumberID`)
);
CREATE TABLE `xtbl_diamond_machine_areas` (
  `AreaID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `AreaName` varchar(50) DEFAULT NULL
,  UNIQUE (`AreaID`)
);
CREATE TABLE `xtbl_diamond_machine_sections` (
  `SctionID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `SectionName` varchar(50) DEFAULT NULL
,  UNIQUE (`SctionID`)
);
CREATE TABLE `xtbl_equip_subtype1` (
  `ID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `Equipment Type Name` varchar(255) NOT NULL
,  `Equipment Sub Type Name` varchar(255) NOT NULL
,  `Additional Information` varchar(255) DEFAULT NULL
,  `Equipment Sub Type ID Start` varchar(255) DEFAULT NULL
,  `Equipment Sub Type ID End` varchar(255) DEFAULT NULL
,  UNIQUE (`ID`)
);
CREATE TABLE `xtbl_equip_subtype2` (
  `ID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `Equipment Sub Type Name` varchar(255) NOT NULL
,  `Equipment Sub Type 2 Name` varchar(255) NOT NULL
,  `Additional Information` varchar(255) DEFAULT NULL
,  UNIQUE (`ID`)
);
CREATE TABLE `xtbl_equip_subtype2_components` (
  `ID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `Equipment Sub Type 2 Name` varchar(255) NOT NULL
,  `Component Name` varchar(255) NOT NULL
,  `Additional Information` varchar(255) DEFAULT NULL
,  UNIQUE (`ID`)
);
CREATE TABLE `xtbl_equip_type` (
  `ID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `Equipment Type ID Start` integer DEFAULT NULL
,  `Equipment Type ID End` integer DEFAULT NULL
,  `Equipment Type Name` varchar(255) NOT NULL
,  `Additional Information` varchar(255) DEFAULT NULL
,  UNIQUE (`ID`)
,  UNIQUE (`Equipment Type Name`)
);
CREATE TABLE `xtbl_fault_repair_status` (
  `ID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `Status` varchar(255) DEFAULT NULL
,  UNIQUE (`ID`)
);
CREATE TABLE `xtbl_vac_build_areas` (
  `BuildareaID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `BuildArea` varchar(50) DEFAULT NULL
,  `BuildAreaContact1` integer DEFAULT NULL
,  `BuildAreaContact2` integer DEFAULT NULL
,  `Active` integer NOT NULL
,  UNIQUE (`BuildareaID`)
);
CREATE TABLE `xtbl_vac_jobs` (
  `Job ID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `Job Name` varchar(50) DEFAULT NULL
,  `Job Description` varchar(50) DEFAULT NULL
,  UNIQUE (`Job ID`)
);
CREATE TABLE `xtbl_vac_stock_areas` (
  `ID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `Areas` varchar(50) DEFAULT NULL
,  UNIQUE (`ID`)
);
CREATE TABLE `xtbl_vac_stock_owners` (
  `OwnerID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `Project` varchar(50) NOT NULL
,  `ProjectContact1` integer NOT NULL
,  `ProjectContact2` integer DEFAULT NULL
,  UNIQUE (`OwnerID`)
,  UNIQUE (`Project`)
);
CREATE TABLE `xtbl_vac_stock_types` (
  `ID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `StockType` varchar(50) DEFAULT NULL
,  UNIQUE (`ID`)
);
CREATE TABLE `xtbl_vac_store_locations` (
  `StoreLocationID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `StoreLocation` varchar(50) NOT NULL
,  `StoreKeeper1` varchar(50) NOT NULL
,  `StoreKeeper2` varchar(50) DEFAULT NULL
,  UNIQUE (`StoreLocationID`)
);
CREATE TABLE `xtbl_vac_suppliers` (
  `SupplierID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `SupplierName` varchar(50) DEFAULT NULL
,  `ContactName` varchar(50) DEFAULT NULL
,  `ContactTitle` varchar(50) DEFAULT NULL
,  `Address` varchar(255) DEFAULT NULL
,  `City` varchar(50) DEFAULT NULL
,  `PostalCode` varchar(20) DEFAULT NULL
,  `StateOrProvince` varchar(20) DEFAULT NULL
,  `Country/Region` varchar(50) DEFAULT NULL
,  `PhoneNumber` varchar(30) DEFAULT NULL
,  `FaxNumber` varchar(30) DEFAULT NULL
,  `PaymentTerms` varchar(255) DEFAULT NULL
,  `EmailAddress` varchar(50) DEFAULT NULL
,  `Notes` text DEFAULT NULL
,  UNIQUE (`SupplierID`)
);
CREATE TABLE `ztbl_diamond_contact` (
  `ID` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `First Name` varchar(50) DEFAULT NULL
,  `Last Name` varchar(50) DEFAULT NULL
,  `Job Title` varchar(20) DEFAULT NULL
,  `Group` varchar(50) DEFAULT NULL
,  `Extension Number` varchar(10) DEFAULT NULL
,  `Mobile Phone` varchar(30) DEFAULT NULL
,  `Email Address` varchar(50) DEFAULT NULL
,  `Primary` integer NOT NULL
,  `Initial` varchar(50) DEFAULT NULL
,  UNIQUE (`ID`)
);
CREATE INDEX "idx_tbl_loan_log_VacItemTypeID" ON "tbl_loan_log" (`VacItemTypeID`);
CREATE INDEX "idx_xtbl_equip_subtype1_Equipment Sub Type Name" ON "xtbl_equip_subtype1" (`Equipment Sub Type Name`);
CREATE INDEX "idx_xtbl_equip_subtype1_Equipment Type ID Start" ON "xtbl_equip_subtype1" (`Equipment Sub Type ID Start`);
CREATE INDEX "idx_xtbl_equip_subtype1_xtbl_equip_subtype1Equipment Type Name" ON "xtbl_equip_subtype1" (`Equipment Type Name`);
CREATE INDEX "idx_xtbl_equip_subtype2_Equipment Type ID" ON "xtbl_equip_subtype2" (`Equipment Sub Type 2 Name`);
CREATE INDEX "idx_xtbl_equip_subtype2_Equipment Type ID1" ON "xtbl_equip_subtype2" (`Equipment Sub Type Name`);
CREATE INDEX "idx_tmp_shopping_list_template_VacItemID" ON "tmp_shopping_list_template" (`VacItemID`);
CREATE INDEX "idx_tmp_shopping_list_template_VacItemTypeID" ON "tmp_shopping_list_template" (`VacItemTypeID`);
CREATE INDEX "idx_xtbl_diamond_machine_sections_AreaID" ON "xtbl_diamond_machine_sections" (`SctionID`);
CREATE INDEX "idx_xtbl_equip_subtype2_components_Component Name" ON "xtbl_equip_subtype2_components" (`Component Name`);
CREATE INDEX "idx_xtbl_equip_subtype2_components_xtbl_equip_subtype2_componentsEquipment Sub Type 2 Name" ON "xtbl_equip_subtype2_components" (`Equipment Sub Type 2 Name`);
CREATE INDEX "idx_ztbl_diamond_contact_Last Name" ON "ztbl_diamond_contact" (`Last Name`);
CREATE INDEX "idx_tbl_transaction_history_VacItemTypeID" ON "tbl_transaction_history" (`VacItemTypeID`);
CREATE INDEX "idx_tbl_stock_goods-in_prods_VacItemTypeID" ON "tbl_stock_goods-in_prods" (`VacItemTypeID`);
CREATE INDEX "idx_tbl_stock_goods-in_prods_tbl_stock_goods-in_prods_EprocNumber_fk" ON "tbl_stock_goods-in_prods" (`EprocNumber`);
CREATE INDEX "idx_tbl_vac_hold_prod_EprocID" ON "tbl_vac_hold_prod" (`EprocID`);
CREATE INDEX "idx_tbl_vac_hold_prod_VacItemID" ON "tbl_vac_hold_prod" (`HoldAreaID`);
CREATE INDEX "idx_tbl_vac_hold_prod_VacItemTypeID" ON "tbl_vac_hold_prod" (`VacItemTypeID`);
CREATE INDEX "idx_tbl_fault_log_prod_FaultID" ON "tbl_fault_log_prod" (`FaultID`);
CREATE INDEX "idx_tbl_fault_log_prod_tbl_fault_log_prodVacItemID" ON "tbl_fault_log_prod" (`VacItemID`);
CREATE INDEX "idx_xtbl_vac_stock_owners_BuildareaID" ON "xtbl_vac_stock_owners" (`OwnerID`);
CREATE INDEX "idx_xtbl_vac_suppliers_ContactName" ON "xtbl_vac_suppliers" (`ContactName`);
CREATE INDEX "idx_xtbl_vac_suppliers_EmailAddress" ON "xtbl_vac_suppliers" (`EmailAddress`);
CREATE INDEX "idx_xtbl_vac_suppliers_PostalCode" ON "xtbl_vac_suppliers" (`PostalCode`);
CREATE INDEX "idx_xtbl_vac_suppliers_SupplierName" ON "xtbl_vac_suppliers" (`SupplierName`);
CREATE INDEX "idx_xtbl_equip_type_Equipment Type ID" ON "xtbl_equip_type" (`Equipment Type ID Start`);
CREATE INDEX "idx_tbl_stock_quanties_by_owners_VacItemTypeID" ON "tbl_stock_quanties_by_owners" (`VacItemTypeID`);
CREATE TABLE IF NOT EXISTS "xtbl_vacuum_catalogue" (
	"VacItemTypeID"	varchar(8) NOT NULL,
	"CommonName"	varchar(50) DEFAULT NULL,
	"Device"	varchar(255) DEFAULT NULL,
	"Category"	varchar(255) DEFAULT NULL,
	"Type"	varchar(255) DEFAULT NULL,
	"Components"	varchar(255) DEFAULT NULL,
	"ItemID: ####-XXX-XXXX"	varchar(255) DEFAULT NULL,
	"Sub Components1"	varchar(255) DEFAULT NULL,
	"Sub Components2"	varchar(255) DEFAULT NULL,
	"ItemID XXXX-###-XXXX"	varchar(255) DEFAULT NULL,
	"Supplier Part Number"	varchar(255) DEFAULT NULL,
	"Supplier1"	varchar(255) DEFAULT NULL,
	"Supplier2"	varchar(255) DEFAULT NULL,
	"Supplier3"	varchar(255) DEFAULT NULL,
	"Manufacturer1"	varchar(255) DEFAULT NULL,
	"Manufacturer2"	varchar(255) DEFAULT NULL,
	"Manufacturer3"	varchar(255) DEFAULT NULL,
	"Cost"	varchar(255) DEFAULT NULL,
	"Quotation Reference Number"	varchar(255) DEFAULT NULL,
	"WHO"	varchar(255) DEFAULT NULL,
	"NextItemID"	integer DEFAULT NULL,
	"Stock Type"	integer DEFAULT NULL,
	"Default IVS Location"	integer DEFAULT NULL,
	"Default Vacuum Owner"	integer DEFAULT NULL,
	"Picture Directory"	varchar(255) DEFAULT NULL,
	"ID"	INTEGER,
	CONSTRAINT "xtbl_vacuum_catalogue_Stock Type_fk" FOREIGN KEY("Stock Type") REFERENCES "xtbl_vac_stock_types"("ID") ON UPDATE CASCADE,
	UNIQUE("VacItemTypeID"),
	PRIMARY KEY("ID")
);
CREATE INDEX "idx_xtbl_vacuum_catalogue_xtbl_vacuum_catalogue_Stock Type_fk" ON "xtbl_vacuum_catalogue" (
	"Stock Type"
);
CREATE TABLE IF NOT EXISTS "FEZ13_2009_Stock" (
	"VacItemID"	varchar(50) DEFAULT NULL,
	"SerialNumber"	varchar(50) DEFAULT NULL,
	"VacItemTypeID"	varchar(8) NOT NULL,
	"id"	INTEGER,
	UNIQUE("VacItemID"),
	PRIMARY KEY("id")
);
CREATE INDEX "idx_FEZ13_2009_Stock_SerialNumber" ON "FEZ13_2009_Stock" (
	"SerialNumber"
);
CREATE INDEX "idx_FEZ13_2009_Stock_VacItemTypeID" ON "FEZ13_2009_Stock" (
	"VacItemTypeID"
);
CREATE TABLE IF NOT EXISTS "IVS_2009_Stock" (
	"VacItemID"	varchar(50) DEFAULT NULL,
	"SerialNumber"	varchar(50) DEFAULT NULL,
	"VacItemTypeID"	varchar(8) NOT NULL,
	"id"	INTEGER,
	UNIQUE("VacItemID"),
	PRIMARY KEY("id")
);
CREATE INDEX "idx_IVS_2009_Stock_SerialNumber" ON "IVS_2009_Stock" (
	"SerialNumber"
);
CREATE INDEX "idx_IVS_2009_Stock_VacItemTypeID" ON "IVS_2009_Stock" (
	"VacItemTypeID"
);
CREATE TABLE IF NOT EXISTS "FE_spares_2009_Stock" (
	"VacItemID"	varchar(50) DEFAULT NULL,
	"SerialNumber"	varchar(50) DEFAULT NULL,
	"VacItemTypeID"	varchar(8) NOT NULL,
	"id"	INTEGER,
	UNIQUE("VacItemID"),
	PRIMARY KEY("id")
);
CREATE INDEX "idx_FE_spares_2009_Stock_SerialNumber" ON "FE_spares_2009_Stock" (
	"SerialNumber"
);
CREATE INDEX "idx_FE_spares_2009_Stock_VacItemTypeID" ON "FE_spares_2009_Stock" (
	"VacItemTypeID"
);
CREATE TABLE IF NOT EXISTS "IVS_Mech_Consumables_2009_Stock" (
	"VacItemTypeID"	varchar(8) NOT NULL,
	"id"	INTEGER,
	PRIMARY KEY("id")
);
CREATE INDEX "idx_IVS_Mech_Consumables_2009_Stock_VacItemTypeID" ON "IVS_Mech_Consumables_2009_Stock" (
	"VacItemTypeID"
);
CREATE TABLE IF NOT EXISTS "R79_2009_Stock" (
	"VacItemID"	varchar(50) DEFAULT NULL,
	"SerialNumber"	varchar(50) DEFAULT NULL,
	"VacItemTypeID"	varchar(8) NOT NULL,
	"id"	INTEGER,
	UNIQUE("SerialNumber"),
	UNIQUE("VacItemID"),
	PRIMARY KEY("id")
);
CREATE INDEX "idx_R79_2009_Stock_VacItemTypeID" ON "R79_2009_Stock" (
	"VacItemTypeID"
);
CREATE TABLE IF NOT EXISTS "tbl_fault_log" (
	"VacItemID"	varchar(50) NOT NULL,
	"VacItemTypeID"	varchar(8) NOT NULL,
	"SerialNumber"	varchar(50) DEFAULT NULL,
	"DateIn"	datetime DEFAULT NULL,
	"LoggedInBy"	varchar(50) DEFAULT NULL,
	"StorageLocation"	varchar(50) DEFAULT NULL,
	"Comments"	text DEFAULT NULL,
	"id"	INTEGER,
	PRIMARY KEY("VacItemID","id"),
	UNIQUE("SerialNumber"),
	UNIQUE("VacItemID")
);
CREATE INDEX "idx_tbl_fault_log_VacItemTypeID" ON "tbl_fault_log" (
	"VacItemTypeID"
);
CREATE TABLE IF NOT EXISTS "tbl_stock_goods-in" (
	"EprocNumber"	varchar(255) NOT NULL,
	"Goods-inDate"	date NOT NULL,
	"Goods-inByID"	varchar(50) DEFAULT NULL,
	"SupplierID"	integer DEFAULT NULL,
	"AdditionalInfo"	text DEFAULT NULL,
	"id"	INTEGER,
	UNIQUE("EprocNumber"),
	PRIMARY KEY("EprocNumber","id"),
	CONSTRAINT "tbl_stock_goods-in_SupplierID_fk" FOREIGN KEY("SupplierID") REFERENCES "xtbl_vac_suppliers"("SupplierID")
);
CREATE INDEX "idx_tbl_stock_goods-in_SupplierID" ON "tbl_stock_goods-in" (
	"SupplierID"
);
CREATE TABLE IF NOT EXISTS "xtbl_vac_machine_locations" (
	"MachineLocationID"	varchar(50) NOT NULL,
	"VacItemTypeID"	varchar(50) NOT NULL,
	"Area"	varchar(50) NOT NULL,
	"AreaNumber"	varchar(50) NOT NULL,
	"Section"	varchar(50) NOT NULL,
	"Group"	varchar(50) NOT NULL,
	"DeviceNumber"	varchar(50) NOT NULL,
	"Description"	varchar(50) DEFAULT NULL,
	"DateCreated"	date NOT NULL,
	"id"	INTEGER,
	PRIMARY KEY("MachineLocationID","id")
);
CREATE INDEX "idx_xtbl_vac_machine_locations_VacItemTypeID" ON "xtbl_vac_machine_locations" (
	"VacItemTypeID"
);
CREATE TABLE IF NOT EXISTS "tbl_stock_spares" (
	"VacItemTypeID"	varchar(8) NOT NULL,
	"UnitsInStock"	integer DEFAULT NULL,
	"CriticalStockLevel"	integer DEFAULT NULL,
	"UnitsOnOrder"	integer DEFAULT NULL,
	"ExpectedDeliveryDate"	datetime DEFAULT NULL,
	"UnitPrice"	float DEFAULT NULL,
	"ReorderLevel"	integer DEFAULT NULL,
	"LeadTime"	varchar(30) DEFAULT NULL,
	"Usage Rate"	integer DEFAULT NULL,
	"DespatchNotes"	text DEFAULT NULL,
	"DespatchAttachment1"	text DEFAULT NULL,
	"DespatchAttachment2"	text DEFAULT NULL,
	"DespatchAttachment3"	text DEFAULT NULL,
	"Re-Order Contact"	varchar(50) DEFAULT NULL,
	"DespatchAttachment4"	text DEFAULT NULL,
	"ItemPicture"	blob DEFAULT NULL,
	"id"	INTEGER,
	CONSTRAINT "tbl_stock_spares_VacItemTypeID_fk" FOREIGN KEY("VacItemTypeID") REFERENCES "xtbl_vacuum_catalogue"("VacItemTypeID"),
	UNIQUE("VacItemTypeID"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "tbl_stock_spares_prod" (
	"VacItemID"	varchar(50) NOT NULL,
	"VacItemTypeID"	varchar(8) NOT NULL,
	"SerialNumber"	varchar(50) DEFAULT NULL,
	"DateIn"	datetime DEFAULT NULL,
	"WarrantyExpires"	datetime DEFAULT NULL,
	"Cost"	float DEFAULT NULL,
	"EprocID"	varchar(50) DEFAULT NULL,
	"SignedInBy"	varchar(50) DEFAULT NULL,
	"StorageLocation"	varchar(50) DEFAULT NULL,
	"Comments"	text DEFAULT NULL,
	"Owner"	integer DEFAULT NULL,
	"id"	INTEGER,
	UNIQUE("SerialNumber"),
	CONSTRAINT "tbl_stock_spares_prod_VacItemTypeID_fk" FOREIGN KEY("VacItemTypeID") REFERENCES "xtbl_vacuum_catalogue"("VacItemTypeID"),
	PRIMARY KEY("id")
);
CREATE INDEX "idx_tbl_stock_spares_prod_EprocID" ON "tbl_stock_spares_prod" (
	"EprocID"
);
CREATE INDEX "idx_tbl_stock_spares_prod_ItemID" ON "tbl_stock_spares_prod" (
	"VacItemID"
);
CREATE INDEX "idx_tbl_stock_spares_prod_VacItemTypeID" ON "tbl_stock_spares_prod" (
	"VacItemTypeID"
);
CREATE TABLE IF NOT EXISTS "ztbl_diamond_groups" (
	"Group"	varchar(30) NOT NULL,
	"Acronym"	varchar(50) DEFAULT NULL,
	"id"	INTEGER,
	UNIQUE("Group"),
	PRIMARY KEY("id")
);
