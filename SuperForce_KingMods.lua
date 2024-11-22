--
-- SuperForce_KingMods
--
-- Author: KingMods
-- Contributors: Jean-Sébastien
-- Date: 22.11.2024
-- Version: 1.0.0.1
--
-- https://www.kingmods.net/
--

SuperForce = {}

SuperForce.initialized = {}

function SuperForce:update(dt)
    if g_currentMission.playerSystem ~= nil and g_currentMission.playerSystem.players ~= nil then
        for userId, player in pairs(g_currentMission.playerSystem.players) do
            if not SuperForce.initialized[userId] and player.hands ~= nil then
                player.hands:consoleCommandToggleSuperStrength()
                SuperForce.initialized[userId] = true
            end
        end
    end
end

addModEventListener(SuperForce)
