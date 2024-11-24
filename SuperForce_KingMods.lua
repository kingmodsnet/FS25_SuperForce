--
-- SuperForce_KingMods
--
-- Author: KingMods
-- Contributors: Jean-Sébastien
-- Date: 24.11.2024
-- Version: 1.0.0.2
--
-- https://www.kingmods.net/
--

SuperForce = {}

SuperForce.initialized = {}

function SuperForce:update(dt)
    if g_currentMission.playerSystem ~= nil and g_currentMission.playerSystem.players ~= nil then
        local activeUniqueIds = {}

        for _, player in pairs(g_currentMission.playerSystem.players) do
            activeUniqueIds[player.userId] = true

            if not SuperForce.initialized[player.userId] and player.hands ~= nil then
                if player.hands.consoleCommandToggleSuperStrength ~= nil then
                    player.hands:consoleCommandToggleSuperStrength()
                    SuperForce.initialized[player.userId] = true
                end
            end
        end

        for userId, _ in pairs(SuperForce.initialized) do
            if not activeUniqueIds[userId] then
                SuperForce.initialized[userId] = nil
            end
        end
    end
end

addModEventListener(SuperForce)
