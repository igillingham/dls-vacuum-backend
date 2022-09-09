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
    subcomponents1: str | None
    subcomponents2: str | None
    supplier_part_number: str | None
    supplier1: str | None
    supplier2: str | None
    supplier3: str | None
    manufacturer1: str | None
    manufacturer2: str | None
    manufacturer3: str | None
    cost: str | None
    quotation_reference_number: str | None
    who: str | None
    next_item_id: int
    stock_type: int
    default_ivs_location: int
    default_vacuum_owner: int
    picture_directory: str | None


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

