<%-- /*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */ --%>
 <%@include file="/libs/sling-cms/global.jsp"%>
<input type="text" name="${properties.name}" value="${editProperties[properties.name]}" ${required} ${disabled} list="paths-${resource.name}" autocomplete="off" />
<datalist id="paths-${resource.name}">
	<c:set var="query" value="SELECT * FROM [${properties.type != null ? properties.type : 'nt:hierarchyNode'}] WHERE ISDESCENDANTNODE([${properties.basePath != null ? properties.basePath : '/content'}]) ${properties.additionalParams}" />
	<c:forEach var="resource" items="${sling:findResources(resourceResolver,query,'JCR-SQL2')}">
		<option value="${resource.path}">${resource.valueMap[properties.titleProperty]}</option>
	</c:forEach>
</datalist>