# README
* Ruby version ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]

* Database creation
    agregar un archivo config/app_environment_variables.rb que contenga (con las credenciales correspondientes): 
        ENV['DEV_DATABASE_USERNAME'] = "user"
        ENV['DEV_DATABASE_PASSWORD'] = "pass" 
    rake db:create db:migrate

* Database initialization
    cd prueba-tecnica

    rails c
    require 'loader'
    CsvLoader::Loader.load("./sample_campground_data.csv")

* Deployment instructions
    rails s

* Algunas notas extras
    CRUD basico de rails para campgrounds y campsites salvo booked_dates de los campsites

    Agregar booked dates una vez creado el campsite
        PUT /campsites/:id/book?from=dd/mm/yyyy&to=dd/mm/yyyy 

    Listar campgrounds ordenados por price 
        GET /campgrounds?sorted=price_asc
        o
        GET /campgrounds?sorted=price_desc
        Los ordena segun el minimo price de uno de sus campsites

    Ver disponibilidad en fechas
        PUT /campgrounds/availables?from=dd/mm/yyyy&to=dd/mm/yyyy         
        Muestra los campgrounds con al menos un campsite libre en ese rango de fechas