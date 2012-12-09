<?php
return array(
    'modules' => array(
		'Album',
        'Application',
		'Finance',
		'ZfcBase',
		'ZfcUser',
		'BjyAuthorize',
    ),
    'module_listener_options' => array(
        'config_glob_paths'    => array(
            'config/autoload/{,*.}{global,local}.php',
        ),
        'module_paths' => array(
            './module',
            './vendor',
			'./vendor/zf-commons',
        ),
    ),
);
