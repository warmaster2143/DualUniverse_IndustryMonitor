# DualUniverse_IndustryMonitor

This Lua Script will help you to display the status of your Industry onto a screen

Tutorial: https://youtu.be/BQ984T8LGxg

# Elements required

- 1 Screen M
- 1 Programing Board

# Programing Board Quick Setup
```ruby
{"slots":{"0":{"name":"screen","type":{"events":[],"methods":[]}},"1":{"name":"Electronics_Industry","type":{"events":[],"methods":[]}},"2":{"name":"Chemical_Industry","type":{"events":[],"methods":[]}},"3":{"name":"Smelter","type":{"events":[],"methods":[]}},"4":{"name":"slot5","type":{"events":[],"methods":[]}},"5":{"name":"slot6","type":{"events":[],"methods":[]}},"6":{"name":"slot7","type":{"events":[],"methods":[]}},"7":{"name":"slot8","type":{"events":[],"methods":[]}},"8":{"name":"slot9","type":{"events":[],"methods":[]}},"9":{"name":"slot10","type":{"events":[],"methods":[]}},"-1":{"name":"unit","type":{"events":[],"methods":[]}},"-2":{"name":"system","type":{"events":[],"methods":[]}},"-3":{"name":"library","type":{"events":[],"methods":[]}}},"handlers":[{"code":"-- Turn Off Screen\n\nscreen.deactivate()","filter":{"args":[],"signature":"stop()","slotKey":"-1"},"key":"0"},{"code":"function startTimer(name,seconds) \n    unit.setTimer(name,seconds)  \nend\n\nfunction stopTimer(name)\n    unit.stopTimer(name)\nend\n\n-- Start Timer\n\nstartTimer(\"screen\", 1)\n\n-- Turn On Screen\n\nscreen.activate()","filter":{"args":[],"signature":"start()","slotKey":"-1"},"key":"1"},{"code":"--[[ FUNCTIONS ]]--\n\nfunction round(number,decimals)\n    local power = 100^decimals\n    return math.floor((number/10000) * power)\nend\n\n--[[ EXPORTED VARIABLES ]]--\n\nlocal tableName = \"Machine Status\" --export:\nlocal tableNameFontsize = \"15em\" --export:\nlocal tableFontSize = \"20px\" --export:\nlocal tableWidth = \"100%\" --export:\nlocal tableHeight = \"100%\" --export:\nlocal BGColor = \"#252525\" --export: This sets the screen background color\n\n--[[ Electronics Industry ]]--\n\nlocal EI_Status = Electronics_Industry.getStatus()\nlocal EI_Efficiency = round(math.ceil(Electronics_Industry.getEfficiency()),3)\n\n--[[ Chemical Industry ]]--\n\nlocal CI_Status = Chemical_Industry.getStatus()\nlocal CI_Efficiency = round(math.ceil(Chemical_Industry.getEfficiency()),3)\n\n--[[ Smelter ]]--\n\nlocal Smelter_Status = Smelter.getStatus()\nlocal Smelter_Efficiency = round(math.ceil(Smelter.getEfficiency()),3)\n\n--[[ HTML CODE STARTS HERE ]]--\n\nhtml = [[\n<body>\n\n<div class=\"bootstrap\">\n<table\n\t<tr style=\"\n\t\twidth: 100%;\n\t\tcolor: white;\n\t\">\n\t<th>]]..tableName..[[</th>\n\n\t<tr style=\"\n\t\twidth: 100%;\n\t\tmargin-bottom: 25px;\n\t\tbackground-color: white;\n\t\tcolor: black;\n\t\">\n\t\t<th>Machine</th>\n\t\t<th>Efficiency</th>\n\t\t<th>Status</th>\n\t<tr>\n\t\t<th>Electronics Industry</th>\n\t\t<th>]]..EI_Efficiency..[[%</th>\n\t\t<th>]]..EI_Status..[[</th>\n\t</tr>\n\t<tr>\n\t\t<th>Chemical Industry</th>\n\t\t<th>]]..CI_Efficiency..[[%</th>\n\t\t<th>]]..CI_Status..[[</th>\n\t</tr>\n\t<tr>\n\t\t<th>Smelter</th>\n\t\t<th>]]..Smelter_Efficiency..[[%</th>\n\t\t<th>]]..Smelter_Status..[[</th>\n\t</tr>\n\n</table>\n\n<style>\nbody {\n\tbackground-color: ]]..BGColor..[[;\n}\nh1 {\n  \tfont-size: ]]..tableNameFontsize..[[;\n}\ntable {\n  \twidth: ]]..tableWidth..[[;\n\theight: ]]..tableHeight..[[;\n}\ntable, th, td {\n  \tborder: 0.5px solid white;\n  \tborder-collapse: collapse;\n}\nth, td {\n  \tpadding: 10px;\n  \ttext-align: center;\n\tfont-size: ]]..tableFontSize..[[;\n}\n\n</style>\n\n</div>\n\n</body>\n\n]]\n\n--[[ HTML CODE ENDS HERE ]]--\n\nscreen.setHTML(html)","filter":{"args":[{"value":"screen"}],"signature":"tick(timerId)","slotKey":"-1"},"key":"2"}],"methods":[],"events":[]}
```

```ruby
--[[ FUNCTIONS ]]--

function round(number,decimals)
    local power = 100^decimals
    return math.floor((number/10000) * power)
end

--[[ EXPORTED VARIABLES ]]--

local tableName = "Machine Status" --export:
local tableNameFontsize = "15em" --export:
local tableFontSize = "20px" --export:
local tableWidth = "100%" --export:
local tableHeight = "100%" --export:
local BGColor = "#252525" --export: This sets the screen background color

--[[ Electronics Industry ]]--

local EI_Status = Electronics_Industry.getStatus()
local EI_Efficiency = round(math.ceil(Electronics_Industry.getEfficiency()),3)

--[[ Chemical Industry ]]--

local CI_Status = Chemical_Industry.getStatus()
local CI_Efficiency = round(math.ceil(Chemical_Industry.getEfficiency()),3)

--[[ Smelter ]]--

local Smelter_Status = Smelter.getStatus()
local Smelter_Efficiency = round(math.ceil(Smelter.getEfficiency()),3)

--[[ HTML CODE STARTS HERE ]]--

html = [[
<body>

<div class="bootstrap">
<table
	<tr style="
		width: 100%;
		color: white;
	">
	<th>]]..tableName..[[</th>

	<tr style="
		width: 100%;
		margin-bottom: 25px;
		background-color: white;
		color: black;
	">
		<th>Machine</th>
		<th>Efficiency</th>
		<th>Status</th>
	<tr>
		<th>Electronics Industry</th>
		<th>]]..EI_Efficiency..[[%</th>
		<th>]]..EI_Status..[[</th>
	</tr>
	<tr>
		<th>Chemical Industry</th>
		<th>]]..CI_Efficiency..[[%</th>
		<th>]]..CI_Status..[[</th>
	</tr>
	<tr>
		<th>Smelter</th>
		<th>]]..Smelter_Efficiency..[[%</th>
		<th>]]..Smelter_Status..[[</th>
	</tr>

</table>

<style>
body {
	background-color: ]]..BGColor..[[;
}
h1 {
  	font-size: ]]..tableNameFontsize..[[;
}
table {
  	width: ]]..tableWidth..[[;
	height: ]]..tableHeight..[[;
}
table, th, td {
  	border: 0.5px solid white;
  	border-collapse: collapse;
}
th, td {
  	padding: 10px;
  	text-align: center;
	font-size: ]]..tableFontSize..[[;
}

</style>

</div>

</body>

]]

--[[ HTML CODE ENDS HERE ]]--

screen.setHTML(html)
```
