--[[
Copyright (C) Maverick1305, 2023

Author: Maverick1305
Date: 11.02.2023
Version: 0.3.0.1

Contact:
https://discord.gg/Va7JNnEkcW

History:
V 0.1.0.0 @ 28.07.2022 - Initial Versoin

Important:
No copy and use in own mods allowed.

Das verändern und wiederöffentlichen, auch in Teilen, ist untersagt und wird abgemahnt.
]]

AutoloaderExtensionStrawHarvest = {}


---
function AutoloaderExtensionStrawHarvest:AddSupportedObjects(superFunc, autoLoadObject, name)
-- print("AutoloaderExtensionStrawHarvest:AddSupportedObjects");
	-- call for default types
	superFunc(self, autoLoadObject, name)
	
	-- add check method and size for every additional type
	if (name == "strawPallets") then
		local function CheckType(object)
			if object.configFileName ~= nil and string.find(object.configFileName, "FS22_strawHarvestPack") then return true end
			
			return false;
		end
		autoLoadObject.CheckTypeMethod = CheckType

		AutoloaderExtensionStrawHarvest:fillAutoLoadObject(autoLoadObject, 1.5, 1.3, 1, "pallet", "fillType_strawPellets", false, true)
	end
	
end
FS22_aPalletAutoLoader.APalletAutoLoader.AddSupportedObjects = Utils.overwrittenFunction(FS22_aPalletAutoLoader.APalletAutoLoader.AddSupportedObjects, AutoloaderExtensionStrawHarvest.AddSupportedObjects)

function AutoloaderExtensionStrawHarvest:fillAutoLoadObject(autoLoadObject, sizeX, sizeY, sizeZ, type, shopName, withVehicleTrigger, stackable)
		autoLoadObject.sizeX = sizeX
		autoLoadObject.sizeY = sizeY
		autoLoadObject.sizeZ = sizeZ
		autoLoadObject.type = type
		autoLoadObject.nameTranslated = g_i18n:getText(shopName, "FS22_strawHarvestPack")
		if withVehicleTrigger then
			autoLoadObject.pickupTriggerCollisionMask = CollisionFlag.TRIGGER_VEHICLE;
		end
		autoLoadObject.stackable = stackable;
end


function AutoloaderExtensionStrawHarvest:CreateAvailableTypeList(superFunc)
-- print("AutoloaderExtensionStrawHarvest:AddSupportedObjects");
	-- get default list
	local types = superFunc(self)
	
	-- local types = {};
	-- add additional types
	table.insert(types, "strawPallets");
	
	return types;
end

FS22_aPalletAutoLoader.APalletAutoLoader.CreateAvailableTypeList = Utils.overwrittenFunction(FS22_aPalletAutoLoader.APalletAutoLoader.CreateAvailableTypeList, AutoloaderExtensionStrawHarvest.CreateAvailableTypeList)