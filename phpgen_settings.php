<?php

//  define('SHOW_VARIABLES', 1);
//  define('DEBUG_LEVEL', 1);

//  error_reporting(E_ALL ^ E_NOTICE);
//  ini_set('display_errors', 'On');

set_include_path('.' . PATH_SEPARATOR . get_include_path());


include_once dirname(__FILE__) . '/' . 'components/utils/system_utils.php';

//  SystemUtils::DisableMagicQuotesRuntime();

SystemUtils::SetTimeZoneIfNeed('Europe/Minsk');

function GetGlobalConnectionOptions()
{
    return array(
	'server' => 'localhost',
  'port' => '3306',
  'username' => 'root',
  'database' => 'database',
  'client_encoding' => 'utf8'
  /*'server' => 'localhost',
  'port' => '3306',
  'username' => 'root',
  'database' => 'database',
  'client_encoding' => 'utf8'*/
);
}

function HasAdminPage()
{
    return false;
}

function HasHomePage()
{
    return true;
}

function GetHomeURL()
{
    return 'index.php';
}

function GetPageGroups()
{
    $result = array('Organisations', 'Projects', 'Organisations - Projects', 'Location');
    return $result;
}

function GetPageInfos()
{
    $result = array();
    $result[] = array('caption' => 'Organisations', 'short_caption' => 'Organisations', 'filename' => 'organisations.php', 'name' => 'organisations', 'group_name' => 'Organisations', 'add_separator' => false, 'description' => '');
    $result[] = array('caption' => 'Projects', 'short_caption' => 'Projects', 'filename' => 'projects.php', 'name' => 'projects', 'group_name' => 'Projects', 'add_separator' => false, 'description' => '');
    $result[] = array('caption' => 'Funding', 'short_caption' => 'Funding', 'filename' => 'funding.php', 'name' => 'funding', 'group_name' => 'Projects', 'add_separator' => false, 'description' => '');
    $result[] = array('caption' => 'Type of project', 'short_caption' => 'Type of project', 'filename' => 'projecttype.php', 'name' => 'projecttype', 'group_name' => 'Projects', 'add_separator' => false, 'description' => '');
    $result[] = array('caption' => 'Organisations - Projects', 'short_caption' => 'Organisations - Projects', 'filename' => 'organisations_has_projects.php', 'name' => 'organisations_has_projects', 'group_name' => 'Organisations - Projects', 'add_separator' => false, 'description' => '');
    $result[] = array('caption' => 'Countries', 'short_caption' => 'Countries', 'filename' => 'countries.php', 'name' => 'countries', 'group_name' => 'Location', 'add_separator' => false, 'description' => '');
    $result[] = array('caption' => 'Cities', 'short_caption' => 'Cities', 'filename' => 'cities.php', 'name' => 'cities', 'group_name' => 'Location', 'add_separator' => false, 'description' => '');
    return $result;
}

function GetPagesHeader()
{
    return
        '';
}

function GetPagesFooter()
{
    return
        ''; 
}

function ApplyCommonPageSettings(Page $page, Grid $grid)
{
    $page->SetShowUserAuthBar(false);
    $page->setShowNavigation(true);
    $page->OnCustomHTMLHeader->AddListener('Global_CustomHTMLHeaderHandler');
    $page->OnGetCustomTemplate->AddListener('Global_GetCustomTemplateHandler');
    $page->OnGetCustomExportOptions->AddListener('Global_OnGetCustomExportOptions');
    $page->getDataset()->OnGetFieldValue->AddListener('Global_OnGetFieldValue');
    $page->getDataset()->OnGetFieldValue->AddListener('OnGetFieldValue', $page);
    $grid->BeforeUpdateRecord->AddListener('Global_BeforeUpdateHandler');
    $grid->BeforeDeleteRecord->AddListener('Global_BeforeDeleteHandler');
    $grid->BeforeInsertRecord->AddListener('Global_BeforeInsertHandler');
    $grid->AfterUpdateRecord->AddListener('Global_AfterUpdateHandler');
    $grid->AfterDeleteRecord->AddListener('Global_AfterDeleteHandler');
    $grid->AfterInsertRecord->AddListener('Global_AfterInsertHandler');
}

/*
  Default code page: 1257
*/
function GetAnsiEncoding() { return 'windows-1257'; }

function Global_CustomHTMLHeaderHandler($page, &$customHtmlHeaderText)
{

}

function Global_GetCustomTemplateHandler($type, $part, $mode, &$result, &$params, CommonPage $page = null)
{

}

function Global_OnGetCustomExportOptions($page, $exportType, $rowData, &$options)
{

}

function Global_OnGetFieldValue($fieldName, &$value, $tableName)
{

}

function Global_GetCustomPageList(CommonPage $page, PageList $pageList)
{

}

function Global_BeforeUpdateHandler($page, &$rowData, &$cancel, &$message, &$messageDisplayTime, $tableName)
{

}

function Global_BeforeDeleteHandler($page, &$rowData, &$cancel, &$message, &$messageDisplayTime, $tableName)
{

}

function Global_BeforeInsertHandler($page, &$rowData, &$cancel, &$message, &$messageDisplayTime, $tableName)
{

}

function Global_AfterUpdateHandler($page, $rowData, $tableName, &$success, &$message, &$messageDisplayTime)
{

}

function Global_AfterDeleteHandler($page, $rowData, $tableName, &$success, &$message, &$messageDisplayTime)
{

}

function Global_AfterInsertHandler($page, $rowData, $tableName, &$success, &$message, &$messageDisplayTime)
{

}

function GetDefaultDateFormat()
{
    return 'Y-m-d';
}

function GetFirstDayOfWeek()
{
    return 0;
}

function GetPageListType()
{
    return PageList::TYPE_MENU;
}

function GetNullLabel()
{
    return null;
}

function UseMinifiedJS()
{
    return true;
}



?>