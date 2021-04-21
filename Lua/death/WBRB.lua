local wbrb = {}

function wbrb:Setup()
    local aftsprite = self("AftSprite")
    aftsprite:SetTextureFiltering(true)
    aftsprite:basezoomx(SCREEN_WIDTH/DISPLAY:GetDisplayWidth())
    aftsprite:basezoomy(-SCREEN_HEIGHT/DISPLAY:GetDisplayHeight())
    aftsprite:x(SCREEN_CENTER_X)
    aftsprite:y(SCREEN_CENTER_Y)
    aftsprite:hidden(1)

    aftsprite:addcommand( "HideAft", function()
        stitch("lua.aftoverlay"):Off()
    end)

    self("BRBImage"):cmd("basezoomx,1;basezoomy,1;xy,SCREEN_CENTER_X,SCREEN_CENTER_Y;diffusealpha,0;")
end

function wbrb:Prepare()
    self("AftSprite"):SetTexture(stitch("lua.aftoverlay").texture)
    wbrb.Prepare = nil -- No need to set the texture again
end

function wbrb:Dead()
    stitch("lua.aftoverlay"):On()
    GAMESTATE:ApplyGameCommand('sound,wbrb')

    self("AftSprite"):cmd("hidden,0;diffusealpha,1;sleep,2;linear,1;diffusealpha,0;queuecommand,HideAft")
    self("BRBImage"):cmd("diffusealpha,1;sleep,2;linear,1;diffusealpha,0;")
end

return wbrb