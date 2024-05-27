KethoDoc.LoadOnDemand = {}

-- get framexml data before any loadondemand addons load
KethoDoc.initFrames = KethoDoc:GetFrames()
KethoDoc.initFrameXML = KethoDoc:GetFrameXML()

-- this might throw some blizzard errors
function KethoDoc:LoadLodAddons()
	for _, addon in pairs(self.LoadOnDemand[self.branch]) do
		--local name, _, _, _, reason = GetAddOnInfo(addon)
		--Spew("", reason, name)
		UIParentLoadAddOn(addon)
	end
end

local function FilterFlavor(t, flavor)
	for k, v in pairs(t) do
		if v:find(flavor.."$") then
			t[k] = nil
		end
	end
end

local function TrimFlavor(t, flavor)
	for k, v in pairs(t) do
		if v:find(flavor.."$") then
			t[k] = v:gsub(flavor, "")
		end
	end
end

-- 10.2.7
KethoDoc.LoadOnDemand.mainline = {
	-- "Blizzard_AccountSaveUI", -- Wrong active UI
	"Blizzard_AchievementUI_Mainline",
	"Blizzard_AdventureMap",
	"Blizzard_AlliedRacesUI",
	"Blizzard_AnimaDiversionUI",
	"Blizzard_APIDocumentation",
	"Blizzard_APIDocumentationGenerated",
	"Blizzard_ArchaeologyUI_Mainline",
	"Blizzard_ArdenwealdGardening",
	"Blizzard_ArtifactUI",
	"Blizzard_AuctionHouseShared",
	"Blizzard_AuctionHouseUI",
	"Blizzard_AzeriteEssenceUI",
	"Blizzard_AzeriteRespecUI",
	"Blizzard_AzeriteUI",
	"Blizzard_BarberShopUI",
	"Blizzard_BattlefieldMap",
	"Blizzard_BehavioralMessaging",
	"Blizzard_BlackMarketUI",
	"Blizzard_BoostTutorial",
	"Blizzard_Calendar_Mainline",
	"Blizzard_ChallengesUI",
	"Blizzard_CharacterCustomize",
	"Blizzard_ChromieTimeUI",
	"Blizzard_ClassTalentUI",
	"Blizzard_ClassTrial",
	"Blizzard_ClickBindingUI",
	"Blizzard_Collections",
	"Blizzard_Collections_Classic",
	"Blizzard_CombatLog_Mainline",
	"Blizzard_CombatText",
	"Blizzard_Commentator",
	"Blizzard_Communities_Mainline",
	"Blizzard_Contribution",
	"Blizzard_CovenantCallings",
	"Blizzard_CovenantPreviewUI",
	"Blizzard_CovenantRenown",
	"Blizzard_CovenantSanctum",
	"Blizzard_DeathRecap",
	"Blizzard_DebugTools",
	"Blizzard_Dispatcher",
	"Blizzard_EncounterJournal_Mainline",
	"Blizzard_EventTrace",
	"Blizzard_ExpansionTrial",
	"Blizzard_FlightMap",
	"Blizzard_FontStyles_Shared",
	"Blizzard_GarrisonTemplates",
	"Blizzard_GarrisonUI_Mainline",
	"Blizzard_GenericTraitUI",
	"Blizzard_GMChatUI",
	"Blizzard_GuildBankUI",
	"Blizzard_GuildControlUI",
	"Blizzard_HybridMinimap",
	"Blizzard_InspectUI",
	"Blizzard_IslandsPartyPoseUI",
	"Blizzard_IslandsQueueUI",
	"Blizzard_ItemInteractionUI",
	"Blizzard_ItemSocketingUI",
	"Blizzard_ItemUpgradeUI",
	"Blizzard_Kiosk",
	"Blizzard_LandingSoulbinds",
	"Blizzard_MacroUI",
	"Blizzard_MajorFactions",
	"Blizzard_MapCanvas",
	"Blizzard_MatchCelebrationPartyPoseUI",
	"Blizzard_MovePad",
	"Blizzard_NewPlayerExperience",
	"Blizzard_NewPlayerExperienceGuide",
	"Blizzard_ObliterumUI",
	"Blizzard_OrderHallUI",
	"Blizzard_PartyPoseUI",
	"Blizzard_PerksProgram",
	"Blizzard_PlayerChoice",
	"Blizzard_PlunderstormBasics",
	"Blizzard_Professions",
	"Blizzard_ProfessionsCustomerOrders",
	"Blizzard_ProfessionsTemplates",
	"Blizzard_PVPUI",
	"Blizzard_RaidUI",
	"Blizzard_ReforgingUI_Classic",
	"Blizzard_RuneforgeUI",
	"Blizzard_ScrappingMachineUI",
	"Blizzard_SelectorUI",
	"Blizzard_Settings",
	"Blizzard_SharedMapDataProviders_Mainline",
	"Blizzard_Soulbinds",
	"Blizzard_SubscriptionInterstitialUI",
	"Blizzard_TalentUI_Mainline",
	"Blizzard_TimeManager_Mainline",
	-- "Blizzard_TimerunningCharacterCreate", -- Wrong active UI
	"Blizzard_TorghastLevelPicker",
	"Blizzard_TrainerUI",
	"Blizzard_TransformTree",
	"Blizzard_VoidStorageUI",
	"Blizzard_WarfrontsPartyPoseUI",
	"Blizzard_WeeklyRewards",
}

TrimFlavor(KethoDoc.LoadOnDemand.mainline, "_Mainline")
FilterFlavor(KethoDoc.LoadOnDemand.mainline, "_Classic")

KethoDoc.LoadOnDemand.mainline_ptr = KethoDoc.LoadOnDemand.mainline
--[[
-- 10.2.7
KethoDoc.LoadOnDemand.mainline_ptr = {
	-- "Blizzard_AccountSaveUI",
	"Blizzard_AchievementUI_Mainline",
	"Blizzard_AdventureMap",
	"Blizzard_AlliedRacesUI",
	"Blizzard_AnimaDiversionUI",
	"Blizzard_APIDocumentation",
	"Blizzard_APIDocumentationGenerated",
	"Blizzard_ArchaeologyUI_Mainline",
	"Blizzard_ArdenwealdGardening",
	"Blizzard_ArtifactUI",
	"Blizzard_AuctionHouseShared",
	"Blizzard_AuctionHouseUI",
	"Blizzard_AzeriteEssenceUI",
	"Blizzard_AzeriteRespecUI",
	"Blizzard_AzeriteUI",
	"Blizzard_BarberShopUI",
	"Blizzard_BattlefieldMap",
	"Blizzard_BehavioralMessaging",
	"Blizzard_BlackMarketUI",
	"Blizzard_BoostTutorial",
	"Blizzard_Calendar_Mainline",
	"Blizzard_ChallengesUI",
	"Blizzard_CharacterCustomize",
	"Blizzard_ChromieTimeUI",
	"Blizzard_ClassTrial",
	"Blizzard_ClickBindingUI",
	"Blizzard_Collections",
	"Blizzard_Collections_Classic",
	"Blizzard_CombatLog_Mainline",
	"Blizzard_CombatText",
	"Blizzard_Commentator",
	"Blizzard_Communities_Mainline",
	"Blizzard_Contribution",
	"Blizzard_CovenantCallings",
	"Blizzard_CovenantPreviewUI",
	"Blizzard_CovenantRenown",
	"Blizzard_CovenantSanctum",
	"Blizzard_DeathRecap",
	"Blizzard_DebugTools",
	"Blizzard_DelvesCompanionConfiguration",
	"Blizzard_DelvesDifficultyPicker",
	"Blizzard_Dispatcher",
	"Blizzard_EncounterJournal_Mainline",
	"Blizzard_EventTrace",
	"Blizzard_ExpansionTrial",
	"Blizzard_FlightMap",
	"Blizzard_FontStyles_Shared",
	"Blizzard_GarrisonTemplates",
	"Blizzard_GarrisonUI_Mainline",
	"Blizzard_GenericTraitUI",
	"Blizzard_GMChatUI",
	"Blizzard_GuildBankUI",
	"Blizzard_GuildControlUI",
	"Blizzard_HybridMinimap",
	"Blizzard_InspectUI",
	"Blizzard_IslandsPartyPoseUI",
	"Blizzard_IslandsQueueUI",
	"Blizzard_ItemInteractionUI",
	"Blizzard_ItemSocketingUI",
	"Blizzard_ItemUpgradeUI",
	"Blizzard_Kiosk",
	"Blizzard_LandingSoulbinds",
	"Blizzard_MacroUI",
	"Blizzard_MajorFactions",
	"Blizzard_MapCanvas",
	"Blizzard_MatchCelebrationPartyPoseUI",
	"Blizzard_MovePad",
	"Blizzard_NewPlayerExperience",
	"Blizzard_NewPlayerExperienceGuide",
	"Blizzard_ObliterumUI",
	"Blizzard_OrderHallUI",
	"Blizzard_PartyPoseUI",
	"Blizzard_PerksProgram",
	"Blizzard_PlayerChoice",
	"Blizzard_PlayerSpells",
	"Blizzard_PlunderstormBasics",
	"Blizzard_Professions",
	"Blizzard_ProfessionsBook",
	"Blizzard_ProfessionsCustomerOrders",
	"Blizzard_ProfessionsTemplates",
	"Blizzard_PVPUI",
	"Blizzard_RaidUI",
	"Blizzard_ReforgingUI_Classic",
	"Blizzard_RuneforgeUI",
	"Blizzard_ScrappingMachineUI",
	"Blizzard_SelectorUI",
	"Blizzard_Settings",
	"Blizzard_SharedMapDataProviders_Mainline",
	"Blizzard_Soulbinds",
	"Blizzard_SubscriptionInterstitialUI",
	"Blizzard_TalentUI_Mainline",
	"Blizzard_TimeManager_Mainline",
	-- "Blizzard_TimerunningCharacterCreate",
	"Blizzard_TorghastLevelPicker",
	"Blizzard_TrainerUI",
	"Blizzard_TransformTree",
	"Blizzard_VoidStorageUI",
	"Blizzard_WarfrontsPartyPoseUI",
	"Blizzard_WeeklyRewards",
}

TrimFlavor(KethoDoc.LoadOnDemand.mainline_ptr, "_Mainline")
FilterFlavor(KethoDoc.LoadOnDemand.mainline_ptr, "_Classic")
]]


-- 1.14.4
KethoDoc.LoadOnDemand.vanilla = {
	-- "Blizzard_AccountSaveUI",
	"Blizzard_AchievementUI",
	"Blizzard_APIDocumentation",
	"Blizzard_APIDocumentationGenerated",
	"Blizzard_ArenaUI",
	"Blizzard_AuctionUI",
	"Blizzard_BarberShopUI",
	"Blizzard_BattlefieldMap",
	"Blizzard_BehavioralMessaging",
	"Blizzard_BindingUI",
	"Blizzard_Calendar",
	"Blizzard_CombatLog",
	-- "Blizzard_CombatLog_Wrath",
	"Blizzard_CombatText",
	"Blizzard_Commentator",
	"Blizzard_Communities",
	"Blizzard_CraftUI",
	-- "Blizzard_CraftUI_TBC",
	-- "Blizzard_CraftUI_Vanilla",
	-- "Blizzard_CraftUI_Wrath",
	"Blizzard_DebugTools",
	"Blizzard_EventTrace",
	"Blizzard_GlyphUI",
	"Blizzard_GMChatUI",
	-- "Blizzard_GuildBankUI_TBC",
	-- "Blizzard_GuildBankUI_Wrath",
	"Blizzard_InspectUI",
	-- "Blizzard_InspectUI_TBC",
	-- "Blizzard_InspectUI_Vanilla",
	-- "Blizzard_InspectUI_Wrath",
	"Blizzard_ItemSocketingUI",
	"Blizzard_Kiosk",
	"Blizzard_LookingForGroupUI",
	"Blizzard_MacroUI",
	-- "Blizzard_MacroUI_TBC",
	-- "Blizzard_MacroUI_Vanilla",
	-- "Blizzard_MacroUI_Wrath",
	"Blizzard_MapCanvas",
	"Blizzard_MovePad",
	"Blizzard_RaidUI",
	-- "Blizzard_RaidUI_Wrath",
	"Blizzard_SharedMapDataProviders",
	-- "Blizzard_SharedMapDataProviders_Wrath",
	"Blizzard_TalentUI",
	-- "Blizzard_TalentUI_TBC",
	-- "Blizzard_TalentUI_Vanilla",
	-- "Blizzard_TalentUI_Wrath",
	"Blizzard_TimeManager",
	"Blizzard_TradeSkillUI",
	-- "Blizzard_TradeSkillUI_TBC",
	-- "Blizzard_TradeSkillUI_Vanilla",
	-- "Blizzard_TradeSkillUI_Wrath",
	"Blizzard_TrainerUI",
}

-- 1.15.0
KethoDoc.LoadOnDemand.vanilla_ptr = {
	-- "Blizzard_AccountSaveUI", -- Unknown load problem
	"Blizzard_AchievementUI",
	"Blizzard_APIDocumentation",
	"Blizzard_APIDocumentationGenerated",
	"Blizzard_ArenaUI",
	"Blizzard_AuctionUI",
	"Blizzard_BarberShopUI",
	"Blizzard_BattlefieldMap",
	"Blizzard_BehavioralMessaging",
	"Blizzard_BindingUI",
	"Blizzard_Calendar",
	"Blizzard_Collections",
	"Blizzard_CombatLog",
	"Blizzard_CombatLog_Wrath",
	"Blizzard_CombatText",
	"Blizzard_Commentator",
	"Blizzard_Communities",
	"Blizzard_CraftUI_TBC",
	"Blizzard_CraftUI_Vanilla",
	"Blizzard_CraftUI_Wrath",
	"Blizzard_DebugTools",
	"Blizzard_EngravingUI",
	"Blizzard_EventTrace",
	"Blizzard_GlyphUI",
	"Blizzard_GMChatUI",
	"Blizzard_GuildBankUI_TBC",
	"Blizzard_GuildBankUI_Wrath",
	"Blizzard_InspectUI_TBC",
	"Blizzard_InspectUI_Vanilla",
	"Blizzard_InspectUI_Wrath",
	"Blizzard_ItemSocketingUI",
	"Blizzard_Kiosk",
	"Blizzard_MacroUI",
	"Blizzard_MacroUI_TBC",
	"Blizzard_MacroUI_Vanilla",
	"Blizzard_MacroUI_Wrath",
	"Blizzard_MapCanvas",
	"Blizzard_MovePad",
	"Blizzard_RaidUI",
	"Blizzard_RaidUI_Wrath",
	"Blizzard_SharedMapDataProviders",
	"Blizzard_SharedMapDataProviders_Wrath",
	"Blizzard_TalentUI_TBC",
	"Blizzard_TalentUI_Vanilla",
	"Blizzard_TalentUI_Wrath",
	"Blizzard_TimeManager",
	"Blizzard_TradeSkillUI_TBC",
	"Blizzard_TradeSkillUI_Vanilla",
	"Blizzard_TradeSkillUI_Wrath",
	"Blizzard_TrainerUI",
}

-- I have no idea how the FrameXML loads flavor specific files
FilterFlavor(KethoDoc.LoadOnDemand.vanilla_ptr, "_TBC")
FilterFlavor(KethoDoc.LoadOnDemand.vanilla_ptr, "_Wrath")
TrimFlavor(KethoDoc.LoadOnDemand.vanilla_ptr, "_Vanilla")
-- /dump UIParentLoadAddOn"Blizzard_TradeSkillUI"


-- 3.4.2
KethoDoc.LoadOnDemand.wrath = {
	-- "Blizzard_AccountSaveUI",
	"Blizzard_AchievementUI",
	"Blizzard_APIDocumentation",
	"Blizzard_APIDocumentationGenerated",
	"Blizzard_ArenaUI",
	"Blizzard_AuctionUI",
	"Blizzard_BarberShopUI",
	"Blizzard_BattlefieldMap",
	"Blizzard_BehavioralMessaging",
	"Blizzard_BindingUI",
	"Blizzard_Calendar",
	"Blizzard_CombatLog",
	-- "Blizzard_CombatLog_Wrath",
	"Blizzard_CombatText",
	"Blizzard_Commentator",
	"Blizzard_Communities",
	"Blizzard_CraftUI",
	-- "Blizzard_CraftUI_TBC",
	-- "Blizzard_CraftUI_Vanilla",
	-- "Blizzard_CraftUI_Wrath",
	"Blizzard_DebugTools",
	"Blizzard_EventTrace",
	"Blizzard_GlyphUI",
	"Blizzard_GMChatUI",
	"Blizzard_GuildBankUI",
	-- "Blizzard_GuildBankUI_TBC",
	-- "Blizzard_GuildBankUI_Wrath",
	"Blizzard_InspectUI",
	-- "Blizzard_InspectUI_TBC",
	-- "Blizzard_InspectUI_Vanilla",
	-- "Blizzard_InspectUI_Wrath",
	"Blizzard_ItemSocketingUI",
	"Blizzard_Kiosk",
	"Blizzard_LookingForGroupUI",
	"Blizzard_MacroUI",
	-- "Blizzard_MacroUI_TBC",
	-- "Blizzard_MacroUI_Vanilla",
	-- "Blizzard_MacroUI_Wrath",
	"Blizzard_MapCanvas",
	"Blizzard_MovePad",
	"Blizzard_RaidUI",
	-- "Blizzard_RaidUI_Wrath",
	"Blizzard_SharedMapDataProviders",
	-- "Blizzard_SharedMapDataProviders_Wrath",
	"Blizzard_TalentUI",
	-- "Blizzard_TalentUI_TBC",
	-- "Blizzard_TalentUI_Vanilla",
	-- "Blizzard_TalentUI_Wrath",
	"Blizzard_TimeManager",
	"Blizzard_TradeSkillUI",
	-- "Blizzard_TradeSkillUI_TBC",
	-- "Blizzard_TradeSkillUI_Vanilla",
	-- "Blizzard_TradeSkillUI_Wrath",
	"Blizzard_TrainerUI",
}
KethoDoc.LoadOnDemand.wrath_ptr = KethoDoc.LoadOnDemand.wrath

KethoDoc.LoadOnDemand.cata_ptr = {
	-- "Blizzard_AccountSaveUI",
	"Blizzard_AchievementUI_Cata",
	"Blizzard_AchievementUI_Classic",
	"Blizzard_APIDocumentation",
	"Blizzard_APIDocumentationGenerated",
	"Blizzard_ArchaeologyUI_Cata",
	"Blizzard_ArenaUI",
	"Blizzard_AuctionUI_Classic",
	"Blizzard_BarberShopUI",
	"Blizzard_BattlefieldMap",
	"Blizzard_BehavioralMessaging",
	"Blizzard_BindingUI",
	"Blizzard_Calendar_Classic",
	"Blizzard_Collections_Cata",
	"Blizzard_Collections_Classic",
	"Blizzard_CombatLog_Cata",
	"Blizzard_CombatLog_Classic",
	"Blizzard_CombatLog_Wrath",
	"Blizzard_CombatText",
	"Blizzard_Commentator",
	"Blizzard_Communities_Classic",
	"Blizzard_Communities_Mainline",
	"Blizzard_CraftUI_Classic",
	"Blizzard_CraftUI_Vanilla",
	"Blizzard_DebugTools",
	"Blizzard_Dispatcher",
	"Blizzard_EncounterJournal_Cata",
	"Blizzard_EngravingUI",
	"Blizzard_EventTrace",
	"Blizzard_FontStyles_Shared",
	"Blizzard_GlyphUI_Cata",
	"Blizzard_GlyphUI_Wrath",
	"Blizzard_GMChatUI",
	"Blizzard_GuildBankUI_Classic",
	"Blizzard_GuildControlUI",
	"Blizzard_InspectUI_Classic",
	"Blizzard_InspectUI_Vanilla",
	"Blizzard_ItemSocketingUI",
	"Blizzard_Kiosk",
	"Blizzard_MacroUI_Classic",
	"Blizzard_MapCanvas",
	"Blizzard_MovePad",
	"Blizzard_RaidUI",
	"Blizzard_RaidUI_Cata",
	"Blizzard_RaidUI_Wrath",
	"Blizzard_ReforgingUI_Classic",
	"Blizzard_SharedMapDataProviders_Cata",
	"Blizzard_SharedMapDataProviders_Classic",
	"Blizzard_SharedMapDataProviders_Wrath",
	"Blizzard_TalentUI_Cata",
	"Blizzard_TalentUI_TBC",
	"Blizzard_TalentUI_Vanilla",
	"Blizzard_TalentUI_Wrath",
	"Blizzard_TimeManager_Classic",
	"Blizzard_TradeSkillUI_Cata",
	"Blizzard_TradeSkillUI_TBC",
	"Blizzard_TradeSkillUI_Vanilla",
	"Blizzard_TradeSkillUI_Wrath",
	"Blizzard_TrainerUI",
}

TrimFlavor(KethoDoc.LoadOnDemand.cata_ptr, "_Cata")
FilterFlavor(KethoDoc.LoadOnDemand.cata_ptr, "_Mainline")
FilterFlavor(KethoDoc.LoadOnDemand.cata_ptr, "_Classic")
FilterFlavor(KethoDoc.LoadOnDemand.cata_ptr, "_Vanilla")
FilterFlavor(KethoDoc.LoadOnDemand.cata_ptr, "_TBC")
FilterFlavor(KethoDoc.LoadOnDemand.cata_ptr, "_Wrath")
