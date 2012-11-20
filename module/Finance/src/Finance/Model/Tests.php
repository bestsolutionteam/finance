<?php

namespace Finance\Model;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class Tests implements InputFilterAwareInterface {

	public $uid;
	public $test;
	protected $inputFilter;

	/**
	 * Used by ResultSet to pass each database row to the entity
	 */
	public function exchangeArray($data) {
		$this->uid = (isset($data['uid'])) ? $data['uid'] : null;
		$this->test = (isset($data['test'])) ? $data['test'] : null;
	}

	public function getArrayCopy() {
		return get_object_vars($this);
	}

	public function setInputFilter(InputFilterInterface $inputFilter) {
		throw new \Exception("Not used");
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
