<?php

require_once 'components/page/page.php';
require_once 'components/security/datasource_security_info.php';
require_once 'components/security/security_info.php';
require_once 'components/security/hardcoded_auth.php';
require_once 'components/security/grant_manager/user_grant_manager.php';
require_once 'components/security/grant_manager/hard_coded_user_grant_manager.php';

include_once 'components/security/user_identity_storage/user_identity_session_storage.php';

$users = array('admin' => 'b4af804009cb036a4ccdc33431ef9ac9');

$usersIds = array('admin' => -1);

$dataSourceRecordPermissions = array();

$grants = array('guest' => 
        array()
    ,
    'defaultUser' => 
        array('organisations' => new DataSourceSecurityInfo(false, false, false, false),
        'projects' => new DataSourceSecurityInfo(false, false, false, false),
        'funding' => new DataSourceSecurityInfo(false, false, false, false),
        'projecttype' => new DataSourceSecurityInfo(false, false, false, false),
        'organisations_has_projects' => new DataSourceSecurityInfo(false, false, false, false),
        'countries' => new DataSourceSecurityInfo(false, false, false, false),
        'cities' => new DataSourceSecurityInfo(false, false, false, false))
    ,
    'admin' => 
        array('organisations' => new DataSourceSecurityInfo(false, false, false, false),
        'projects' => new DataSourceSecurityInfo(false, false, false, false),
        'funding' => new DataSourceSecurityInfo(false, false, false, false),
        'projecttype' => new DataSourceSecurityInfo(false, false, false, false),
        'organisations_has_projects' => new DataSourceSecurityInfo(false, false, false, false),
        'countries' => new DataSourceSecurityInfo(false, false, false, false),
        'cities' => new DataSourceSecurityInfo(false, false, false, false))
    );

$appGrants = array('guest' => new DataSourceSecurityInfo(false, false, false, false),
    'defaultUser' => new DataSourceSecurityInfo(true, false, false, false),
    'admin' => new AdminDataSourceSecurityInfo());

$tableCaptions = array('organisations' => 'Organisations',
'projects' => 'Projects',
'funding' => 'Funding',
'projecttype' => 'Type of project',
'organisations_has_projects' => 'Organisations - Projects',
'countries' => 'Countries',
'cities' => 'Cities');

function SetUpUserAuthorization()
{
    global $usersIds;
    global $grants;
    global $appGrants;
    global $dataSourceRecordPermissions;
    $userAuthorizationStrategy = new HardCodedUserAuthorization(new UserIdentitySessionStorage(GetIdentityCheckStrategy()), new HardCodedUserGrantManager($grants, $appGrants), $usersIds);
    GetApplication()->SetUserAuthorizationStrategy($userAuthorizationStrategy);

GetApplication()->SetDataSourceRecordPermissionRetrieveStrategy(
    new HardCodedDataSourceRecordPermissionRetrieveStrategy($dataSourceRecordPermissions));
}

function GetIdentityCheckStrategy()
{
    global $users;
    return new SimpleIdentityCheckStrategy($users, 'md5');
}

?>