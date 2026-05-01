local function CanProvideCodeFunc(self, code)
	return code == self.Name
end

local function ProvidesCodeFunc(self, code)
	if CanProvideCodeFunc(self, code) then
		return 1
	end
	return 0
end
local function SaveMANUAL_LOCATIONStorageFunc(self)
	return {
		MANUAL_LOCATIONS = self.ItemState.MANUAL_LOCATIONS,
		MANUAL_LOCATIONS_ORDER = self.ItemState.MANUAL_LOCATIONS_ORDER,
		Target = self.ItemState.Target,
		Name = self.Name,
		Icon = self.Icon
	}
end

local function LoadMANUAL_LOCATIONStorageFunc(self, data)
	if data ~= nil and self.Name == data.Name then
		self.ItemState.MANUAL_LOCATIONS = data.MANUAL_LOCATIONS
		self.ItemState.MANUAL_LOCATIONS_ORDER = data.MANUAL_LOCATIONS_ORDER
		self.Icon = ImageReference:FromPackRelativePath(data.Icon)
	end
end

function CreateLuaManualStorageItem(name)
	local self = ScriptHost:CreateLuaItem()
	self.Name = name
	self.Icon = ImageReference:FromPackRelativePath("/images/items/morph_ball.png")
	self.ItemState = {
		MANUAL_LOCATIONS = {
			["default"] = {}
		},
		MANUAL_LOCATIONS_ORDER = {}
	}

	self.CanProvideCodeFunc = CanProvideCodeFunc
	self.OnLeftClickFunc = nil -- your_custom_leftclick_function_here
	self.OnRightClickFunc = nil -- your_custom_rightclick_function_here
	self.OnMiddleClickFunc = nil -- your_custom_middleclick_function_here
	self.ProvidesCodeFunc = ProvidesCodeFunc
	self.SaveFunc = SaveMANUAL_LOCATIONStorageFunc
	self.LoadFunc = LoadMANUAL_LOCATIONStorageFunc
	return self
end