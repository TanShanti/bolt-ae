# bolt-ae

### Task 1

#### Stacks
- Google BigQuery as storage and exploration. It's columnar database, so it's quite easy to adapt with schema changes
- dbt for modeling. database source and target is BigQuery
- looker for visualization and self-service
- airflow (if I have more time to complete)

#### Business Model & Teams Assumptions
##### Business Model
Airboltic become the market place for plane flights between operator and customers. Airboltic serves private bookings and if there are some more seats available, Airboltic will open the available seats to public. 
E.g: 
A company books flights from New York to London for 150 pax (people). The booked plane is Boeing 737-800 which has maximum seats for 189 people. Then Airboltic will sell the rest of the 39 seats (180 - 39) to individual public. 

##### Base Tables
- **customer** : contains customers data, both company of individual
- **customer_group**: contains customer group type
- **airplane**: contains airplane descriptions and operator. Operator is the company that provides the airplane
- **booking**: contains booking data both group bookings or individual booking. e.g: 1 booking of 20 people will have only 1 booking id. 1 booking of 1 person will have also 1 booking id.
- **order**: contains booking details data on individual level (matched with seat number). 1 Booking id can contains multiple order id. e.g: 1 booking of 20 people will have 1 booking id and 20 order id
- **operator**: contains airplane operator info
- **plane_trip_availability_update**: contains plane availability update

#### Target Users
Asumption: the data model should be designed to serve various users (tech and non tech)
The model will separate between mart and report with assumption the target users will be from various people (both technical and non-technical)
- **mart** data model is targeted for analytic/technical people as it is more complex and granular
- **report** data model is targeted for non technical people as it is simple and in aggrregation form

#### What can be improved
If I have more time to do the task, I would love to complete end to end cycle and airflow code and perhaps dockerized environment

### Task 2
To my experience in designing datamodel there are always influenced by 2 main factors: 
1. Business Model
2. Target Users
Business Model determine what dimensions and metrics to be provided and target users determines how many layers the datamodel should be and how complex each layers. E.g: business people layer should be able to answer business querstions fast without complex manipulation.

#### CI/CD Strategy: 
Through my experience the ideal workflow:
1. prevalidation => this is basic validation of data source check before the data used in dbt model
2. modelling => modelling part
3. automated_testing => this can be done using dbt or jenkins. writing some validation logic
4. looker_alert => sometimes error can't be detected on validation or sql model, but will be seen when we do some analysis and comparison
5. create datamart versioning (if we have enough resources)


#### Ideal World vs Limited Resources World
All the companies that I have been worked with mostly have limited resources and toolings. 

Ideal and easy world => we can use all the paid services for all the stacks with automated scalling
limited resources => implement open source substitute

#### Short Term and Long Term effort
depends on the company budget to start with:
if we have enough budget then start with paid services and then move open source gradually to reduce the cost
if we don't have enought budget: python, sql, dbt-core, and airflow are more than enough to cover most of cases

#### Past Experiences
Most of my experiences are working with free and open-source tools, except: BQ
in current company we use: dbt-core, airflow2, bigquery, looker
in other previous company (before dbt exists): I worked with platform engineer to build data-platform using on-prem servers using all open sources: hdfs, hive, airflow, jupyter server, and python


