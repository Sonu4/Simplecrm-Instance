
<style>
{literal}
.main
{
background-image:none !important;
}
footer
{
background-image:none !important;
}
{/literal}
</style>

<script>
{literal}
$(document).ready(function(){
$("ul.clickMenu").each(function(index, node){
$(node).sugarActionMenu();
});
});
{/literal}
</script>
<div class="clear"></div>
<form action="index.php" method="POST" name="{$form_name}" id="{$form_id}" {$enctype}>
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="dcQuickEdit">
<tr>
<td class="buttons">
<input type="hidden" name="module" value="{$module}">
{if isset($smarty.request.isDuplicate) && $smarty.request.isDuplicate eq "true"}
<input type="hidden" name="record" value="">
<input type="hidden" name="duplicateSave" value="true">
<input type="hidden" name="duplicateId" value="{$fields.id.value}">
{else}
<input type="hidden" name="record" value="{$fields.id.value}">
{/if}
<input type="hidden" name="isDuplicate" value="false">
<input type="hidden" name="action">
<input type="hidden" name="return_module" value="{$smarty.request.return_module}">
<input type="hidden" name="return_action" value="{$smarty.request.return_action}">
<input type="hidden" name="return_id" value="{$smarty.request.return_id}">
<input type="hidden" name="module_tab"> 
<input type="hidden" name="contact_role">
{if (!empty($smarty.request.return_module) || !empty($smarty.request.relate_to)) && !(isset($smarty.request.isDuplicate) && $smarty.request.isDuplicate eq "true")}
<input type="hidden" name="relate_to" value="{if $smarty.request.return_relationship}{$smarty.request.return_relationship}{elseif $smarty.request.relate_to && empty($smarty.request.from_dcmenu)}{$smarty.request.relate_to}{elseif empty($isDCForm) && empty($smarty.request.from_dcmenu)}{$smarty.request.return_module}{/if}">
<input type="hidden" name="relate_id" value="{$smarty.request.return_id}">
{/if}
<input type="hidden" name="offset" value="{$offset}">
{assign var='place' value="_HEADER"} <!-- to be used for id for buttons with custom code in def files-->
<div class="action_buttons">{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="var _form = document.getElementById('form_QuickCreate_Prospects'); _form.action.value='Popup';return check_form('form_QuickCreate_Prospects')" type="submit" name="Prospects_popupcreate_save_button" id="Prospects_popupcreate_save_button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if}  <input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="toggleDisplay('addform');return false;" name="Prospects_popup_cancel_button" type="submit"id="Prospects_popup_cancel_button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}">  {if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input id="btn_view_change_log" title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Prospects", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="button" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}<div class="clear"></div></div>
</td>
<td align='right' class="edit-view-pagination">
</td>
</tr>
</table>{sugar_include include=$includes}
<span id='tabcounterJS'><script>SUGAR.TabFields=new Array();//this will be used to track tabindexes for references</script></span>
<div id="form_QuickCreate_Prospects_tabs"
>
<div >
<div id="detailpanel_1" class="{$def.templateMeta.panelClass|default:'edit view edit508'}">
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table width="100%" border="0" cellspacing="1" cellpadding="0"  id='LBL_PROSPECT_INFORMATION'  class="yui3-skin-sam edit view panelContainer">
{counter name="fieldsUsed" start=0 print=false assign="fieldsUsed"}
{capture name="tr" assign="tableRow"}
<tr>
<td valign="top" id='first_name_label' width='12.5%' data-total-columns="2" scope="col">
{capture name="label" assign="label"}{sugar_translate label='LBL_FIRST_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</td>
{counter name="fieldsUsed"}

<td valign="top" width='37.5%' data-total-columns="2" >
{counter name="panelFieldCount"}

{if strlen($fields.first_name.value) <= 0}
{assign var="value" value=$fields.first_name.default_value }
{else}
{assign var="value" value=$fields.first_name.value }
{/if}  
<input type='text' name='{$fields.first_name.name}' 
id='{$fields.first_name.name}' size='30' 
maxlength='100' 
value='{$value}' title=''      accesskey='7'  >
<td valign="top" id='phone_work_label' width='12.5%' data-total-columns="2" scope="col">
{capture name="label" assign="label"}{sugar_translate label='LBL_OFFICE_PHONE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</td>
{counter name="fieldsUsed"}

<td valign="top" width='37.5%' data-total-columns="2" >
{counter name="panelFieldCount"}

{if strlen($fields.phone_work.value) <= 0}
{assign var="value" value=$fields.phone_work.default_value }
{else}
{assign var="value" value=$fields.phone_work.value }
{/if}  
<input type='text' name='{$fields.phone_work.name}' id='{$fields.phone_work.name}' size='30' maxlength='100' value='{$value}' title='' tabindex='0'	  class="phone" >
</tr>
{/capture}
{if $fieldsUsed > 0 }
{$tableRow}
{/if}
{counter name="fieldsUsed" start=0 print=false assign="fieldsUsed"}
{capture name="tr" assign="tableRow"}
<tr>
<td valign="top" id='last_name_label' width='12.5%' data-total-columns="2" scope="col">
{capture name="label" assign="label"}{sugar_translate label='LBL_LAST_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:
<span class="required">*</span>
</td>
{counter name="fieldsUsed"}

<td valign="top" width='37.5%' data-total-columns="2" >
{counter name="panelFieldCount"}

{if strlen($fields.last_name.value) <= 0}
{assign var="value" value=$fields.last_name.default_value }
{else}
{assign var="value" value=$fields.last_name.value }
{/if}  
<input type='text' name='{$fields.last_name.name}' 
id='{$fields.last_name.name}' size='30' 
maxlength='100' 
value='{$value}' title=''      >
<td valign="top" id='phone_mobile_label' width='12.5%' data-total-columns="2" scope="col">
{capture name="label" assign="label"}{sugar_translate label='LBL_MOBILE_PHONE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</td>
{counter name="fieldsUsed"}

<td valign="top" width='37.5%' data-total-columns="2" >
{counter name="panelFieldCount"}

{if strlen($fields.phone_mobile.value) <= 0}
{assign var="value" value=$fields.phone_mobile.default_value }
{else}
{assign var="value" value=$fields.phone_mobile.value }
{/if}  
<input type='text' name='{$fields.phone_mobile.name}' id='{$fields.phone_mobile.name}' size='30' maxlength='100' value='{$value}' title='' tabindex='0'	  class="phone" >
</tr>
{/capture}
{if $fieldsUsed > 0 }
{$tableRow}
{/if}
{counter name="fieldsUsed" start=0 print=false assign="fieldsUsed"}
{capture name="tr" assign="tableRow"}
<tr>
<td valign="top" id='account_name_label' width='12.5%' data-total-columns="2" scope="col">
{capture name="label" assign="label"}{sugar_translate label='LBL_ACCOUNT_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</td>
{counter name="fieldsUsed"}

<td valign="top" width='37.5%' data-total-columns="2" >
{counter name="panelFieldCount"}

{if strlen($fields.account_name.value) <= 0}
{assign var="value" value=$fields.account_name.default_value }
{else}
{assign var="value" value=$fields.account_name.value }
{/if}  
<input type='text' name='{$fields.account_name.name}' 
id='{$fields.account_name.name}' size='30' 
maxlength='150' 
value='{$value}' title=''      >
<td valign="top" id='phone_fax_label' width='12.5%' data-total-columns="2" scope="col">
{capture name="label" assign="label"}{sugar_translate label='LBL_FAX_PHONE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</td>
{counter name="fieldsUsed"}

<td valign="top" width='37.5%' data-total-columns="2" >
{counter name="panelFieldCount"}

{if strlen($fields.phone_fax.value) <= 0}
{assign var="value" value=$fields.phone_fax.default_value }
{else}
{assign var="value" value=$fields.phone_fax.value }
{/if}  
<input type='text' name='{$fields.phone_fax.name}' id='{$fields.phone_fax.name}' size='30' maxlength='100' value='{$value}' title='' tabindex='0'	  class="phone" >
</tr>
{/capture}
{if $fieldsUsed > 0 }
{$tableRow}
{/if}
{counter name="fieldsUsed" start=0 print=false assign="fieldsUsed"}
{capture name="tr" assign="tableRow"}
<tr>
<td valign="top" id='title_label' width='12.5%' data-total-columns="2" scope="col">
{capture name="label" assign="label"}{sugar_translate label='LBL_TITLE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</td>
{counter name="fieldsUsed"}

<td valign="top" width='37.5%' data-total-columns="2" >
{counter name="panelFieldCount"}

{if strlen($fields.title.value) <= 0}
{assign var="value" value=$fields.title.default_value }
{else}
{assign var="value" value=$fields.title.value }
{/if}  
<input type='text' name='{$fields.title.name}' 
id='{$fields.title.name}' size='30' 
maxlength='100' 
value='{$value}' title=''      >
<td valign="top" id='department_label' width='12.5%' data-total-columns="2" scope="col">
{capture name="label" assign="label"}{sugar_translate label='LBL_DEPARTMENT' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</td>
{counter name="fieldsUsed"}

<td valign="top" width='37.5%' data-total-columns="2" >
{counter name="panelFieldCount"}

{if strlen($fields.department.value) <= 0}
{assign var="value" value=$fields.department.default_value }
{else}
{assign var="value" value=$fields.department.value }
{/if}  
<input type='text' name='{$fields.department.name}' 
id='{$fields.department.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</tr>
{/capture}
{if $fieldsUsed > 0 }
{$tableRow}
{/if}
{counter name="fieldsUsed" start=0 print=false assign="fieldsUsed"}
{capture name="tr" assign="tableRow"}
<tr>
<td valign="top" id='team_name_label' width='12.5%' data-total-columns="2" scope="col">
&nbsp;
</td>
{counter name="fieldsUsed"}

<td valign="top" width='37.5%' data-total-columns="2" >
<td valign="top" id='do_not_call_label' width='12.5%' data-total-columns="2" scope="col">
{capture name="label" assign="label"}{sugar_translate label='LBL_DO_NOT_CALL' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</td>
{counter name="fieldsUsed"}

<td valign="top" width='37.5%' data-total-columns="2" >
{counter name="panelFieldCount"}

{if strval($fields.do_not_call.value) == "1" || strval($fields.do_not_call.value) == "yes" || strval($fields.do_not_call.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.do_not_call.name}" value="0"> 
<input type="checkbox" id="{$fields.do_not_call.name}" 
name="{$fields.do_not_call.name}" 
value="1" title='' tabindex="0" {$checked} >
</tr>
{/capture}
{if $fieldsUsed > 0 }
{$tableRow}
{/if}
{counter name="fieldsUsed" start=0 print=false assign="fieldsUsed"}
{capture name="tr" assign="tableRow"}
<tr>
<td valign="top" id='assigned_user_name_label' width='12.5%' data-total-columns="1" scope="col">
{capture name="label" assign="label"}{sugar_translate label='LBL_ASSIGNED_TO' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</td>
{counter name="fieldsUsed"}

<td valign="top" width='37.5%' data-total-columns="1" colspan='3'>
{counter name="panelFieldCount"}

<input type="text" name="{$fields.assigned_user_name.name}" class="sqsEnabled" tabindex="0" id="{$fields.assigned_user_name.name}" size="" value="{$fields.assigned_user_name.value}" title='' autocomplete="off"  	 >
<input type="hidden" name="{$fields.assigned_user_name.id_name}" 
id="{$fields.assigned_user_name.id_name}" 
value="{$fields.assigned_user_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.assigned_user_name.name}" id="btn_{$fields.assigned_user_name.name}" tabindex="0" title="{sugar_translate label="LBL_ACCESSKEY_SELECT_USERS_TITLE"}" class="button firstChild" value="{sugar_translate label="LBL_ACCESSKEY_SELECT_USERS_LABEL"}"
onclick='open_popup(
"{$fields.assigned_user_name.module}", 
600, 
400, 
"", 
true, 
false, 
{literal}{"call_back_function":"set_return","form_name":"form_QuickCreate_Prospects","field_to_name_array":{"id":"assigned_user_id","user_name":"assigned_user_name"}}{/literal}, 
"single", 
true
);' ><img src="{sugar_getimagepath file="id-ff-select.png"}"></button><button type="button" name="btn_clr_{$fields.assigned_user_name.name}" id="btn_clr_{$fields.assigned_user_name.name}" tabindex="0" title="{sugar_translate label="LBL_ACCESSKEY_CLEAR_USERS_TITLE"}"  class="button lastChild"
onclick="SUGAR.clearRelateField(this.form, '{$fields.assigned_user_name.name}', '{$fields.assigned_user_name.id_name}');"  value="{sugar_translate label="LBL_ACCESSKEY_CLEAR_USERS_LABEL"}" ><img src="{sugar_getimagepath file="id-ff-clear.png"}"></button>
</span>
<script type="text/javascript">
SUGAR.util.doWhen(
		"typeof(sqs_objects) != 'undefined' && typeof(sqs_objects['{$form_name}_{$fields.assigned_user_name.name}']) != 'undefined'",
		enableQS
);
</script>
</tr>
{/capture}
{if $fieldsUsed > 0 }
{$tableRow}
{/if}
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("LBL_PROSPECT_INFORMATION").style.display='none';</script>
{/if}
<div id="detailpanel_2" class="{$def.templateMeta.panelClass|default:'edit view edit508'}">
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table width="100%" border="0" cellspacing="1" cellpadding="0"  id='LBL_EMAIL_ADDRESSES'  class="yui3-skin-sam edit view panelContainer">
{counter name="fieldsUsed" start=0 print=false assign="fieldsUsed"}
{capture name="tr" assign="tableRow"}
<tr>
<td valign="top" id='email1_label' width='12.5%' data-total-columns="1" scope="col">
{capture name="label" assign="label"}{sugar_translate label='LBL_EMAIL_ADDRESS' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</td>
{counter name="fieldsUsed"}

<td valign="top" width='37.5%' data-total-columns="1" colspan='3'>
{counter name="panelFieldCount"}
<span id='email1_span'>
{$fields.email1.value}</span>
</tr>
{/capture}
{if $fieldsUsed > 0 }
{$tableRow}
{/if}
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("LBL_EMAIL_ADDRESSES").style.display='none';</script>
{/if}
<div id="detailpanel_3" class="{$def.templateMeta.panelClass|default:'edit view edit508'}">
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table width="100%" border="0" cellspacing="1" cellpadding="0"  id='LBL_ADDRESS_INFORMATION'  class="yui3-skin-sam edit view panelContainer">
{counter name="fieldsUsed" start=0 print=false assign="fieldsUsed"}
{capture name="tr" assign="tableRow"}
<tr>
<td valign="top" id='primary_address_street_label' width='12.5%' data-total-columns="2" scope="col">
{capture name="label" assign="label"}{sugar_translate label='LBL_PRIMARY_ADDRESS_STREET' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</td>
{counter name="fieldsUsed"}

<td valign="top" width='37.5%' data-total-columns="2" >
{counter name="panelFieldCount"}

{if strlen($fields.primary_address_street.value) <= 0}
{assign var="value" value=$fields.primary_address_street.default_value }
{else}
{assign var="value" value=$fields.primary_address_street.value }
{/if}  
<input type='text' name='{$fields.primary_address_street.name}' 
id='{$fields.primary_address_street.name}' size='30' 
maxlength='150' 
value='{$value}' title=''      >
<td valign="top" id='alt_address_street_label' width='12.5%' data-total-columns="2" scope="col">
{capture name="label" assign="label"}{sugar_translate label='LBL_ALT_ADDRESS_STREET' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</td>
{counter name="fieldsUsed"}

<td valign="top" width='37.5%' data-total-columns="2" >
{counter name="panelFieldCount"}

{if strlen($fields.alt_address_street.value) <= 0}
{assign var="value" value=$fields.alt_address_street.default_value }
{else}
{assign var="value" value=$fields.alt_address_street.value }
{/if}  
<input type='text' name='{$fields.alt_address_street.name}' 
id='{$fields.alt_address_street.name}' size='30' 
maxlength='150' 
value='{$value}' title=''      >
</tr>
{/capture}
{if $fieldsUsed > 0 }
{$tableRow}
{/if}
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("LBL_ADDRESS_INFORMATION").style.display='none';</script>
{/if}
</div></div>

<script language="javascript">
    var _form_id = '{$form_id}';
    {literal}
    SUGAR.util.doWhen(function(){
        _form_id = (_form_id == '') ? 'EditView' : _form_id;
        return document.getElementById(_form_id) != null;
    }, SUGAR.themes.actionMenu);
    {/literal}
</script>
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="dcQuickEdit">
<tr>
<td class="buttons">
{assign var='place' value="_FOOTER"}
<!-- to be used for id for buttons with custom code in def files-->
<div class="action_buttons">{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="var _form = document.getElementById('form_QuickCreate_Prospects'); _form.action.value='Popup';return check_form('form_QuickCreate_Prospects')" type="submit" name="Prospects_popupcreate_save_button" id="Prospects_popupcreate_save_button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if}  <input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="toggleDisplay('addform');return false;" name="Prospects_popup_cancel_button" type="submit"id="Prospects_popup_cancel_button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}">  {if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input id="btn_view_change_log" title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Prospects", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="button" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}<div class="clear"></div></div>
</td>
<td align='right' class="edit-view-pagination">
</td>
</tr>
</table>
</form>
{$set_focus_block}
<script>SUGAR.util.doWhen("document.getElementById('EditView') != null",
function(){ldelim}SUGAR.util.buildAccessKeyLabels();{rdelim});
</script><script type="text/javascript">
YAHOO.util.Event.onContentReady("form_QuickCreate_Prospects",
    function () {ldelim} initEditView(document.forms.form_QuickCreate_Prospects) {rdelim});
//window.setTimeout(, 100);
window.onbeforeunload = function () {ldelim} return onUnloadEditView(); {rdelim};
// bug 55468 -- IE is too aggressive with onUnload event
if ($.browser.msie) {ldelim}
$(document).ready(function() {ldelim}
    $(".collapseLink,.expandLink").click(function (e) {ldelim} e.preventDefault(); {rdelim});
  {rdelim});
{rdelim}
</script>{literal}
<script type="text/javascript">
addForm('form_QuickCreate_Prospects');addToValidate('form_QuickCreate_Prospects', 'name', 'name', false,'{/literal}{sugar_translate label='LBL_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'date_entered_date', 'date', false,'Date Created' );
addToValidate('form_QuickCreate_Prospects', 'date_modified_date', 'date', false,'Date Modified' );
addToValidate('form_QuickCreate_Prospects', 'modified_user_id', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_MODIFIED' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'modified_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_MODIFIED_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'created_by', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_CREATED' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'created_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_CREATED' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'description', 'text', false,'{/literal}{sugar_translate label='LBL_DESCRIPTION' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'deleted', 'bool', false,'{/literal}{sugar_translate label='LBL_DELETED' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'assigned_user_id', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_ID' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'assigned_user_name', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'salutation', 'enum', false,'{/literal}{sugar_translate label='LBL_SALUTATION' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'first_name', 'varchar', false,'{/literal}{sugar_translate label='LBL_FIRST_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'last_name', 'varchar', true,'{/literal}{sugar_translate label='LBL_LAST_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'full_name', 'fullname', false,'{/literal}{sugar_translate label='LBL_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'title', 'varchar', false,'{/literal}{sugar_translate label='LBL_TITLE' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'photo', 'image', false,'{/literal}{sugar_translate label='LBL_PHOTO' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'department', 'varchar', false,'{/literal}{sugar_translate label='LBL_DEPARTMENT' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'do_not_call', 'bool', false,'{/literal}{sugar_translate label='LBL_DO_NOT_CALL' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'phone_home', 'phone', false,'{/literal}{sugar_translate label='LBL_HOME_PHONE' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'email', 'email', false,'{/literal}{sugar_translate label='LBL_ANY_EMAIL' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'phone_mobile', 'phone', false,'{/literal}{sugar_translate label='LBL_MOBILE_PHONE' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'phone_work', 'phone', false,'{/literal}{sugar_translate label='LBL_OFFICE_PHONE' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'phone_other', 'phone', false,'{/literal}{sugar_translate label='LBL_OTHER_PHONE' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'phone_fax', 'phone', false,'{/literal}{sugar_translate label='LBL_FAX_PHONE' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'email1', 'varchar', false,'{/literal}{sugar_translate label='LBL_EMAIL_ADDRESS' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'email2', 'varchar', false,'{/literal}{sugar_translate label='LBL_OTHER_EMAIL_ADDRESS' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'invalid_email', 'bool', false,'{/literal}{sugar_translate label='LBL_INVALID_EMAIL' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'email_opt_out', 'bool', false,'{/literal}{sugar_translate label='LBL_EMAIL_OPT_OUT' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'primary_address_street', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_STREET' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'primary_address_street_2', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_STREET_2' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'primary_address_street_3', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_STREET_3' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'primary_address_city', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_CITY' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'primary_address_state', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_STATE' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'primary_address_postalcode', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_POSTALCODE' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'primary_address_country', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_COUNTRY' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'alt_address_street', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_STREET' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'alt_address_street_2', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_STREET_2' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'alt_address_street_3', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_STREET_3' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'alt_address_city', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_CITY' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'alt_address_state', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_STATE' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'alt_address_postalcode', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_POSTALCODE' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'alt_address_country', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_COUNTRY' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'assistant', 'varchar', false,'{/literal}{sugar_translate label='LBL_ASSISTANT' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'assistant_phone', 'phone', false,'{/literal}{sugar_translate label='LBL_ASSISTANT_PHONE' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'email_addresses_non_primary', 'email', false,'{/literal}{sugar_translate label='LBL_EMAIL_NON_PRIMARY' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'tracker_key', 'int', true,'{/literal}{sugar_translate label='LBL_TRACKER_KEY' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'birthdate', 'date', false,'{/literal}{sugar_translate label='LBL_BIRTHDATE' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'lead_id', 'id', false,'{/literal}{sugar_translate label='LBL_LEAD_ID' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'account_name', 'varchar', false,'{/literal}{sugar_translate label='LBL_ACCOUNT_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'campaign_id', 'id', false,'{/literal}{sugar_translate label='LBL_CAMPAIGN_ID' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'e_invite_status_fields', 'relate', false,'{/literal}{sugar_translate label='LBL_CONT_INVITE_STATUS' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'event_status_name', 'enum', false,'{/literal}{sugar_translate label='LBL_LIST_INVITE_STATUS_EVENT' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'event_invite_id', 'varchar', false,'{/literal}{sugar_translate label='LBL_LIST_INVITE_STATUS' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'e_accept_status_fields', 'relate', false,'{/literal}{sugar_translate label='LBL_CONT_ACCEPT_STATUS' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'event_accept_status', 'enum', false,'{/literal}{sugar_translate label='LBL_LIST_ACCEPT_STATUS_EVENT' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'event_status_id', 'varchar', false,'{/literal}{sugar_translate label='LBL_LIST_ACCEPT_STATUS' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'jjwg_maps_address_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_JJWG_MAPS_ADDRESS' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'jjwg_maps_lng_c', 'float', false,'{/literal}{sugar_translate label='LBL_JJWG_MAPS_LNG' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'jjwg_maps_geocode_status_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_JJWG_MAPS_GEOCODE_STATUS' module='Prospects' for_js=true}{literal}' );
addToValidate('form_QuickCreate_Prospects', 'jjwg_maps_lat_c', 'float', false,'{/literal}{sugar_translate label='LBL_JJWG_MAPS_LAT' module='Prospects' for_js=true}{literal}' );
addToValidateBinaryDependency('form_QuickCreate_Prospects', 'assigned_user_name', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='Prospects' for_js=true}{literal}: {/literal}{sugar_translate label='LBL_ASSIGNED_TO' module='Prospects' for_js=true}{literal}', 'assigned_user_id' );
</script><script language="javascript">if(typeof sqs_objects == 'undefined'){var sqs_objects = new Array;}sqs_objects['form_QuickCreate_Prospects_assigned_user_name']={"form":"form_QuickCreate_Prospects","method":"get_user_array","field_list":["user_name","id"],"populate_list":["assigned_user_name","assigned_user_id"],"required_list":["assigned_user_id"],"conditions":[{"name":"user_name","op":"like_custom","end":"%","value":""}],"limit":"30","no_match_text":"No Match"};</script>{/literal}
