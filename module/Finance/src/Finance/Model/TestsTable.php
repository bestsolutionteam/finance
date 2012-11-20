<?php

namespace Finance\Model;

use Zend\Db\TableGateway\TableGateway;

class TestsTable {

	protected $tableGateway;

	public function __construct(TableGateway $tableGateway) {
		$this->tableGateway = $tableGateway;
	}

	public function findAll() {
		$resultSet = $this->tableGateway->select();
		return $resultSet;
	}

}
