CreateThread(function()
    RequestStreamedTextureDict('squaremap', false)
    while not HasStreamedTextureDictLoaded('squaremap') do Wait(10) end
    SetMinimapClipType(0)
    AddReplaceTexture('platform:/textures/graphics', 'radarmasksm', 'squaremap', 'radarmasksm')
    AddReplaceTexture('platform:/textures/graphics', 'radarmask1g', 'squaremap', 'radarmasksm')
    SetBigmapActive(true, false)
    Wait(50)
    SetBigmapActive(false, false)
end)

CreateThread(function()
    local defaultAspect = 1920.0 / 1080.0
    local resX, resY = GetActiveScreenResolution()
    local aspectRatio = resX / resY
    local offset = 0.0
    if aspectRatio > defaultAspect then
        offset = ((defaultAspect - aspectRatio) / 3.6) - 0.008
    end
    while true do
        Wait(0)
        local c = Config.Minimap
        local x = c.posX + offset
        DisplayHud(false)
        DisplayRadar(true)
        SetRadarBigmapEnabled(false, false)
        SetRadarZoom(1100)
        SetBlipAlpha(GetNorthRadarBlip(), 0)
        SetBlipAlpha(GetMainPlayerBlipId(), 0)
        SetMinimapComponentPosition('minimap',      'L', 'B', x,        c.posY,           c.width,       c.height)
        SetMinimapComponentPosition('minimap_mask',  'L', 'B', x + 0.03, 0.0,              c.width * 0.7, c.height * 0.7)
        SetMinimapComponentPosition('minimap_blur',  'L', 'B', x - 0.01, c.posY + 0.06,    c.width * 1.5, c.height * 1.5)
        HideHudComponentThisFrame(1); HideHudComponentThisFrame(2); HideHudComponentThisFrame(3)
        HideHudComponentThisFrame(4); HideHudComponentThisFrame(6); HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(9); HideHudComponentThisFrame(10)
        HideHudComponentThisFrame(13); HideHudComponentThisFrame(14); HideHudComponentThisFrame(19)
    end
end)
