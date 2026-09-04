A small relational database (Microsoft SQL Server) modeling a network of zoos:
the animals they hold, the staff they employ, and conservation data about each
species. It ships with a schema, sample data, and a set of 20 analytical
queries.



CONTENTS:


  ZooData.sql   Full schema plus sample data: 4 tables, ~113 rows, then the
                foreign keys.

  queries.sql   20 stand-alone SELECT queries against the schema. Each has a
                short header giving the question it answers and the technique
                it demonstrates.

  README.txt    This file.



SCHEMA:


Four tables:

  Zoo        13 rows   One row per zoo: name, city, country, annual visitors.
  Species    17 rows   One row per species: conservation status, estimated
                       wild population, and its world-best expert.
  Employee   25 rows   Zoo staff: name, gender, salary, home zoo, and an
                       optional single area of species expertise.
  Animal     58 rows   Individual animals: species, home zoo, date of birth,
                       gender, and optional mother and father.



Relationships (enforced by FOREIGN KEY constraints):


  Animal.ZooName                -> Zoo.ZooName             (Held_In)
  Animal.SpeciesName            -> Species.SpeciesName      (Member_Of)
  Animal.MotherAnimalId         -> Animal.AnimalId          (Mothered_By, self)
  Animal.FatherAnimalId         -> Animal.AnimalId          (Fathered_By, self)
  Employee.ZooName              -> Zoo.ZooName              (Employed_By)
  Employee.SpeciesExpertise     -> Species.SpeciesName      (Expert_In)
  Species.WorldBestExpertEmpNo  -> Employee.EmpNo           (World_Best_Expert)

  Species and Employee reference each other (an employee has a home species of
  expertise; a species names its best expert), and Animal references itself
  twice for parentage. All seven foreign keys are declared at the end of
  ZooData.sql, so the script loads regardless of insert order.


LOADING THE DATABASE:

Requires SQL Server 2019 or newer (the script targets compatibility level 150).
ZooData.sql contains no CREATE DATABASE or USE, so create a database first and
run the script inside it.

SSMS:
  Create a database (for example ZooData), select it in the toolbar dropdown,
  open ZooData.sql, and Execute. Then open queries.sql and run the statements
  individually.

sqlcmd:
  sqlcmd -S localhost -Q "CREATE DATABASE ZooData"
  sqlcmd -S localhost -d ZooData -i ZooData.sql



WHAT THE QUERIES COVER:


queries.sql works through 20 questions. Techniques used across the set:

  - Aggregation with GROUP BY / HAVING / ORDER BY and COUNT(DISTINCT ...):
    species diversity per zoo, animal counts per country, countries with more
    than two zoos.

  - Multi-table INNER JOIN: zoo, employee and salary for each species'
    world-best expert.

  - Self-join on Animal: animals whose mother currently lives in a different
    zoo.

  - Single- and multi-level subqueries with IN: species held in Chinese zoos,
    animals whose mother is in a specific zoo and city.

  - Correlated subquery: species whose world-best expert works at a zoo that
    also holds that species.

  - Scalar subqueries with MIN / MAX: the zoo with the highest-paid employee,
    the lowest-paid tiger expert.

  - Date filtering: animals born in a given year or after a given year,
    combined with conservation status.



DESIGN NOTES AND KNOWN LIMITATIONS


This is a compact teaching-style schema. Choices worth calling out:

  - Natural keys. ZooName and SpeciesName are the primary keys and propagate
    as foreign keys. Simple to read, but renaming a zoo or species would mean
    cascading updates; surrogate keys would avoid that.

  - Single expertise per employee. Employee.SpeciesExpertise is one nullable
    column, so an employee can be an expert in at most one species. An
    EmployeeExpertise(EmpNo, SpeciesName) junction table would model this as a
    proper many-to-many.

  - Coded status without a lookup. Species.Status is a single character
    (E / T / S) with no lookup table or CHECK constraint documenting the
    domain.

  - Fixed-length text. Several columns use char(n) for codes and names; some
    stored values are space-padded, and EmpName char(10) is narrow enough that
    a few names are truncated.

  - Constraint naming. Foreign keys are named for the relationship (Held_In,
    Member_Of, Employed_By, ...) rather than an FK_<child>_<parent> convention.

  - Indexing. Only the primary-key (clustered) indexes are defined;
    foreign-key columns are not separately indexed.
