
--- Help Files
require ("scripts.detectmod") --Detect supported Mods, currently DyTechWar and Bob's Enemies and others
require ("scripts.item-functions") -- From Bob's Libary 
require ("scripts.recipe-functions") -- From Bob's Libary 
require ("scripts.technology-functions") -- From Bob's Libary 
require ("config")

---- Inrease Wood Stack Size
data.raw.item["raw-wood"].stack_size = 400


--- Got tierd of reaching limits...
if BI_Config.QCCode then
	if data.raw.player.player.build_distance < 24 then
		data.raw.player.player.build_distance = 24
		data.raw.player.player.reach_distance = 20
		data.raw.player.player.reach_resource_distance = 20
		data.raw.player.player.drop_item_distance = 20
	end 
end


if BI_Config.Wood_Products then
	--- Wood Floors
	data.raw.item["wood"].place_as_tile =
	{
		result = "bi-wood-floor",
		condition_size = 4,
		condition = { "water-tile" }
	}
	bobmods.lib.add_technology_recipe ("logistics", "bi-big-wooden-pole")
	
	---- Update Rails 
	require("prototypes.Wood_Products.demo-railpictures-concrete")
	
	-- vanilla rail recipe update
	bobmods.lib.add_new_recipe_item ("rail", {type="item", name="concrete", amount=8})
	

	-- vanilla rail icon & images update
	data.raw["straight-rail"]["straight-rail"].pictures = railpictures_c()
	data.raw["curved-rail"]["curved-rail"].pictures = railpictures_c()
	data.raw["straight-rail"]["straight-rail"].icon = "__Bio_Industries__/graphics/icons/straight-rail-concrete.png"
	data.raw["curved-rail"]["curved-rail"].icon = "__Bio_Industries__/graphics/icons/curved-rail-concrete.png"
	data.raw["rail-planner"]["rail"].icon = "__Bio_Industries__/graphics/icons/rail-concrete.png"

	--- Wood Rail added to Tech 
	bobmods.lib.add_technology_recipe ("railway", "bi-rail-wood")
	
	--- If Bob, move Vanilla Rail to Rail 2.
	if data.raw.technology["bob-railway-2"] then
		bobmods.lib.remove_technology_recipe ("railway", "rail")
		bobmods.lib.add_technology_recipe ("bob-railway-2", "rail")
	end	
	
end



--- Adds Solar Farm to solar-energy Tech
if BI_Config.Bio_Solar_Farm then
	if data.raw.technology["bob-solar-energy-2"] then
		bobmods.lib.add_technology_recipe ("bob-solar-energy-2", "bi_bio_Solar_Farm")
		bobmods.lib.replace_recipe_item("bi_bio_Solar_Farm", "solar-panel", "solar-panel-large")
		
	else
		bobmods.lib.add_technology_recipe ("solar-energy", "bi_bio_Solar_Farm")
	end	
end

	
if BI_Config.Bio_Farm then	
	--- Changes fertiliser recipes if bob's
	if data.raw.item["sodium-hydroxide"] then
		bobmods.lib.remove_recipe_item ("bi-fertiliser", "sulfur")
		bobmods.lib.add_new_recipe_item ("bi-fertiliser", {type="item", name="sodium-hydroxide", amount=10})
	end	
	
	
	--- Make Bio Farm use glass if Bob's
	if data.raw.item.glass  then
		bobmods.lib.replace_recipe_item("bi_bio_farm", "copper-cable", "glass")
	end
	
	------- Adds a Mk3 recipe for wood if you're playing with Natural Evolution Buildings
	if BI_Config.mod.NEBuildings then
		require("prototypes.Bio_Farm.technology2")
		bobmods.lib.add_new_recipe_item ("bi-Logs_Mk3", {type="item", name="bi-adv-fertiliser", amount=5})
		bobmods.lib.add_new_recipe_item ("bi-adv-fertiliser", {type="fluid", name="NE_enhanced-nutrient-solution", amount=50})

		--- Adds Clean Air 2 recipe - Using Advanced fertiliser
		if BI_Config.Bio_Garden then
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-Clean_Air2")
			table.insert(data.raw.recipe["bi-Clean_Air2"].ingredients,{type="item", name="bi-adv-fertiliser", amount=1})
		end
		
	---- Add Bio Fuel & Plastic
		if BI_Config.Bio_Fuel then 
			require("prototypes.Bio_Fuel.fluid")
			require("prototypes.Bio_Fuel.recipe")
			require("prototypes.Bio_Fuel.technology")
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-bioreactor")
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-liquid-co2")
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-cellulose")
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-biomass-0")
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-Bio_Fuel")
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-Fuel_Conversion")
			bobmods.lib.add_new_recipe_item ("bi-Bio_Fuel", {type="fluid", name="NE_revitalization-solution", amount=10})
		end
		
	end


	------- DyTech Support
	if BI_Config.mod.DyTechCore then

	require("prototypes.Bio_Farm.dytech_recipe")
		
		bobmods.lib.add_technology_recipe ("bi_bio_farming", "bi-resin")
		bobmods.lib.add_technology_recipe ("bi-fertiliser", "bi-resin_Mk2")
		bobmods.lib.add_technology_recipe ("bi_bio_farming", "bi-sulfur-wood")
		bobmods.lib.add_technology_recipe ("bi-fertiliser", "bi-sulfur-wood_Mk2")

		
		--- If you're using NE Buildings, add an advanced recipe
		if BI_Config.mod.NEBuildings then
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-resin_Mk3")
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-sulfur-wood_Mk3")
			bobmods.lib.add_new_recipe_item ("bi-resin_Mk3", {type="item", name="bi-adv-fertiliser", amount=5})
			bobmods.lib.add_new_recipe_item ("bi-sulfur-wood_Mk3", {type="item", name="bi-adv-fertiliser", amount=5})

		end

	end

end



if BI_Config.Bio_Cannon then
	------- Adds a Biological Hive Buster Ammo
	if BI_Config.mod.NEEnemies then

	-- Add Bio Projectile
		require("prototypes.Bio_Cannon.bio-projectile")
		bobmods.lib.add_technology_recipe ("Bio_Cannon", "Bio_Cannon_Bio_Ammo")
		data.raw.recipe["Bio_Cannon_Bio_Ammo"].category = "crafting-with-fluid"
		bobmods.lib.remove_recipe_item ("Bio_Cannon_Bio_Ammo", "alien-artifact")
		bobmods.lib.add_new_recipe_item ("Bio_Cannon_Bio_Ammo", {type="fluid", name="NE_alien_toxin", amount=50})
		
	end

	------- Changes Hive Buster Recipe
	if BI_Config.mod.NEBuildings then

		bobmods.lib.remove_recipe_item ("Bio_Cannon", "advanced-circuit")
		bobmods.lib.remove_recipe_item ("Bio_Cannon", "steel-plate")
		bobmods.lib.add_new_recipe_item ("Bio_Cannon", {type="item", name="Building_Materials", amount=30})

	end
end

------------ Changing order/sorting
if data.raw["item"]["solar-panel-large-3"] then 
	if BI_Config.Bio_Solar_Farm then
		data.raw["item"]["bi_bio_Solar_Farm"].subgroup = "bob-energy-solar-panel"
		data.raw["item"]["bi_bio_Solar_Farm"].order="d[solar-panel]-x[bi_bio_Solar_Farm]"	
		data.raw["item"]["bi_bio_Solar_Farm_Image"].subgroup = "bob-energy-solar-panel"
		data.raw["item"]["bi_bio_Solar_Farm_Image"].order="d[solar-panel]-x[bi_bio_Solar_Farm]"
	end
end

if data.raw["item-subgroup"]["bob-fluid"] then 
	if BI_Config.Bio_Fuel then
		data.raw["recipe"]["bi-Bio_Fuel"].subgroup = "bob-fluid"
		data.raw["recipe"]["bi-Bio_Fuel"].order = "b[fluid-chemistry]-a[coal-cracking]-z[bi-Bio_Fuel]"	
		data.raw["recipe"]["bi-Fuel_Conversion"].subgroup = "bob-fluid"
		data.raw["recipe"]["bi-Fuel_Conversion"].order = "b[fluid-chemistry]-a[coal-cracking]-y[bi-Fuel_Conversion]"
		data.raw["recipe"]["bi-platic"].subgroup = "bob-resource-chemical"
		data.raw["recipe"]["bi-platic"].order = "g[plastic-bar]"
		data.raw["recipe"]["bi-cellulose"].subgroup = "bob-resource-chemical"
		data.raw["recipe"]["bi-cellulose"].order = "g[plastic-bar]"
	end
end

if data.raw["item-subgroup"]["bob-material"] then 
	if BI_Config.Bio_Farm then
		data.raw["recipe"]["bi-charcoal"].subgroup = "bob-material"
		data.raw["recipe"]["bi-charcoal-2"].subgroup = "bob-material"
		data.raw["recipe"]["bi-coal"].subgroup = "bob-material"
		data.raw["recipe"]["bi-coal-2"].subgroup = "bob-material"
		data.raw["recipe"]["bi-coke-coal"].subgroup = "bob-material"
		data.raw["recipe"]["bi-ash"].subgroup = "bob-material"
		data.raw["recipe"]["bi-ash-2"].subgroup = "bob-material"
		data.raw["recipe"]["bi-crushed-stone"].subgroup = "bob-material"
	end	
end

	