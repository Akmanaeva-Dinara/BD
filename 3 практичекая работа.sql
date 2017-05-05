/*14*/
SELECT * FROM t_supply;
SELECT * FROM t_caterer;
SELECT * FROM t_deliver;

/*15*/
SELECT id_material, name FROM t_malerial

/*16*/
SELECT birthdate, name, surname, father_name, FROM t_employer

/*17*/
SELECT * FROM id_section
		WHERE POL LIKE 'М'

/*18*/
SELECT * FROM t_caterer
		WHERE id_caterer IN
    (SELECT id_caterer FROM t_supply
       WHERE supply_date >= '01.04.2009' 
       AND supply_date <= '30.06.2009');

/*19*/
SELECT * FROM t_section
		WHERE id_section IN
	(SELECT id_section FROM t_deliver
		WHERE deliver_data LIKE '%07.2009');

/*20*/
SELECT name FROM t_section
  		WHERE id_section IN 
    (SELECT id_section FROM t_deliver
    	WHERE deliver_data = SYSDATE);

/*21*/
SELECT name FROM t_material
  		WHERE id_material IN 
  	(SELECT id_material FROM t_supply
    	WHERE supply_data LIKE '%2017');

/*22*/
SELECT name FROM t_material
  		WHERE id_material NOT IN 
  	(SELECT id_material FROM t_supply
       WHERE supply_data LIKE '%2017')
  AND id_material IN 
    (SELECT id_material FROM y_surplus
       WHERE count LIKE 0);

/*23*/
SELECT t_section.id_section, t_section.name, id_section.name, id_section.father_name id_section.surname
  FROM t_section, id_section
  WHERE t_section.id_employer = id_section.id_employer;

/*24*/
SELECT t_section.id_section, t_section.name, id_section.name, id_section.surname, id_section.father_name t_job.name
  FROM t_section, id_section, t_job
  WHERE t_section.id_employer = id_section.id_employer
  AND id_section.id_job = t_job.id_job ;

/*25*/ 
SELECT t_caterer.name, t_material.name, t_supply.volume, t_inprice.price, t_supply.supply_data
  FROM t_caterer, t_material, t_supply, t_inprice
  WHERE t_caterer.id_caterer IN
    (SELECT id_caterer FROM t_supply
     WHERE supply_data BETWEEN '01.01.2009' AND '31.03.2009')
  AND t_material.id_material = t_inprice.id_material
  AND t_material.id_material = t_supply.id_material
  AND t_caterer.id_caterer = t_supply.id_caterer;

/*26*/
SELECT t_caterer.name, t_material.name, t_supply.volume, t_inprice.price, t_supply.supply_data
  FROM t_caterer, t_material, t_supply, t_inprice
  WHERE t_caterer.id_caterer IN
     (SELECT id_caterer FROM t_supply
     WHERE supply_data BETWEEN '01.01.2009' AND '31.03.2009')
   AND .id_material = t_inprice.id_material
  AND t_material.id_material = t_supply.id_material
  AND t_catert_materialer.id_caterer = t_supply.id_caterer;
  AND t_caterer.OBHI_ADDRES LIKE 'Пермь%';

/*27*/
SELECT t_material.id_material, t_material.name, t_store.name, t_surplus.volume
  FROM t_material, t_store, t_surplus
  WHERE t_store.id_store = t_surplus.id_store
  AND t_material.id_material = t_surplus.id_material;

/*28*/
SELECT t_caterer.name, t_material.name, t_supply.volume, t_inprice.price, t_supply.supply_data
  FROM t_caterer JOIN t_material
    ON t_caterer.id.caterer IN 
      (SELECT id.caterer FROM t_supply 
       WHERE supply_data BETWEEN '01.01.2009' AND '31.03.2009')
  JOIN t_supply 
    ON t_supply.id_material = t_material.id_material
    AND t_supply.id.caterer = t_caterer.id.caterer
  JOIN t_inprice
    ON t_inprice.id_material = t_material.id_material;

/*29*/
SELECT t_caterer.name, t_material.name, t_supply.volume, t_inprice.price, t_supply.supply_data
  FROM t_caterer  LEFT JOIN t_supply
    ON t_supply.id.caterer = t_caterer .id.caterer
  LEFT JOIN t_material
    ON t_supply.id_material = t_material.id_material
  LEFT JOIN T_INPRICE
    ON t_inprice.id_material = t_material.id_material;

/*30*/
SELECT t_store.id_store, t_store.name, t_material.name, t_surplus.volume
  FROM t_store LEFT JOIN t_surplus
    ON t_store.id_store = t_surplus.id_store
  LEFT JOIN t_material
    ON t_material.id_material = t_surplus.id_material;

/*31*/
SELECT  t_material.id_material, t_material.name, t_messure.name, t_inprice.price
  FROM t_material JOIN t_messure
    ON t_material.id_messure = t_messure.id_messure
  JOIN t_inprice
    ON t_inprice.id_material = t_material.id_material
    AND t_inprice.price_data IN
      (SELECT price_data FROM t_inprice 
         WHERE price_data BETWEEN '01.07.2009' AND '31.09.2009');

/*32*/
SELECT t_material.id_material, t_material.name, t_messure.name, t_inprice.price
  FROM t_material LEFT JOIN t_messure 
    ON t_material.id_messure = t_messure.id_messure
  LEFT JOIN t_inprice 
    ON t_inprice.id_material = t_material.id_material

/*33*/
ALTER TABLE t_employer
  ADD id_manager INT;
UPDATE t_employer
  SET id_manager = 1
    WHERE id_employer BETWEEN 2 AND 4;
UPDATE t_employer
  SET id_manager = 3
    WHERE id_employer LIKE 5;

/*34*/
ALTER TABLE t_group
  ADD  min_group INT;
UPDATE  t_group
  SET min_group = 1
    WHERE id_group BETWEEN 1 AND 3;
UPDATE  t_group
  SET min_group = 2
    WHERE id_group > 3;
SELECT * FROM  t_group
  WHERE min_group = 1;
SELECT * FROM  t_group
  WHERE min_group = 2;

/*35*/
CREATE TABLE t_exemp(
  id_employer INT NOT NULL,
  name NVARCHAR2(10) NOT NULL,
  surname NVARCHAR2(10) NOT NULL,
  father_name NVARCHAR2(10),
  bithdate DATE,
  id_job INT,
  id_manager INT,
  CONSTRAINT PK_exemp
    PRIMARY KEY (id_employer));
INSERT INTO t_exemp (id_employer, name, surname, father_name, 
    bithdate, id_job, id_manager)
  VALUES (3, 'Имя, 'Фамилия', 'Отчество', '22.07.1998', 3, 1);

/*36*/
ALTER TABLE t_exemp
  ADD dismissed DATE;
UPDATE t_exemp
  SET dismissed = '06.11.1998';

/*37*/
CREATE TABLE t_contact(
  id_contact INT NOT NULL,
  id_caterer INT,
  name NVARCHAR2(10) NOT NULL,
  surname NVARCHAR2(10) NOT NULL,
  father_name NVARCHAR2(10),
  phone NVARCHAR2(11) NOT NULL,
  CONSTRAINT PK_contact
    PRIMARY KEY (id_contact),
  CONSTRAINT FK_contact_caterer
    FOREIGN KEY (id_caterer) REFERENCES t_caterer(id_caterer) 
      ON DELETE CASCADE);

INSERT INTO t_contact (id_contact, id_caterer, name, surname, father_name, phone)
  VALUES (1, 1, 'name1', 'surname1', 'father_name1', '89033454556');
INSERT INTO t_contact (id_contact, id_caterer, name, surname, father_name, phone)
  VALUES (2, 2, 'name2', 'surname2', 'father_name2', '89224375690');
INSERT INTO t_contact (id_contact, id_caterer, name, surname, father_name, phone)
  VALUES (3, 3, 'name3', 'surname3', 'father_name3', '89224673538');
INSERT INTO t_contact (id_contact, id_caterer, name,surname, father_name, phone)
  VALUES (4, 3, 'name4', 'surname4', 'father_name4', '89193627464');
INSERT INTO t_contact (id_contact,id_caterer, name, surname, father_name, phone)
  VALUES (5, 5, 'name5', 'surname5', 'father_name5', '89094364354');
SELECT name, surname, father_name,phone FROM t_contact;

/*38*/
SELECT * FROM t_caterer
  ORDER BY name;

/*39*/
SELECT * FROM t_caterer JOIN t_contact
    ON t_caterer.id_caterer = t_contact.id_caterer
  ORDER BY t_caterer.name, t_contact.name,t_contact.surname, t_contact.father_name;

/*40*/
SELECT t_store.name, t_material.name, t_surplus.volume
  FROM t_store LEFT JOIN t_surplus 
    ON t_store.id_store = t_surplus.id_store
  LEFT JOIN t_material 
    ON t_material.id_material = t_surplus.id_material
  ORDER BY t_store.id_store, t_surplus.volume DESC; 

/*41*/
SELECT t_material.name AS "material", t_caterer.name AS "Caterer", SUM(t_supply.volume) AS "Volume"
  FROM t_caterer JOIN t_supply 
    ON t_caterer.id_caterer = t_supply.id_caterer
  JOIN t_material
    ON t_material.id_material = t_supply.id_material
  WHERE t_supply.supply_data >= '01.01.2017'
     AND t_supply.supply_data <= '31.11.2017'
  GROUP BY t_material.name, t_caterer.name
  ORDER BY t_caterer.name, t_material.name;

/*42*/
SELECT t_material.name AS "material", AVG(t_supply.volume * t_inprice.price) AS "average"
  FROM t_material LEFT JOIN t_supply 
    ON t_material.id_material = t_supply.id_material
  LEFT JOIN t_inprice 
    ON t_material.id_material = t_inprice.id_material
  WHERE t_supply.supply_data  >= '01.01.2017'
    AND t_supply.supply_data  <= '31.12.2017'
  GROUP BY t_material.name
  ORDER BY t_material.name;

/*43*/
SELECT t_material.name AS "Material", SUM(t_supply.volume) AS "Sum"
  FROM t_material LEFT JOIN t_supply 
    ON t_material.id_material = t_supply.id_material
  WHERE t_supply.supply_data  >= '01.01.2017'
    AND t_supply.supply_data  <= '31.12.2017'
  GROUP BY t_material.name
  ORDER BY t_material.name;

/*44*/
SELECT t_material.name AS "material", AVG(t_supply.volume * t_inprice.price), SUM(AVG(t_supply.volume * t_inprice.price)*t_inprice.price)
    ON t_material.id_material = t_supply.id_material
  LEFT JOIN t_inprice
    ON t_surplus.id_store = t_store.id_store
  GROUP BY t_material.name ORDER BY t_material.name;

/*45*/
SELECT name FROM t_store INNER JOIN t_surplus
  ON t_store.id_store = t_surplus.id_store
  GROUP BY name HAVING SUM(volume) = 0;

  /*46*/
SELECT name FROM t_caterer INNER JOIN t_supply
  ON t_caterer.id_caterer = t_supply.id_caterer
  WHERE supply_data >= '01.01.2017' 
    AND t_supply.supply_data <= '31.12.2017'
  GROUP BY name HAVING SUM(volume) < 1000;

/*47*/
SELECT name FROM t_caterer JOIN t_supply
  ON t_caterer.id_caterer= t_supply.id_caterer
  WHERE supply_data >= '01.01.2017' 
    AND t_supply.supply_data <= '31.12.2017'
  GROUP BY name HAVING SUM(volume) = MAX(volume);
  GROUP BY name HAVING SUM(volume) = MAX(volume);


