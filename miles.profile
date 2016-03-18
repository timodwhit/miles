<?php
/**
 * @file
 * Enables modules and site configuration for a mmg microsite site installation.
 */

/**
 * Implements hook_environment().
 */
function miles_environment() {
  $environments = array();

  $environments['staging'] = array(
    'label' => t('Staging'),
    'description' => t('Staging sites are for content creation before publication.'),
    'allowed' => array(
      'default' => FALSE,
      'email' => FALSE,
    ),
  );

  return $environments;
}

/**
 * Implementation of hook_environment_switch().
 */
function miles_environment_switch($target_env, $current_env) {
  // Declare each optional development-related module
  $devel_modules = array(
    'devel',
    'update',
    'views_ui',
    'module_filter',
    'coder',
  );

  $staging_modules =  array(
    'devel',
  );

  $local_modules = array();

  switch ($target_env) {
    case 'production':
      module_disable($devel_modules);
      drupal_set_message('Disabled development modules. Environment set to' . $target_env);
      return;
    case 'staging':
      module_disable($devel_modules);
      module_enable($staging_modules);
      drupal_set_message('Disabled development modules. Environment set to ' . $target_env);
      return;
    case 'development':
      module_enable($local_modules);
      module_enable($devel_modules);
      drupal_set_message('Enabled development modules. Environment set to ' . $target_env);
      return;
  }
}
