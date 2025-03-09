-- 铲掉地皮不生成掉落物的模组

-- 所有地皮掉落物的预制体名称列表
local TURF_ITEMS = {
    "turf_road", "turf_rocky", "turf_forest", "turf_grass", 
    "turf_savanna", "turf_dirt", "turf_woodfloor", "turf_carpetfloor", 
    "turf_checkerfloor", "turf_marsh", "turf_cave", "turf_fungus", 
    "turf_fungus_red", "turf_fungus_green", "turf_dragonfly", 
    "turf_deciduous", "turf_desertdirt", "turf_mud", "turf_underrock", 
    "turf_sinkhole", "turf_beach", "turf_meteor", "turf_pebblebeach", 
    "turf_shellbeach", "turf_archive", "turf_fungusmoon"
}

-- 监听地皮掉落物的生成并立即移除
for _, turf_name in ipairs(TURF_ITEMS) do
    AddPrefabPostInit(turf_name, function(inst)
        -- 确保实例存在
        if not inst then return end
        
        -- 检查是否是掉落物（不是已放置的地皮）
        if not inst:HasTag("CLASSIFIED") then
            -- 立即移除掉落物，使用安全的延迟移除方式
            inst:DoTaskInTime(0, function() 
                if inst:IsValid() then
                    inst:Remove() 
                end
            end)
        end
    end)
end