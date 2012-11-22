<?php

namespace Finance\Model;

use Zend\Db\TableGateway\TableGateway;

class TestsRepository {

	protected $tableGateway;

	public function __construct(TableGateway $tableGateway) {
		$this->tableGateway = $tableGateway;
	}

	public function findAll() {
		$resultSet = $this->tableGateway->select();
		return $resultSet;
	}

	public function findAlbumByTest() {
		$sql = new \Zend\Db\Sql\Sql($this->tableGateway->getAdapter());
		$select = $sql->select();

		$select->from(array('a' => 'album'))->join(array('t' => 'tests'), 't.test = a.title');

		$statement = $sql->prepareStatementForSqlObject($select);
		$results = $statement->execute();
		return $results;
	}

}
