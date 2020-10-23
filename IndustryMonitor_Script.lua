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