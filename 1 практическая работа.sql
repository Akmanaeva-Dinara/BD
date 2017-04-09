CREATE TABLE t_caterer(
id_caterer INT NOT NULL,
name VARCHAR2(50) NOT NULL,
address VARCHAR2(50) NOT NULL,
phone NUMBER(11,0) NOT NULL,
fax NUMBER(20,0) NOT NULL,
CONSTRAINT PK_caterer PRIMARY KEY(id_caterer)
);



CREATE TABLE t_supply(
id_supply INT NOT NULL,
id_caterer INT NOT NULL,
id_material INT NOT NULL,
id_store INT NOT NULL
supply_data DATE NOT NULL,
volume INT NOT NULL,
CONSTRAINT PK_supply PRIMARY KEY(id_supply),
		CONSTRAINT FK_supply_caterer
		FOREIGN KEY(id_caterer) REFERENCES
		t_caterer(id_caterer),
	
		CONSTRAINT FK_supply_material 
		FOREIGN KEY(id_material) REFERENCES
		t_material(id_material),

		CONSTRAINT FK_supply_store
		FOREIGN KEY(id_store) REFERENCES
		t_store(id_store)
);



CREATE TABLE t_store(
id_store INT NOT NULL,
name VARCHAR2(50) NOT NULL
CONSTRAINT PK_store PRIMARY KEY(id_store)
);



CREATE TABLE t_surplus(
id_surplus INT NOT NULL,
id_material INT NOT NULL,
id_store INT NOT NULL,
CONSTRAINT PK_surplus PRIMARY KEY(id_surplus),
		CONSTRAINT FK_surplus_material
		FOREIGN KEY(id_material) REFERENCES
		t_material(id_material)
		ON DELETE CASCADE,

		CONSTRAINT FK_surplus_store
		FOREIGN KEY(id_store) REFERENCES
		t_store(id_store)
		ON DELETE CASCADE
);


CREATE TABLE t_deliver(
id_deliver INT NOT NULL,
deliver_data DATE NOT NULL,
id_store INT NOT NULL,
id_material INT NOT NULL,
id_messure INT NOT NULL,,
CONSTRAINT PK_deliver PRIMARY KEY(id_deliver)
	
		CONSTRAINT FK_deliver_store
		FOREIGN KEY(id_store) REFERENCES
		t_store(id_store)
		ON DELETE CASCADE,
	
		CONSTRAINT FK_deliver_material
		FOREIGN KEY(id_material) REFERENCES
		t_material(id_material)
		ON DELETE CASCADE,
	
		CONSTRAINT FK_deliver_messure
		FOREIGN KEY(id_messure) REFERENCES
		t_messure(id_messure)
		ON DELETE CASCADE
);

CREATE TABLE t_section(
id_section INT NOT NULL,
name VARCHAR2(50) NOT NULL,
id_employer INT NOT NULL,
CONSTRAINT PK_section PRIMARY KEY(id_section),

		CONSTRAINT FK_section_employer
		FOREIGN KEY(id_employer) REFERENCES
		t_employer(id_employer)
		ON DELETE CASCADE
);

CREATE TABLE t_employer(
id_employer INT NOT NULL,
name VARCHAR2(50) NOT NULL,
surname VARCHAR2(50) NOT NULL,
father_name VARCHAR2(50) NOT NULL,
CONSTRAINT PK_employer PRIMARY KEY(id_employer)
);

CREATE TABLE t_messure(
id_messure INT NOT NULL,
name VARCHAR2(4) NOT NULL,
CONSTRAINT PK_messure PRIMARY KEY(id_messure)
);


CREATE TABLE t_material(
id_material INT NOT NULL,
name VARCHAR2(150) NOT NULL,
id_messure INT NOT NULL,
CONSTRAINT PK_material PRIMARY KEY(id_material),
CONSTRAINT FK_material_messure 
	FOREIGN KEY(id_messure) REFERENCES
	t_messure(id_messure));

CREATE TABLE t_inprice(
id_material INT NOT NULL,
price_data DATE NOT NULL,
price number(10,2) check(price>=0),
CONSTRAINT FK_inprice_material,

	FOREIGN KEY(id_material) REFERENCES
	t_material(id_material)
	ON DELETE CASCADE
);