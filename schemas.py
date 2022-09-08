from typing import List, Union

from pydantic import BaseModel


class VacuumCatalogueItemBase(BaseModel):
    id: int
    common_name: str
    vac_item_type_id: str
    item_id_format_1: str
    item_id_format_2: str
    device: str
    category: str
    item_type: str
    components: str
    subcomponents1: str
    subcomponents2: str
    supplier_part_number: str
    supplier1: str
    supplier2: str
    supplier3: str
    manufacturer1: str
    manufacturer2: str
    manufacturer3: str
    cost: str
    quotation_reference_number: str
    who: str
    next_item_id: int
    stock_type: int
    default_ivs_location: int
    default_vacuum_owner: int
    picture_directory: str


class VacuumCatalogueItemCreate(VacuumCatalogueItemBase):
    pass


class VacuumCatalogueItem(VacuumCatalogueItemBase):
    id: int
    owner_id: int

    class Config:
        orm_mode = True


class DiamondMachineAreaBase(BaseModel):
    area_id: int
    area_name: str


class DiamondMachineAreaCreate(DiamondMachineAreaBase):
    pass

