--
-- SuperForce_KingMods
--
-- Author: KingMods
-- Date: 12.11.2024
-- Version: 1.0.0.0
--
-- https://www.kingmods.net/
--

SuperForce = {}

SuperForce.initialized = false

function SuperForce:update(dt)
    if not SuperForce.initialized then
        if g_currentMission.playerSystem ~= nil then
            if g_currentMission.playerSystem.players ~= nil then
                if g_currentMission.playerSystem.players[g_currentMission.playerUserId] ~= nil then
                    if g_currentMission.playerSystem.players[g_currentMission.playerUserId].hands ~= nil then
                        g_currentMission.playerSystem.players[g_currentMission.playerUserId].hands:consoleCommandToggleSuperStrength()
                        SuperForce.initialized = true
                    end
                end
            end
        end
    end
end

addModEventListener(SuperForce)
