function _OnInit()
GameVersion = 0
end

function GetVersion() --Define anchor addresses
if (GAME_ID == 0xF266B00B or GAME_ID == 0xFAF99301) and ENGINE_TYPE == "ENGINE" then --PCSX2
	GameVersion = 1
	print('GoA PS2 Version')
	Now = 0x032BAE0 --Current Location
	Sve = 0x1D5A970 --Saved Location
	Save = 0x032BB30 --Save File
	Obj0Pointer = 0x1D5BA10 --00objentry.bin Pointer Address
	Sys3Pointer = 0x1C61AF8 --03system.bin Pointer Address
	Btl0Pointer = 0x1C61AFC --00battle.bin Pointer Address
	ARDPointer  = 0x034ECF4 --ARD Pointer Address
	Music = 0x0347D34 --Background Music
	Pause = 0x0347E08 --Ability to Pause
	React = 0x1C5FF4E --Reaction Command
	Cntrl = 0x1D48DB8 --Sora Controllable
	Timer = 0x0349DE8
	Songs = 0x035DAC4 --Atlantica Stuff
	GScre = 0x1F8039C --Gummi Score
	GMdal = 0x1F803C0 --Gummi Medal
	GKill = 0x1F80856 --Gummi Kills
	CamTyp = 0x0348750 --Camera Type
	GamSpd = 0x0349E0C --Game Speed
	CutNow = 0x035DE20 --Cutscene Timer
	CutLen = 0x035DE28 --Cutscene Length
	CutSkp = 0x035DE08 --Cutscene Skip
	BtlTyp = 0x1C61958 --Battle Status (Out-of-Battle, Regular, Forced)
	BtlEnd = 0x1D490C0 --End-of-Battle camera & signal
	TxtBox = 0x1D48D54 --Last Displayed Textbox
	DemCln = 0x1D48DEC --Demyx Clone Status (might have to do with other mission status/signal?)
	Slot1    = 0x1C6C750 --Unit Slot 1
	NextSlot = 0x268
	Point1   = 0x1D48EFC
	NxtPoint = 0x38
	Gauge1   = 0x1D48FA4
	NxtGauge = 0x34
	Menu1    = 0x1C5FF18 --Menu 1 (main command menu)
	NextMenu = 0x4
	Obj0 = ReadInt(Obj0Pointer)
	Sys3 = ReadInt(Sys3Pointer)
	Btl0 = ReadInt(Btl0Pointer)
	MSN = 0x04FA440
elseif GAME_ID == 0x431219CC and ENGINE_TYPE == 'BACKEND' then --PC
	if ReadString(0x9A9330,4) == 'KH2J' then --EGS
		GameVersion = 2
		print('GoA Epic Version')
		Now = 0x0716DF8
		Sve = 0x2A0BFC0
		Save = 0x09A9330
		Obj0Pointer = 0x2A24AB0
		Sys3Pointer = 0x2AE58D0
		Btl0Pointer = 0x2AE58D8
		ARDPointer = 0x2A0F2A8
		Music = 0x0ABA7C4
		Pause = 0x0ABB2F8
		React = 0x2A10BE2
		Cntrl = 0x2A16C68
		Timer = 0x0ABB2D0
		Songs = 0x0B657F4
		GScre = 0x072AEB0
		GMdal = 0x072B044
		GKill = 0x0AF6BC6
		CamTyp = 0x0718A98
		GamSpd = 0x0717214
		CutNow = 0x0B64A18
		CutLen = 0x0B64A34
		CutSkp = 0x0B64A1C
		BtlTyp = 0x2A10E84
		BtlEnd = 0x2A0F760
		TxtBox = 0x074DCB0
		DemCln = 0x2A0F334
		Slot1    = 0x2A23018
		NextSlot = 0x278
		Point1   = 0x2A0F4C8
		NxtPoint = 0x50
		Gauge1   = 0x2A0F5B8
		NxtGauge = 0x48
		Menu1    = 0x2A10B90
		NextMenu = 0x8
		Obj0 = ReadLong(Obj0Pointer)
		Sys3 = ReadLong(Sys3Pointer)
		Btl0 = ReadLong(Btl0Pointer)
		MSN = 0x0BF2C80
	elseif ReadString(0x9A98B0,4) == 'KH2J' then --Steam Global
		GameVersion = 3
		print('GoA Steam Global Version')
		Now = 0x0717008
		Sve = 0x2A0C540
		Save = 0x09A98B0
		Obj0Pointer = 0x2A25030
		Sys3Pointer = 0x2AE5E50
		Btl0Pointer = 0x2AE5E58
		ARDPointer = 0x2A0F828
		Music = 0x0ABAD44
		Pause = 0x0ABB878
		React = 0x2A11162
		Cntrl = 0x2A171E8
		Timer = 0x0ABB850
		Songs = 0x0B65D44
		GScre = 0x072B130
		GMdal = 0x072B2C4
		GKill = 0x0AF7146
		CamTyp = 0x0718CA8
		GamSpd = 0x0717424
		CutNow = 0x0B64F98
		CutLen = 0x0B64FB4
		CutSkp = 0x0B64F9C
		BtlTyp = 0x2A11404
		BtlEnd = 0x2A0FCE0
		TxtBox = 0x074DF20
		DemCln = 0x2A0F8B4
		Slot1    = 0x2A23598
		NextSlot = 0x278
		Point1   = 0x2A0FA48
		NxtPoint = 0x50
		Gauge1   = 0x2A0FB38
		NxtGauge = 0x48
		Menu1    = 0x2A11110
		NextMenu = 0x8
		Obj0 = ReadLong(Obj0Pointer)
		Sys3 = ReadLong(Sys3Pointer)
		Btl0 = ReadLong(Btl0Pointer)
		MSN = 0x0BF33C0
	elseif ReadString(0x9A98B0,4) == 'KH2J' then --Steam JP (same as Global for now)
		GameVersion = 4
		print('GoA Steam JP Version')
		Now = 0x0717008
		Sve = 0x2A0C540
		Save = 0x09A98B0
		Obj0Pointer = 0x2A25030
		Sys3Pointer = 0x2AE5E50
		Btl0Pointer = 0x2AE5E58
		ARDPointer = 0x2A0F828
		Music = 0x0ABAD44
		Pause = 0x0ABB878
		React = 0x2A11162
		Cntrl = 0x2A171E8
		Timer = 0x0ABB850
		Songs = 0x0B65D74
		GScre = 0x072B130
		GMdal = 0x072B2C4
		GKill = 0x0AF7146
		CamTyp = 0x0718CA8
		GamSpd = 0x0717424
		CutNow = 0x0B64F98
		CutLen = 0x0B64FB4
		CutSkp = 0x0B64F9C
		BtlTyp = 0x2A11404
		BtlEnd = 0x2A0FCE0
		TxtBox = 0x074DF20
		DemCln = 0x2A0F8B4
		Slot1    = 0x2A23598
		NextSlot = 0x278
		Point1   = 0x2A0FA48
		NxtPoint = 0x50
		Gauge1   = 0x2A0FB38
		NxtGauge = 0x48
		Menu1    = 0x2A11110
		NextMenu = 0x8
		Obj0 = ReadLong(Obj0Pointer)
		Sys3 = ReadLong(Sys3Pointer)
		Btl0 = ReadLong(Btl0Pointer)
		MSN = 0x0BF33C0
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
if GameVersion ~= 0 then
	--[[Slot2  = Slot1 - NextSlot
	Slot3  = Slot2 - NextSlot
	Slot4  = Slot3 - NextSlot
	Slot5  = Slot4 - NextSlot
	Slot6  = Slot5 - NextSlot
	Slot7  = Slot6 - NextSlot
	Slot8  = Slot7 - NextSlot
	Slot9  = Slot8 - NextSlot
	Slot10 = Slot9 - NextSlot
	Slot11 = Slot10 - NextSlot
	Slot12 = Slot11 - NextSlot
	Point2 = Point1 + NxtPoint
	Point3 = Point2 + NxtPoint
	Gauge2 = Gauge1 + NxtGauge
	Gauge3 = Gauge2 + NxtGauge--]]
	Menu2  = Menu1 + NextMenu
	--Menu3  = Menu2 + NextMenu
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