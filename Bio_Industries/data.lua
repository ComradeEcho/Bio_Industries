
if not BI_Config then BI_Config = {} end
if not BI_Config.mod then BI_Config.mod = {} end
if not BI_Functions then BI_Functions = {} end

if not bobmods then bobmods = {} end
if not bobmods.lib then bobmods.lib = {} end


--- Help Files
require ("scripts.detectmod") --Detect supported Mods, currently DyTechWar and Bob's Enemies and others
require ("scripts.item-functions") -- From Bob's Libary 
require ("scripts.recipe-functions") -- From Bob's Libary 
require ("scripts.technology-functions") -- From Bob's Libary 
require ("scripts.NE_Functions")
require ("config")

--- Bio Farm
if BI_Config.Bio_Farm then

	require("prototypes.Bio_Farm.entities")
	require("prototypes.Bio_Farm.item")
	require("prototypes.Bio_Farm.recipe")
	require("prototypes.Bio_Farm.liquids")
	require("prototypes.Bio_Farm.recipe-categories")
	require("prototypes.Bio_Farm.pipeConnectors")
	require("prototypes.Bio_Farm.technology")

end


--- Bio Solar Farm
if BI_Config.Bio_Solar_Farm then

	require("prototypes.Bio_Solar_Farm.entities")
	require("prototypes.Bio_Solar_Farm.item")
	require("prototypes.Bio_Solar_Farm.recipe")

end

-- Bio Garden
if BI_Config.Bio_Garden then

	require("prototypes.Bio_Garden.entities")
	require("prototypes.Bio_Garden.item")
	require("prototypes.Bio_Garden.recipe")
	require("prototypes.Bio_Garden.recipe-categories")
	bobmods.lib.add_technology_recipe ("bi-fertiliser", "bi-Bio_Garden")
	bobmods.lib.add_technology_recipe ("bi-fertiliser", "bi-Clean_Air")
	
end

if BI_Config.Bio_Cannon then
	-- Items Groups
	require("prototypes.Bio_Cannon.item-group")

	-- Cannon
	require("prototypes.Bio_Cannon.item")
	require("prototypes.Bio_Cannon.recipe")
	require("prototypes.Bio_Cannon.entity")
	require("prototypes.Bio_Cannon.technology")

	-- Projectiles
	require("prototypes.Bio_Cannon.projectiles-item")
	require("prototypes.Bio_Cannon.projectiles-recipe")
	require("prototypes.Bio_Cannon.projectiles-entity")
end

--- Wood Products
if BI_Config.Wood_Products then

	require("prototypes.Wood_Products.entities")
	require("prototypes.Wood_Products.item")
	require("prototypes.Wood_Products.recipe")

end



