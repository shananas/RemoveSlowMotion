function _OnInit()
GameVersion = 0
end

function GetVersion() --Define anchor addresses
if (GAME_ID == 0xF266B00B or GAME_ID == 0xFAF99301) and ENGINE_TYPE == "ENGINE" then --PCSX2
	GameVersion = 1
	print('Remove Slow Motion PS2 Version')
	GamSpd = 0x0349E0C --Game Speed
elseif GAME_ID == 0x431219CC and ENGINE_TYPE == 'BACKEND' then --PC
	if ReadString(0x9A9330,4) == 'KH2J' then --EGS
		GameVersion = 2
		print('Remove Slow Motion Epic Version')
		GamSpd = 0x0717214
	elseif ReadString(0x9A98B0,4) == 'KH2J' then --Steam Global
		GameVersion = 3
		print('Remove Slow Motion Steam Global Version')
		GamSpd = 0x0717424
	elseif ReadString(0x9A98B0,4) == 'KH2J' then --Steam JP (same as Global for now)
		GameVersion = 4
		print('Remove Slow Motion Steam JP Version')
		GamSpd = 0x0717424
	elseif ReadString(0x9A7070,4) == "KH2J" or ReadString(0x9A70B0,4) == "KH2J" or ReadString(0x9A92F0,4) == "KH2J" then
		GameVersion = -1
		print("Epic Version is outdated. Please update the game.")
	elseif ReadString(0x9A9830,4) == "KH2J" then
		GameVersion = -1
		print("Steam Global Version is outdated. Please update the game.")
	elseif ReadString(0x9A8830,4) == "KH2J" then
		GameVersion = -1
		print("Steam JP Version is outdated. Please update the game.")
	end
end
end


function _OnFrame()
if GameVersion == 0 then --Get anchor addresses
	GetVersion()
	return
elseif GameVersion < 0 then --Incompatible version
	return
end
if GameVersion ~= 0 then
	if ReadFloat(GamSpd) < 1 then
		WriteFloat(GamSpd,2) --Faster Speed
	end
end
end
