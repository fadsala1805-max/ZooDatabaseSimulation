/*
    queries.sql - 20 read-only queries against the Zoo database (schema + data in ZooData.sql)

    A tour of common ways to filter, group, sort, and combine relational data:
    aggregation with HAVING thresholds, multi-table joins, a self-join,
    nested and correlated subqueries, and date-based filters.

    Each query is self-contained; run them individually. Tested on SQL Server 2019.
*/


-- 1. Species variety by zoo
-- Number of distinct species held at each zoo, most varied first.
-- Shows: COUNT(DISTINCT), GROUP BY, ORDER BY on an aggregate expression.

SELECT ZooName, COUNT(DISTINCT SpeciesName) AS "Count Of Different Species In Each Zoo" FROM Animal
GROUP BY ZooName
ORDER BY COUNT(DISTINCT SpeciesName) DESC

-- 2. The recognised world expert for each species
-- Each species paired with the employee flagged as its world-best expert, plus their zoo and pay.
-- Shows: INNER JOIN across a foreign key, sorting by employee within zoo.

SELECT ZooName, EmpName, Salary From Employee E
Inner Join Species S
ON E.EmpNo = S.WorldBestExpertEmpNo
ORDER By ZooName, EmpName

-- 3. Animals whose mother lives at a particular zoo
-- Every animal whose mother is currently housed at Garden Zoo in Boston.
-- Shows: nested subqueries with IN, following the self-referencing parent link.

SELECT * FROM Animal
WHERE MotherAnimalId IN
(SELECT AnimalId FROM Animal
WHERE ZooName IN
(SELECT ZooName FROM Zoo
WHERE ZooName = 'Garden Zoo' AND City = 'Boston'))

-- 4. Animal headcount per zoo, Canada only
-- Count of animals in each Canadian zoo, largest collection first.
-- Shows: JOIN plus GROUP BY with a filter, ORDER BY on the running count.

SELECT Z.ZooName, Count(*) AS AnimalCount FROM Zoo Z INNER JOIN Animal A
ON Z.ZooName = A.ZooName
WHERE Country = 'Canada'
GROUP BY Z.ZooName
ORDER BY AnimalCount DESC

-- 5. Expert coverage by species across US zoos
-- How many experts each species has among staff employed at zoos in the USA.
-- Shows: GROUP BY on a category column, COUNT, subquery filter with IN.

SELECT SpeciesExpertise, COUNT(SpeciesExpertise) AS "Count Of Experts By Species At Zoos In USA" FROM Employee
WHERE ZooName IN
(SELECT ZooName FROM Zoo
WHERE Country = 'USA')
GROUP BY SpeciesExpertise

-- 6. Staff matching either of two conditions
-- Employees at Canadian zoos who earn at least 75,000 or specialise in tigers.
-- Shows: mixing AND / OR with parentheses, joining only to apply the country filter.

SELECT E.* From Employee E
Inner Join Zoo Z
ON E.ZooName = Z.ZooName
Where (Salary >= 75000 OR SpeciesExpertise = 'Tiger')  AND Country = 'Canada'
ORDER BY EmpName

-- 7. Filter by birth year and a related-table status
-- Animals born in 2016 whose species is endangered, ordered by zoo within species.
-- Shows: YEAR() on a date column, subquery with IN, multi-column sort.

SELECT * FROM Animal A
WHERE YEAR(A.DateOfBirth) = 2016 AND SpeciesName IN
(SELECT SpeciesName FROM Species
WHERE Status = 'E')
ORDER BY A.SpeciesName, A.ZooName

-- 8. Groups above a threshold
-- Zoos in China that hold more than two pandas.
-- Shows: JOIN plus GROUP BY plus HAVING COUNT(*) > n.

SELECT Z.* FROM Zoo Z INNER JOIN Animal A
ON Z.ZooName = A.ZooName
WHERE Country = 'China' AND SpeciesName = 'Panda'
GROUP BY Z.ZooName, City, AnnualNoVisitors, Country
HAVING COUNT(*) > 2

-- 9. Filter on both sides of a join
-- Male employees who are the world-best expert for a threatened species; name, gender, pay.
-- Shows: INNER JOIN with predicates taken from each of the two tables.

SELECT EmpName, Gender, Salary FROM Employee E INNER JOIN Species S
ON E.EmpNo = S.WorldBestExpertEmpNo
WHERE Gender = 'M' AND Status = 'T'

-- 10. Row that matches a global maximum
-- The zoo employing the highest-paid person in the dataset.
-- Shows: scalar subquery with MAX() used in the WHERE clause.

SELECT Z.* from Zoo Z
inner Join Employee E
ON Z.ZooName = E.ZooName
Where Salary = (SELECT MAX(Salary) from Employee)

-- 11. Rolling a filter up through several tables
-- Species that have at least one animal living in a Chinese zoo.
-- Shows: chained subqueries with IN (zoo -> animal -> species).

SELECT S.* FROM Species S
WHERE SpeciesName IN
(SELECT SpeciesName FROM Animal
WHERE ZooName IN
(SELECT ZooName FROM Zoo
WHERE Country = 'China'))

-- 12. Distinct-count threshold per group
-- Zoos whose collection spans more than three species, sorted by zoo within city.
-- Shows: GROUP BY plus HAVING COUNT(DISTINCT ...), ORDER BY on grouping columns.

SELECT Z.* FROM Zoo Z INNER JOIN Animal A
ON Z.ZooName = A.ZooName
GROUP BY Z.ZooName, City, AnnualNoVisitors, Country
HAVING COUNT(DISTINCT A.SpeciesName) > 3
ORDER BY City, ZooName


-- 13. Self-join to compare a row with its parent
-- Animals currently housed in a different zoo from their mother.
-- Shows: joining a table to itself and comparing the two aliases.

SELECT Child.* FROM Animal Child INNER JOIN Animal Mother
ON Child.MotherAnimalId = Mother.AnimalId
WHERE Mother.ZooName != Child.ZooName

-- 14. Categories above a count threshold
-- Countries with more than two zoos.
-- Shows: GROUP BY plus HAVING with no join required.

SELECT Country from Zoo
Group By Country
Having Count(*) > 2

-- 15. Correlated subquery
-- Species whose designated world expert works at a zoo that also houses that same species.
-- Shows: an inner query that references the outer row (S.SpeciesName).

SELECT S.* FROM Species S
WHERE WorldBestExpertEmpNo IN
(SELECT EmpNo FROM Employee
WHERE ZooName IN
(SELECT ZooName FROM Animal A
WHERE A.SpeciesName = S.SpeciesName))

-- 16. Minimum within a filtered subset
-- The tiger specialist paid the least among tiger specialists.
-- Shows: scalar subquery with MIN() scoped by the same filter as the outer query.

SELECT * FROM Employee
WHERE SpeciesExpertise = 'Tiger' AND Salary =
(SELECT MIN(Salary) FROM Employee
WHERE SpeciesExpertise = 'Tiger')

-- 17. Threshold applied inside a subquery
-- Endangered species with more than three animals living in Canadian zoos.
-- Shows: a subquery combining GROUP BY plus HAVING, with the status filter on the outer query.

SELECT * FROM Species
WHERE Status = 'E' AND SpeciesName IN
(SELECT SpeciesName FROM Animal
WHERE ZooName IN
(SELECT ZooName FROM Zoo
WHERE Country = 'Canada')
GROUP BY SpeciesName
HAVING COUNT(*) > 3)

-- 18. Count threshold combined with a date condition
-- Zoos holding more than two lions born after 2016, sorted by zoo within country.
-- Shows: subquery with GROUP BY plus HAVING and a YEAR() filter, ordering on the outer query.

SELECT Z.* FROM Zoo Z
WHERE ZooName IN
(SELECT ZooName FROM Animal
WHERE SpeciesName = 'Lion' AND YEAR(DateOfBirth) > 2016
GROUP BY ZooName
HAVING COUNT(*) > 2)
ORDER BY Country, ZooName

-- 19. Single-value aggregate with several filters
-- How many staff with a listed species expertise work at Metro Zoo in Toronto.
-- Shows: COUNT(*) over a join with IS NOT NULL and equality filters.

SELECT COUNT(*) AS ExpertCount FROM Employee E INNER JOIN Zoo Z
ON E.ZooName = Z.ZooName
WHERE SpeciesExpertise IS NOT NULL AND E.ZooName = 'Metro Zoo' AND City = 'Toronto'

-- 20. Parents above an offspring threshold
-- Animals that have fathered more than two offspring currently in Canadian zoos.
-- Shows: subquery grouping offspring by parent id with HAVING, via the self-referencing link.

SELECT FatherAnimal.* FROM Animal FatherAnimal
WHERE FatherAnimal.AnimalId IN
(SELECT FatherAnimalId FROM Animal Offspring INNER JOIN Zoo
ON Offspring.ZooName = Zoo.ZooName
WHERE FatherAnimalId IS NOT NULL AND Country = 'Canada'
GROUP BY FatherAnimalId
HAVING COUNT(*) > 2)
