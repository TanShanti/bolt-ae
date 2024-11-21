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
- customer : contains customers data, both company of individual
- customer_group: contains customer group type
- airplane: contains airplane descriptions and operator. Operator is the company that provides the airplane
- booking: contains booking data both group bookings or individual booking. e.g: 1 booking of 20 people will have only 1 booking id. 1 booking of 1 person will have also 1 booking id.
- order: contains booking details data on individual level (matched with seat number). 1 Booking id can contains multiple order id. e.g: 1 booking of 20 people will have 1 booking id and 20 order id
- 


The model will separate between mart and report with assumption the target users will be from various people (both technical and non-technical)
- mart data model is targeted for analytic/technical people as it is more complex and granular
- report data model is targeted for non technical people as it is simple and in aggrregation form

#### What can be improved
If I have more time to do the task, I would love to complete end to end cycle and airflow code and perhaps dockerized environment

### Task 2
To my experience in designing datamodel there are always influenced by 2 main factors:
1. Business Model
