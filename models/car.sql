with 
price as (
    
    select 
        car_ID as id,
        doornumber,
        CarName as name

    from `dbt-project-313609.car.car_price`
),

door as (

    select
        doornumber,
        type

    from `dbt-project-313609.car.car_door`

    where doornumber != "doornumber"
),

price_door as (

    select
        price.id,
        price.doornumber,
        price.name,
        door.type
    
    from price

    left join door using(doornumber)
)

select * from price_door