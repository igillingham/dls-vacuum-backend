from sqlalchemy import Boolean, Column, ForeignKey, Integer, String
from sqlalchemy.orm import relationship

from database import Base

# xtbl_vacuum_catalogue = Base.classes.xtbl_vacuum_catalogue


class VacuumCatalogueItem(Base):
    __tablename__ = "xtbl_vacuum_catalogue"

    id = Column('ID', Integer, primary_key=True, index=True)
    common_name = Column('CommonName', String)
    vac_item_type_id = Column('VacItemTypeID', String, unique=True, index=True)
    item_id_format_1 = Column('ItemID: ####-XXX-XXXX', String)
    item_id_format_2 = Column('ItemID XXXX-###-XXXX', String)
    device = Column('Device', String)
    category = Column('Category', String)
    item_type = Column('Type', String)
    components = Column('Components', String)
    subcomponents1 = Column('Sub Components1', String)
    subcomponents2 = Column('Sub Components2', String)
    supplier_part_number = Column('Supplier Part Number', String)
    supplier1 = Column('Supplier1', String)
    supplier2 = Column('Supplier2', String)
    supplier3 = Column('Supplier3', String)
    manufacturer1 = Column('Manufacturer1', String)
    manufacturer2 = Column('Manufacturer2', String)
    manufacturer3 = Column('Manufacturer3', String)
    cost = Column('Cost', String)
    quotation_reference_number = Column('Quotation Reference Number', String)
    who = Column('WHO', String)
    next_item_id = Column('NextItemID', Integer)
    stock_type = Column('Stock Type', Integer)
    default_ivs_location = Column('Default IVS Location', Integer)
    default_vacuum_owner = Column('Default Vacuum Owner', Integer)
    picture_directory = Column('Picture Directory', String)


class DiamondMachineArea(Base):
    __tablename__ = "xtbl_diamond_machine_areas"

    area_id = Column('AreaID', Integer, primary_key=True, index=True)
    area_name = Column('AreaName', String)


# class Item(Base):
#     __tablename__ = "items"
#
#     id = Column(Integer, primary_key=True, index=True)
#     title = Column(String, index=True)
#     description = Column(String, index=True)
#     owner_id = Column(Integer, ForeignKey("users.id"))
#
#     owner = relationship("User", back_populates="items")
