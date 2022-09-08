from typing import List
from fastapi import Depends, FastAPI, HTTPException
from sqlalchemy.orm import Session

# import crud
import uvicorn
import repositories
import models
import schemas
from database import SessionLocal, engine

models.Base.metadata.create_all(bind=engine)

app = FastAPI()


# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@app.get("/machinearea/", response_model=List[schemas.DiamondMachineAreaBase])
def read_areas(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    areas = repositories.DiamondMachineAreaRepo.fetch_all(db, skip, limit)
    response = []
    for item in areas:
        response.append({'area_id': item.area_id, 'area_name': item.area_name})
    return response


@app.get("/machinearea/{area_id}", response_model=schemas.DiamondMachineAreaBase)
def read_area(area_id: int, db: Session = Depends(get_db)):
    db_area = repositories.DiamondMachineAreaRepo.fetch_by_id(db, area_id)
    print("read_area:")
    print(f"db_area: {db_area}")
    print(f"db_area type: {type(db_area)}")
    if db_area is None:
        raise HTTPException(status_code=404, detail="Machine Area not found")

    return {'area_id': area_id, 'area_name': db_area[0]}


@app.get("/vacuumcatalogueitem/", response_model=List[schemas.VacuumCatalogueItemBase])
def read_areas(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    catalogue_items = repositories.VacuumCatalogueItemRepo.fetch_all(db, skip, limit)
    return catalogue_items


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
