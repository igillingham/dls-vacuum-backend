from sqlalchemy.orm import Session

import models
import schemas


class DiamondMachineAreaRepo:

    async def create(db: Session, item: schemas.DiamondMachineAreaCreate):
        db_item = models.DiamondMachineArea(name=item.AreaName)
        db.add(db_item)
        db.commit()
        db.refresh(db_item)
        return db_item

    def fetch_by_id(db: Session, _id):
        return db.query(models.DiamondMachineArea.area_name).filter(models.DiamondMachineArea.area_id == _id).first()

    def fetch_by_name(db: Session, name):
        return db.query(models.DiamondMachineArea).filter(models.DiamondMachineArea.area_name == name).first()

    def fetch_all(db: Session, skip: int = 0, limit: int = 100):
        return db.query(models.DiamondMachineArea).offset(skip).limit(limit).all()

    async def delete(db: Session, item_id):
        db_item = db.query(models.DiamondMachineArea).filter_by(id=item_id).first()
        db.delete(db_item)
        db.commit()

    async def update(db: Session, item_data):
        updated_item = db.merge(item_data)
        db.commit()
        return updated_item


class VacuumCatalogueItemRepo:

    async def create(db: Session, item: schemas.VacuumCatalogueItemBase):
        db_item = models.VacuumCatalogueItem(name=item.common_name)
        db.add(db_item)
        db.commit()
        db.refresh(db_item)
        return db_item

    def fetch_by_id(db: Session, _id):
        return db.query(models.VacuumCatalogueItem).filter(models.VacuumCatalogueItem.id == _id).first()

    def fetch_by_name(db: Session, name):
        return db.query(models.VacuumCatalogueItem).filter(models.VacuumCatalogueItem.common_name == name).first()

    def fetch_all(db: Session, skip: int = 0, limit: int = 100):
        db_response = db.query(models.VacuumCatalogueItem).offset(skip).limit(limit).all()
        rtn = []
        for item in db_response:
            rtn.append({'id': item.id, 'common_name': item.common_name,
                        'vac_item_type_id': item.vac_item_type_id,
                        'item_id_format_1': item.item_id_format_1,
                        'item_id_format_2': item.item_id_format_2,
                        'device': item.device,
                        'category': item.category,
                        'item_type': item.item_type,
                        'components': item.components,
                        'subcomponents1': item.subcomponents1,
                        'subcomponents2': item.subcomponents2,
                        'supplier_part_number': item.supplier_part_number,
                        'supplier1': item.supplier1,
                        'supplier2': item.supplier2,
                        'supplier3': item.supplier3,
                        'manufacturer1': item.manufacturer1,
                        'manufacturer2': item.manufacturer2,
                        'manufacturer3': item.manufacturer3,
                        'cost': item.cost,
                        'quotation_reference_number': item.quotation_reference_number,
                        'who': item.who,
                        'next_item_id': item.next_item_id,
                        'stock_type': item.stock_type,
                        'default_ivs_location': item.default_ivs_location,
                        'default_vacuum_owner': item.default_vacuum_owner,
                        'picture_directory': item.picture_directory,
                        })
        return rtn

    async def delete(db: Session, item_id):
        db_item = db.query(models.VacuumCatalogueItem).filter_by(id=item_id).first()
        db.delete(db_item)
        db.commit()

    async def update(db: Session, item_data):
        updated_item = db.merge(item_data)
        db.commit()
        return updated_item
