<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<#-- Party Roles -->
<br/>
<div id="partyRoles" class="screenlet">
  <div class="screenlet-title-bar">
    <h3>${uiLabelMap.PartyMemberRoles}</h3>
  </div>
  <div class="screenlet-body">
    <table cellspacing="0" class="basic-table">
      <#if partyRoles?has_content>
          <tr class="header-row">
            <td>${uiLabelMap.PartyRoleTypeId}</td>            
            <td>${uiLabelMap.PartyRole}</td>  
            <td>&nbsp;</td>            
          </tr>
        <#list partyRoles as userRole>
          <tr>
            <td>${userRole.roleTypeId}</td>
            <td>${userRole.get("description",locale)}</td>
            <#if hasDeletePermission>
              <td class="button-col align-float">
                <a href="<@ofbizUrl>deleterole?partyId=${partyId}&roleTypeId=${userRole.roleTypeId}</@ofbizUrl>" class="smallSubmit">${uiLabelMap.CommonRemove}</a>&nbsp;
              </td>
            <#else>
              <td>&nbsp;</td>
            </#if>
          </tr>
        </#list>
      <#else>
          <tr>
              <td colspan="3">
                  ${uiLabelMap.PartyNoPartyRolesFound}
              </td>
          </tr>
      </#if>
    </table>
  </div>
</div>
<div class="screenlet">
  <div class="screenlet-title-bar">
    <h3>${uiLabelMap.PartyAddToRole}</h3>
  </div>
  <div class="screenlet-body">
    <table cellspacing="0" class="basic-table">
      <#if hasUpdatePermission>
        <tr>
          <td>
            <form name="addPartyRole" method="post" action="<@ofbizUrl>addrole/viewroles</@ofbizUrl>">
              <input type="hidden" name="partyId" value="${partyId}"/>
              <select name="roleTypeId">
                <#list roles as role>
                  <option value="${role.roleTypeId}">${role.get("description",locale)}</option>
                </#list>
              </select>
              <a href="javascript:document.addPartyRole.submit()" class="smallSubmit">${uiLabelMap.CommonAdd}</a>
            </form>
          </td>
        </tr>
      </#if>
    </table>
  </div>
</div>

<#-- Add role type -->
<#if hasCreatePermission>
<div id="newRoleType" class="screenlet">
  <div class="screenlet-title-bar">
    <h3>${uiLabelMap.PartyNewRoleType}</h3>
  </div>
  <div class="screenlet-body">
    <form method="post" action="<@ofbizUrl>createroletype</@ofbizUrl>" name="createroleform">
      <input type='hidden' name='party_id' value='${partyId}'>
      <input type='hidden' name='partyId' value='${partyId}'>
      <table cellspacing="0" class="basic-table">
        <tr>
          <td class="label">${uiLabelMap.PartyRoleTypeId}</td>
          <td>
            <input type="text" name="roleTypeId" size="20" class="required"><span class="tooltip">${uiLabelMap.CommonRequired}</span>
          </td>
        <tr>
          <td class="label">${uiLabelMap.CommonDescription}</td>
          <td>
            <input type="text" name="description" size="30" class="required"><span class="tooltip">${uiLabelMap.CommonRequired}</span>
            <a href="javascript:document.createroleform.submit()" class="smallSubmit">${uiLabelMap.CommonSave}</a>
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>
</#if>