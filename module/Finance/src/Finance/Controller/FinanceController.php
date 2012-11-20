<?php

/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Finance\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class FinanceController extends AbstractActionController {

	protected $usersTable;
	protected $testsTable;
	protected $albumTable;

	public function indexAction() {
		return new ViewModel(
						array(
							'finance' => 'FinanceController',
						)
		);
	}

	public function listUsersAction() {

		$users = $this->getTestsTable()->findAll();

		return new ViewModel(
						array(
							'users' => $users,
						)
		);
	}

	public function getTestsTable() {
		if (!$this->testsTable) {
			$serviceLocator = $this->getServiceLocator();
			$this->testsTable = $serviceLocator->get('Finance\Model\TestsRespository');
		}
		return $this->testsTable;
	}

}

