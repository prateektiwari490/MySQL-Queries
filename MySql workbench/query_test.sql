use test;
describe addresses;
describe people;
describe pets;

-- Add and remove primary key

alter table addresses
add primary key (id);

alter table addresses
drop primary key;

alter table people
add primary key (id);

alter table pets
add primary key (id);

-- add and remove foriegn key

alter table people
add constraint FK_PeopleAddress
foreign key (address_id) references addresses(id);

alter table people
drop foreign key FK_PeopleAddress;

-- add and remove unique constraints froma a column

select* from pets;

alter table pets
add constraint u_species unique (species);

alter table pets
drop index u_species;

-- rename column name
alter table pets change `species` `animal_type` varchar(20);

-- change column data type
alter table addresses modify city varchar(30);

-- Home work
-- 1. Add a primary key to the id fields in the pets and people tables.
ALTER TABLE people
ADD PRIMARY KEY (id);
DESCRIBE pets;
DESCRIBE people;

-- 2. Add a foreign key to the owner_id field in the pets table referencing the id field in the people table. 
ALTER TABLE pets 
ADD CONSTRAINT FK_PetsOwner 
FOREIGN KEY (owner_id) REFERENCES people(id);

-- 3. Add a column named email to the people table. 
ALTER TABLE people
ADD COLUMN email VARCHAR(20);

-- 4. Add a unique constraint to the email column in the people table.
ALTER TABLE people
ADD CONSTRAINT u_email UNIQUE (email);

-- 5. Rename the name column in the pets table to ‘first_name’.
ALTER TABLE pets CHANGE `name` `first_name` VARCHAR(20);

-- 6. Change the postcode data type to CHAR(7) in the addresses table.
ALTER TABLE addresses MODIFY postcode CHAR(7);
DESCRIBE addresses;
