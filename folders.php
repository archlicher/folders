<?php

$dns = "mysql:host=localhost:3306;dbname=folders";
$user = "root";
$passwd = "root";

function getDbTables($dns, $user, $passwd)
{
	$pdo = new PDO($dns, $user, $passwd);
	$stm = $pdo->query("SHOW TABLES");
	$results = $stm->fetchAll();

	foreach ($results as $row)
	{
		$tables[] = $row[0];
	}

	return $tables;
}

function getDataFromTables($tables, $dns, $user, $passwd)
{
	foreach ($tables as $value)
	{
		$pdo = new PDO($dns, $user, $passwd);
		$stm = $pdo->query("SELECT * FROM $value");
		$result = $stm->fetchAll(PDO::FETCH_ASSOC);
		$allTables[] = $result[0];
	}

	$i = 0;
	foreach ($allTables as $table) {
		$table['tableName'] = $tables[$i];
		$i++;
		$allNewTables[] = $table;
	}

	return $allNewTables;
}

function validateId($id)
{
	if (is_numeric($id) && is_int($id))
	{
		$id = intval($id);

		if ($id > -1)
		{
			return $id;
		} else {
			return false;
		}
	} else {
		return false;
	}
}

function findId($id, $tables, $dns, $user, $passwd)
{
	$result = getDataFromTables($tables, $dns, $user, $passwd);

	foreach ($result as $key => $arr) {
		if (intval($arr['id']) === $id) {
			$starArr = $arr;
			unset($result[$key]);
		}
	}

	return [$starArr, $result];
}

function findChildren($starArrId, $allArr)
{
	foreach ($allArr as $arr) {
		if (intval($arr['parent']) === intval($starArrId)) {
			$children[] = $arr;
		}
	}

	return $children;
}

function noMoreChildren($children, $arrays)
{
	$n = 0;

	foreach ($children as $child) {
		foreach ($arrays as $arr) {
			if (intval($arr['parent']) === intval($child['id'])) {
				$n += 1;
			}
		}
	}

	return $n;
}

function findAllChildren($children, $arrays)
{
	foreach ($children as $key => $child) {
		foreach ($arrays as $key => $arr) {
			if (intval($arr['parent']) === intval($child['id'])) {
				$children[] = $arr;
				unset($arrays[$key]);
			}

		}
	}

	if (noMoreChildren($children, $arrays) > 0) {
		$children = findAllChildren($children, $arrays);
	}

	return $children;
}

function findAllChildrenWithoutName($children)
{
	foreach ($children as $child) {
		if ($child['name'] === null && empty($child['name'])) {
			$childrenWithoutName[] = $child;
		}
	}

	return $childrenWithoutName;
}

function deleteTablesWithEmptyName($childrenWithoutName)
{
	$query = '';
	for ($i = 0; $i < count($childrenWithoutName); $i++) {
		$query .= $childrenWithoutName[$i]['tableName'];
		if ($i + 1 < count($childrenWithoutName)) {
			$query .= ', ';
		} else {
			$query .= ';';
		}
	}

	return $query;
}

function dropTables($query, $dns, $user, $passwd)
{
	try {
		$pdo = new PDO($dns, $user, $passwd);
		$dropTables = "DROP TABLE $query";
		$pdo->exec($dropTables);
		print_r("\n\nTables deleted!\n\n");
	} catch (PDOException $e) {
		print_r("Could not delete table(s): " . $e->getMessage());
	}
}

function deleteAllTablesWithoutName($id, $dns, $user, $passwd)
{
	if (validateId($id) || validateId($id) === 0) {
		$tables = getDbTables($dns, $user, $passwd);
		$allArr = findId($id, $tables, $dns, $user, $passwd);
		if ($allArr[0] !== null) {
			$starArrId = intval($allArr[0]['id']);
			$arrays = $allArr[1];
			$children = findChildren($starArrId, $arrays);
			$children = findAllChildren($children, $arrays);
			$childrenWithoutName = findAllChildrenWithoutName($children);
			$query = deleteTablesWithEmptyName($childrenWithoutName);
			dropTables($query, $dns, $user, $passwd);
		} else {
			echo "\nInvalid number\n";
		}
	} else {
		echo "\nInvalid input\n";
	}
}

deleteAllTablesWithoutName(1, $dns, $user, $passwd)

?>