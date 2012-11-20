<?php

namespace Finance\Model;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;

class Tests extends \Finance\Model\DefaultModel {

	public $result;

	/**
	 * Used by ResultSet to pass each database row to the entity
	 */
	public function exchangeArray($data) {
		parent::exchangeArray($data);
		$this->result = (isset($data['result'])) ? $data['result'] : null;
	}

	public function getInputFilter() {
		if (!$this->inputFilter) {
			$inputFilter = new InputFilter();

			$factory = new InputFactory();

			$inputFilter->add($factory->createInput(array(
						'name' => 'id',
						'required' => true,
						'filters' => array(
							array('name' => 'Int'),
						),
					)));

			$inputFilter->add($factory->createInput(array(
						'name' => 'test',
						'required' => true,
						'filters' => array(
							array('name' => 'StripTags'),
							array('name' => 'StringTrim'),
						),
						'validators' => array(
							array(
								'name' => 'StringLength',
								'options' => array(
									'encoding' => 'UTF-8',
									'min' => 1,
									'max' => 100,
								),
							),
						),
					)));

			$this->inputFilter = $inputFilter;
		}

		return $this->inputFilter;
	}

}
