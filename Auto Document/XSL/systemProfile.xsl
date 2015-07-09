<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/le-frog/jquery-ui.css" />
	<link rel="stylesheet" href="..\SiteAssets\Auto%20Document\Media\CSS\systemProfile.css" />
	<script type="text/javascript" language="javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script type="text/javascript" language="javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script type="text/javascript" language="javascript" src="..\SiteAssets\Auto%20Document\Media\JS\jquery.dataTables.js"></script>

	<script>
		//JQuery Accordion
		$(function() {
		$( "#accordion" ).accordion({
		  collapsible: true,
		  active: false,
		  heightStyle: "content"
		});
		});
		
		//Loading in tables
		$(document).ready(function() {
			$('#tableMeasures').dataTable( {
				"bJQueryUI": true,
				"sScrollY": "300px",
				"bPaginate": false
			});
			$('#tableBT').dataTable( {
				"sScrollX": "100%",
				"bJQueryUI": true
			});
			$('#tableSensor').dataTable( {
				"sScrollX": "100%",
				"bJQueryUI": true
			});
			$('#tableErrors').dataTable( {
				"sScrollX": "100%",
				"bJQueryUI": true
			});
			$('#tableIncident').dataTable( {
				"sScrollX": "100%",
				"bJQueryUI": true
			});
		} );
		
		//the tabs for API
		$(function() {
			$( "#tabsAPI" ).tabs({
			  collapsible: true
			});
		  });
	  
	</script>
</head>
<body>
<div id="quickLinks" class="columns">
	<div class="leftColumn">
		<h2>Quick Links</h2>
		<ul>
			<li><a href="#general">General</a></li>
			<li><a href="#agentGroups">Agent Groups</a></li>
			<li><a href="#sensorGroup">Sensor Group</a></li>
			<li><a href="#definedAPI">APIs</a></li>
			<li><a href="#measures">Measures</a></li>
			<li><a href="#businessTransactions">Business Transactions</a></li>
			<li><a href="#schedule">Schedules</a></li>
			<li><a href="#task">Tasks</a></li>
			<li><a href="#monitors">Monitors</a></li>
			<li><a href="#incidentrules">Incident Rules</a></li>
			<li><a href="#errors">Errors</a></li>
			<li><a href="#application">Applications</a></li>
		</ul>
	</div>
	<div class="rightColumn">
		<xsl:choose>
			<!--displays an image of the dT splashscreen.  Currently only 6.2 through 4.2 is configured-->
			<xsl:when test="starts-with(/dynatrace/@version,'6.2')" >
				<a href="https://apmcommunity.compuware.com/community/display/DOCDT62/dynaTrace+Documentation"><img id="dynaTraceImage" src="..\SiteAssets\Auto%20Document\Media\Images\dynaTraceSplash62.png" /></a>
			</xsl:when>
			<xsl:when test="starts-with(/dynatrace/@version,'6.1')" >
				<a href="https://apmcommunity.compuware.com/community/display/DOCDT61/dynaTrace+Documentation"><img id="dynaTraceImage" src="..\SiteAssets\Auto%20Document\Media\Images\dynaTraceSplash61.png" /></a>
			</xsl:when>
			<xsl:when test="starts-with(/dynatrace/@version,'6.0')" >
				<a href="https://apmcommunity.compuware.com/community/display/DOCDT60/dynaTrace+Documentation"><img id="dynaTraceImage" src="..\SiteAssets\Auto%20Document\Media\Images\dynaTraceSplash60.png" /></a>
			</xsl:when>
			<xsl:when test="starts-with(/dynatrace/@version,'5.6')" >
				<a href="https://apmcommunity.compuware.com/community/display/DOCDT56/dynaTrace+Documentation"><img id="dynaTraceImage" src="..\SiteAssets\Auto%20Document\Media\Images\dynaTraceSplash56.png" /></a>
			</xsl:when>
			<xsl:when test="starts-with(/dynatrace/@version,'5.5')" >
				<a href="https://apmcommunity.compuware.com/community/display/DOCDT55/dynaTrace+Documentation"><img id="dynaTraceImage" src="..\SiteAssets\Auto%20Document\Media\Images\dynaTraceSplash55.png" /></a>
			</xsl:when>
			<xsl:when test="starts-with(/dynatrace/@version,'5.0')" >
				<a href="https://apmcommunity.compuware.com/community/display/DOCDT50/dynaTrace+Documentation"><img id="dynaTraceImage" src="..\SiteAssets\Auto%20Document\Media\Images\dynaTraceSplash50.png" /></a>
			</xsl:when>
			<xsl:when test="starts-with(/dynatrace/@version,'4.2')" >
				<a href="https://apmcommunity.compuware.com/community/display/DOCDT42/dynaTrace+Documentation"><img id="dynaTraceImage" src="..\SiteAssets\Auto%20Document\Media\Images\dynaTraceSplash42.png" /></a>
			</xsl:when>
		</xsl:choose>
	</div>
</div>

<div id="general">


	<h2>General System Profile Configuration</h2>

	<p>A System Profile is capable of supporting the following technologies:</p>
	<ul>
		<li>Java - Java Platform (since JDK 1.4)</li>
		<li>.NET - .NET Platform</li>
		<li>Browser - Browser Agents</li>
		<li>Web server - Webserver Agents</li>
		<li>PHP - PHP Agents</li>
		<li>ADK - Native Agent Development Kit</li>
	</ul>
	<p>If a technology is not supported by the System Profile it is not possible to define sensor rules for this technology.  This application is currently using the following technologies:</p>
	
	<table padding="5">
	<tr>
		<xsl:for-each select="dynatrace/systemprofile/technology">
			<td>
				<xsl:if test="@type='java'">
					<img src="..\SiteAssets\Auto%20Document\Media\Images\java.PNG" />
				</xsl:if>
				<xsl:if test="@type='dotnet'">
					<img src="..\SiteAssets\Auto%20Document\Media\Images\net.PNG" />
				</xsl:if>
				<xsl:if test="@type='browser'">
					<img src="..\SiteAssets\Auto%20Document\Media\Images\browser.PNG" />
				</xsl:if>
				<xsl:if test="@type='webserver'">
					<img src="..\SiteAssets\Auto%20Document\Media\Images\web.PNG" />
				</xsl:if>
				<xsl:if test="@type='php'">
					<img src="..\SiteAssets\Auto%20Document\Media\Images\php.PNG" />
				</xsl:if>
				<xsl:if test="@type='native'">
					<img src="..\SiteAssets\Auto%20Document\Media\Images\native.PNG" />
				</xsl:if>
			</td>
		</xsl:for-each>
	</tr>
  </table>
  <p>This application's system profile currently has <xsl:value-of select="count(dynatrace/systemprofile/configurations/configuration)" /> configuration(s) configured.  The different configurations are:</p>
	<ul>
		<xsl:for-each select="dynatrace/systemprofile/configurations/configuration" >
			<li><xsl:value-of select="@id" /></li>
		</xsl:for-each>
	</ul>
</div>

<div id="agentGroups">
	<h2>Agent Groups</h2>

	<p>Agent Groups allow dynamic and automatic assignment of dynaTrace Agents to groups that share the same configuration settings for Sensor Placement, Sensor Configuration and Measure Subscription. With the additional use of Agent Mappings, Agent Groups provide a flexible mechanism to map dynaTrace Agents based on their name or host.  For more information, please click <a href="https://apmcommunity.compuware.com/community/display/DOCDT55/Usage+of+Agent+Groups">here</a>.</p>

	<p>Below you'll see which agent groups are associated with this application.  Furthermore, you can see that which sensor groups are enabled per agent group.</p>
	<div id="accordion" style="width:60%">
		<xsl:for-each select="dynatrace/systemprofile/agentgroups/agentgroup">
			<h3><!--title--><xsl:value-of select="@id"/></h3>
				<div>
					<p>
					<xsl:value-of select="@id"/> has the following <xsl:value-of select="count(child::sensorplacement/sensor[@placed='true'])"/> sensor group(s) placed.
						<ul>
							<xsl:for-each select="./sensorplacement/sensor">
								<xsl:choose>
									
									<xsl:when test="starts-with(@id,'com.dynatrace.diagnostics.sensorgroup.') and @placed='true'">
										<xsl:variable name="keyName" select="@id" />
										<xsl:for-each select="//dynatrace/systemprofile/sensorgroups/sensorgroup/sensor">
											<xsl:choose>
												<xsl:when test="$keyName = @key">
													<li>
														<b><xsl:value-of select="@description"/></b>
														<xsl:if test="contains(@key,'.memory.')">
															<b> (Memory Sensor Group)</b>
														</xsl:if>
													</li>
												</xsl:when>
											</xsl:choose>
										</xsl:for-each>
									</xsl:when>
									<xsl:when test="@placed='true'">
										<xsl:call-template name="doWhile">
											<xsl:with-param name="sensorText" select="@id" />
										</xsl:call-template>				
									</xsl:when>
								</xsl:choose>
							</xsl:for-each>
						</ul>
					<font size="1">*bold means custom sensor group</font>
					</p>
				</div>
		</xsl:for-each>
	</div>
</div>

<div id="sensorGroup" >
	<h2>Sensor Groups</h2>

	<p>By default dynaTrace places Knowledge Sensor Packs on all important component interfaces.</p>
	<p>To diagnose performance issues deeper in the application at the package/namespace, class or method levels, Method Sensor Rules can be used.</p>
	<p>To find out what packages/namespaces, classes and methods are available to instrument, dynaTrace provides a <a href="https://apmcommunity.compuware.com/community/display/DOCDT55/Discovery+Run">Discovery Run</a> which locates all packages/namespaces of the application. The Method Sensor Rule configuration is used to gather information about specific packages/namespaces, classes and methods. Additionally, dynaTrace Method Sensor Rules allow to capture specific method arguments and return values which are very useful in diagnosing issues.  For more information, please click <a href="https://apmcommunity.compuware.com/community/display/DOCDT55/Sensor+Configuration">here</a>.</p>

	<p>Below you'll see which agent groups are associated with this application.  Furthermore, you can see that which sensor groups are enabled per agent group.</p>
	<table cellpadding="0" cellspacing="0" border="0" class="display" id="tableSensor">
		<thead>
			<tr>
				<th>Name</th>
				<th>Type</th>
				<th>Class Count</th>
				<th>Method Count</th>
				<th>Start purepaths</th>
				<th>Excluded</th>
			</tr>
		</thead>
		<tbody>
			<xsl:for-each select="dynatrace/systemprofile/sensorgroups/sensorgroup/sensor">
				<xsl:choose>
					<xsl:when test="count(child::class/method)>0 and @key!='Default API rules for .net' and @key!='Default API rules for Java'">
						<tr>
							<td><xsl:value-of select="@description"/></td>
							<td><xsl:value-of select="@type"/></td>
							<td><xsl:value-of select="count(child::class)"/></td>
							<td><xsl:value-of select="count(child::class/method)"/></td>
							<td><xsl:value-of select="count(child::class/method[@capture='startPP'])"/></td>
							<td><xsl:value-of select="count(child::class/method[@placed='exclude' or @placed='globalexclude'])"/></td>
						</tr>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</tbody>
	</table>
</div>

<div id="definedAPI" >
	<h2>APIs</h2>

	<p>The dynaTrace system uses the term <b>"API"</b> as a grouping criterion for classes and packages.</p>
	
	<p>Typical criteria are:</p>
	<ul>
		<li>Basic Technologies (e.g. "JDBC", "Servlet")</li>
		<li>Frameworks (e.g. "Hibernate")</li>
		<li>Customer Application Boundaries or Subsystems (e.g. "BusinessLogic", "EventProcessing")</li>
	</ul>
	<p>dynaTrace comes with a predefined set of known APIs (e.g. "Servlet", "JDBC", "JMS") which are applied to all nodes (=Methods) that are part of a PurePath. Nodes may have more than one API (typical example: "Servlet" and "WebService"), but for analysis reasons the dynaTrace system always chooses one API as the most significant one.</p>
	
	<p>If a node does not belong to the predefined set of APIs, the dynaTrace system generates an API name from the package-name of the node.</p>
	
	<p>The user is free to define his own APIs for selected packages per System Profile (see <a href="https://apmcommunity.compuware.com/community/display/DOCDT55/System+Profile+-+APIs">System Profile - APIs</a>).</p>

	<p>Below are the APIs that have been manually configured for this application.</p>
	
	<div id="tabsAPI" style="width:60%">
		<ul>
			<li><a href="#javaAPI">Java APIs</a></li>
			<li><a href="#dotnetAPI">.NET APIs</a></li>
		</ul>
		<div id="javaAPI">
			<table border="1" cellpadding="5" width="100%">
				<tr bgcolor="#9acd32">
				  <th width="60%">Package</th>
				  <th width="40%">API</th>
				</tr>
				<xsl:for-each select="dynatrace/systemprofile/sensorgroups/sensorgroup/sensor[@key='Default API rules for Java']/class">
					<xsl:choose>
						<xsl:when test="count(method)>0">
							<tr>
								<td><xsl:value-of select="@pattern"/></td>
								<td><xsl:value-of select="method/@api"/></td>
							</tr>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</table>
			<font size="1">Currently this application have <xsl:value-of select="count(dynatrace/systemprofile/sensorgroups/sensorgroup/sensor[@key='Default API rules for Java']/class/method)" /> java APIs defined.</font>
		</div>
		<div id="dotnetAPI">
			<table border="1" cellpadding="5" width="100%">
				<tr bgcolor="#9acd32">
				  <th width="60%">Package</th>
				  <th width="40%">API</th>
				</tr>
				<xsl:for-each select="dynatrace/systemprofile/sensorgroups/sensorgroup/sensor[@key='Default API rules for .net']/class">
					<xsl:choose>
						<xsl:when test="count(method)>0">
							<tr>
								<td><xsl:value-of select="@pattern"/></td>
								<td><xsl:value-of select="method/@api"/></td>
							</tr>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			  </table>
			  <font size="1">Currently this application have <xsl:value-of select="count(dynatrace/systemprofile/sensorgroups/sensorgroup/sensor[@key='Default API rules for .net']/class/method)" /> .Net APIs defined.</font>
		</div>
	</div>
</div>

<div id="measures" >
	<h2>Measures</h2>
	<p>A measure is used for charting and are stored in the performance warehouse.  There has been <xsl:value-of select="count(dynatrace/systemprofile/measures/measure[@userdefined='true'])" /> measure(s) configured for this application.  For more information on measures, click <a href="https://apmcommunity.compuware.com/community/display/DOCDT55/Usage+of+Business+Transactions">here</a></p>
	
	<p>The following measures have been configured for this application.</p>
	
	<table cellpadding="0" cellspacing="0" border="0" class="display" id="tableMeasures">
		<thead>
			<tr>
				<th>Name</th>
				<th>Measure Type</th>
				<th>Metric Group ID</th>
				<th>Calc Baseline</th>
				<th>Display Unit</th>
			</tr>
		</thead>
		<tbody>
			<xsl:for-each select="dynatrace/systemprofile/measures/measure">
				<xsl:choose>
					<xsl:when test="@userdefined!='false'">
						<tr>
						  <td><xsl:value-of select="@id"/></td>
						  <td><xsl:value-of select="@measuretype"/></td>
						  <td><xsl:value-of select="@metricgroupid"/></td>
						  <td><xsl:value-of select="@calculatebaseline"/></td>
						  <td><xsl:value-of select="@displayunit"/></td>
						</tr>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</tbody>
	</table>
</div>

<div id="businessTransactions" >
	<h2>Business Transactions</h2>
	<p>A Business Transaction can be defined as a set of automated interactions between IT systems that execute a business task or business process. In DynaTrace a business transaction is technically a categorization of PurePaths defined by filter or grouping parameters. Once a PurePath has been matched to those criterions one (or more) evaluation metrics are calculated representing the result set of the business transaction.  To better understand how to use a business transactions properly, click <a href="https://apmcommunity.compuware.com/community/display/DOCDT55/Usage+of+Business+Transactions">here</a></p>
	
	<p>The following business transactions have been configured for this application.</p>
	

	<table cellpadding="0" cellspacing="0" border="0" class="display" id="tableBT">
		<thead>
			<tr>
				<th>Name</th>
				<th>Enabled</th>
				<th>Mode</th>
				<th>Service Context</th>
				<th>Export</th>
			</tr>
		</thead>
		<tbody>
			<xsl:for-each select="dynatrace/systemprofile/transactions/transaction[@subscriptiontype='userdefined']">
				<xsl:choose>
					<xsl:when test="@subscriptiontype='userdefined'">
						<tr>
							<td><xsl:value-of select="@id"/></td>
							<td><xsl:value-of select="@enabled"/></td>
							<td><xsl:value-of select="@mode"/></td>
							<td><xsl:value-of select="@servicecontext"/></td>
							<td><xsl:value-of select="@export"/></td>
						</tr>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</tbody>
	</table>
</div>

<div id="schedule" >
	<h2>Schedule</h2>
	<p>A schedule is used throughout the system profile.  It's used to automate the execution of monitors, reports, ect.</p>
	
	<xsl:choose>
		<xsl:when test="count(dynatrace/systemprofile/schedules/schedule)=0" >
			<p>There are no schedules configured for this application.</p>
		</xsl:when>
		<xsl:otherwise>
			<p>The following <xsl:value-of select="count(dynatrace/systemprofile/schedules/schedule)"/> schedule(s) have been configured for this application.</p>

			<ul>
				<xsl:for-each select="dynatrace/systemprofile/schedules/schedule" >
					<li><xsl:value-of select="@id" /></li>
				</xsl:for-each>
			</ul>
		</xsl:otherwise>
	</xsl:choose>
</div>

<div id="task" >
	<h2>Task</h2>
	<p>A task can be scheduled for repetitive execution on the server or on a connected collector. Arbitrary execution schedules can be defined and shared between different tasks and monitors. On execution, a task gets a set of configuration parameter values, and after execution the task provides an execution status containing data about the execution. dynaTrace provides built-in tasks to automate repeating tasks like generating reports or storing sessions.</p>
	
	<xsl:choose>
		<xsl:when test="count(dynatrace/systemprofile/tasks/task)=0" >
			<p>There are no tasks configured for this application.</p>
		</xsl:when>
		<xsl:otherwise>
			<p>The following <xsl:value-of select="count(dynatrace/systemprofile/tasks/task)"/> task(s) have been configured for this application.</p>

			<ul>
				<xsl:for-each select="dynatrace/systemprofile/tasks/task" >
					<li><xsl:value-of select="@id" /></li>
				</xsl:for-each>
			</ul>
		</xsl:otherwise>
	</xsl:choose>
</div>

<div id="monitors" >
	<h2>Monitors</h2>
	<p>Monitors are scheduled for repetitive execution on a collector. They get configuration parameters and provide an execution status. Additionally, a monitor gets a set of measure subscriptions describing the measurements the monitor has to perform and provides measurement data after execution. With dynaTrace Monitors it is possible to monitor multiple hosts without having to create new Monitors for every host. One master monitor is configured to run on multiple hosts. Therefore at least one target host has to be added to a monitor in the monitor configuration dialog. It is also possible to add specific hostgroups or intersections of hostgroups as targets. Whenever a new host machine is added to a specific hostgroup in the Infrastructure settings, and that hostgroup is a target of a Monitor, the added host is automatically monitored by the Monitor without any extra configuration. For a walkthrough on Multi Host Monitoring see <a href="https://apmcommunity.compuware.com/community/display/DOCDT55/Using+Host+and+Hostgroups+for+Large+System+Monitoring">Using Host and Hostgroups for Large System Monitoring</a>.</p>

	<xsl:choose>
		<xsl:when test="count(dynatrace/systemprofile/mastermonitors/mastermonitor)=0" >
			<p>There are no monitors configured for this application.</p>
		</xsl:when>
		<xsl:otherwise>		
			<p>The following <xsl:value-of select="count(dynatrace/systemprofile/mastermonitors/mastermonitor)"/> monitor(s) have been configured for this application.</p>
			<ul>
				<xsl:for-each select="dynatrace/systemprofile/mastermonitors/mastermonitor" >
					<li><xsl:value-of select="@id" /> is running on <xsl:value-of select="count(mastermonitorconfig/hostexpr/parthostexpr/hostterm)"/> server(s).</li>
				</xsl:for-each>
			</ul>
		</xsl:otherwise>
	</xsl:choose>
</div>

<div id="incidentrules" >
	<h2>Incident Rules</h2>
	<p>After having subscribed to <a href="#measures">measures</a> and configured thresholds for them, incident rules define who and when to notify and how to act on threshold violations.</p>
	<p>An incident rule in dynaTrace can be seen as a mapping between threshold violations of measures and the actions which taken.</p>
	<p>Incident rules can be based on multiple measures and different severity levels of threshold violations to create notifications.
If all the thresholds defined in the incident rule's configuration are violated, this is shown in the Incidents Dashlet, regardless if actions for the incident rule have been defined.</p>
	<p>The following <xsl:value-of select="count(dynatrace/systemprofile/incidentrules/incidentrule)" /> incident rule(s) has been configured for this application.  For more information, please click <a href="https://apmcommunity.compuware.com/community/display/DOCDT55/Incidents+and+Alerting">here</a>.</p>
	<table cellpadding="0" cellspacing="0" border="0" class="display" id="tableIncident">
		<thead>
			<tr>
				<th>Name</th>
				<th>Description</th>
				<th>Sensitivity</th>
			</tr>
		</thead>
		<tbody>
			<xsl:for-each select="dynatrace/systemprofile/incidentrules/incidentrule">
				<tr>
					<td><xsl:value-of select="@id"/></td>
					<td><xsl:value-of select="@description"/></td>
					<td><xsl:value-of select="sensitivity/@id"/></td>
				</tr>
			</xsl:for-each>
		</tbody>
	</table>

</div>

<div id="errors" >
	<h2>Error Detection</h2>
	<p>Error Detection allows alerts to be configured (1) based on overall failing transaction/user action rates as well as the configuration of error detection rules (2) used to specify what is an error and what should be the impact.</p>
	
	<h3>1) Alerts</h3>
	<p>There are two alerts that can be configured directly from the error detection configuration (for more advanced alerts use incidents based on failure measures). These are:</p>
	<ul>
		<li>an alert based on the rate of failed transactions within a certain timeframe</li>
		<li>an alert based on the rate of failed user actions within a certain timeframe</li>
	</ul>
	<p>Both alerts are enabled by default with a timerange of 5 minutes and a threshold of 3%. For the failed transaction alert this means for example that whenever the average rate of failed transaction of a 5 minute interval exceeds 3% an e-mail is sent to the "Incident Email Group".</p>
	<p>This configuration is a shorthand for configuring the according incidents "High Overall Failed Transaction Rate" and "High Overall Failed User Action Rate".</p>
	
	<h3>2) Rules</h3>
	<p>Lists all existing rules that are used to detect errors. If any of the rules apply an error is detected. There a several out-of-the-box rules that can be adapted in any way to match custom requirements. So you can create new rules, delete or change existing rules.</p>
	<p>Error Detection rules are evaluated on data captured on PurePaths. Currently there are four types of error rules:</p>
	<ul>
		<li>HTTP Response Code Rules</li>
		<li>Logging Rules</li>
		<li>Java/.NET Exception Rules</li>
		<li>Browser Error Rules</li>
	</ul>
	<p>A HTTP Response Code Rule is applied to all HTTP responses that are captured, a logging rule to all log statements that are captured and an exception rule to all captured exceptions (and to exceptions that are not captured but happened at a special location - for example on the entry point).</p>
	<p>Furthermore each error detection rule defines the consequences of the detected error. A detected error can have one of the following consequences:</p>
	<ol>
		<li><img src="..\SiteAssets\Auto%20Document\Media\Images\errordetection_error.png" />The detected error is simply detected as error but does not have further consequences</li>
		<li><img src="..\SiteAssets\Auto%20Document\Media\Images\errordetection_error_transaction_failed.png" />The detected error is simply detected as error but does not have further consequences</li>
		<li><img src="..\SiteAssets\Auto%20Document\Media\Images\errordetection_error_pageaction_failed.png" />The detected error is simply detected as error but does not have further consequences</li>
	</ol>
	<p>The following error detection has been configured for this application.  This is a high level overview of the error detection configuration.  Please use the dynaTrace client to get more specific information.  For more information, please click <a href="https://apmcommunity.compuware.com/community/display/DOCDT55/System+Profile+-+Error+Detection">here</a>.</p>
	
	<table cellpadding="0" cellspacing="0" border="0" class="display" id="tableErrors">
		<thead>
			<tr>
				<th>Name</th>
				<th>Error Type</th>
				<th>Impact</th>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>
			<xsl:for-each select="dynatrace/systemprofile/measures/measure">
				<xsl:choose>
					<xsl:when test="@userdefined='false' and @errortype!='none' and @errorseverity!='none'">
						<tr>
						  <td><xsl:value-of select="@id"/></td>
						  <td><xsl:value-of select="@errortype"/></td>
						  <td><xsl:value-of select="@errorseverity"/></td>
						  <td><xsl:value-of select="@description"/></td>
						</tr>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</tbody>
	</table>
</div>

<div id="application" >
	<h2>Applications</h2>
	<p>The Application concept allows you to manage more than one logical application within a single System Profile. If you for instance host your public website, customer portal and blog on the same servers you still want to monitor and manage performance of these transactions individually. </p>
	<xsl:choose>
		<xsl:when test="count(dynatrace/systemprofile/uemconfiguration/applications/application)=0" >
			<p>There are no applications defined for this application.</p>
		</xsl:when>
		<xsl:otherwise>
			<p>The following <xsl:value-of select="count(dynatrace/systemprofile/uemconfiguration/applications/application)"/> application(s) have been defined for this application.</p>

			<xsl:for-each select="dynatrace/systemprofile/uemconfiguration/applications/application" >
				<p><xsl:value-of select="@name" /> is applied if the URI:</p>
				<ul>
					<xsl:for-each select="uripatterns/uripattern" >
						<xsl:choose>
							<xsl:when test="@match='starts'" >
								<li><xsl:text>starts with &quot;</xsl:text><xsl:value-of select="@pattern" /><xsl:text>&quot;</xsl:text></li>
							</xsl:when>
							<xsl:when test="@match='ends'" >
								<li><xsl:text>ends with &quot;</xsl:text><xsl:value-of select="@pattern" /><xsl:text>&quot;</xsl:text></li>
							</xsl:when>
							<xsl:otherwise>
								<li><xsl:value-of select="@match" /><xsl:text> &quot;</xsl:text><xsl:value-of select="@pattern" /><xsl:text>&quot;</xsl:text></li>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</ul>
			</xsl:for-each>
			
		</xsl:otherwise>
	</xsl:choose>
</div>


</body>
</html>
</xsl:template>

<xsl:template name="doWhile">
    <xsl:param name="sensorText" />
	<xsl:choose>
		<xsl:when test="contains($sensorText,'.')">
			<xsl:call-template name="doWhile">
				<xsl:with-param name="sensorText" select="substring-after($sensorText,'.')" />
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<li><xsl:value-of select="$sensorText" /></li>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>