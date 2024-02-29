ChangeFillTypeManager = {}

function ChangeFillTypeManager:loadFillTypes(superFunc, xmlFile, baseDirectory, isBaseType, customEnv)

	if customEnv == "FS22_strawHarvestPack" then
	-- print("ChangeFillTypeManager:loadFillTypes: ");
	-- print(customEnv);
	
		xmlFile:setValue("map.fillTypes.fillType(0).pallet#filename", "data/objects/pallets/krone/twinePallets/baleTwinePallet.xml")
		xmlFile:setValue("map.fillTypes.fillType(1).pallet#filename", "data/objects/pallets/krone/netPallets/netRolePallet.xml")
		xmlFile:setValue("map.fillTypes.fillType(2).pallet#filename", "data/objects/pallets/canisterPallet/canisterPallet.xml")
		xmlFile:setValue("map.fillTypes.fillType(3).pallet#filename", "data/objects/pallets/pelletPallets/hayPelletsPallet.xml")
		xmlFile:setValue("map.fillTypes.fillType(4).pallet#filename", "data/objects/pallets/pelletPallets/strawPelletsPallet.xml")
		
		xmlFile:setValue("map.fillTypeCategories.fillTypeCategory(6)#name", "PRODUCT")
		xmlFile:setValue("map.fillTypeCategories.fillTypeCategory(6)", "HAY_PELLETS STRAW_PELLETS")
	end

	return superFunc(self, xmlFile, baseDirectory, isBaseType, customEnv) 
end


FillTypeManager.loadFillTypes = Utils.overwrittenFunction(FillTypeManager.loadFillTypes, ChangeFillTypeManager.loadFillTypes)