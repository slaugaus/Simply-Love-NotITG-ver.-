local failure = {}

function failure:Setup()
    self(1):cmd("stretchto,0,0,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,1,0,0,0")
    self(2):cmd("xy,SCREEN_CENTER_X,SCREEN_CENTER_Y;diffusealpha,0;")
    self(3):cmd("stretchto,SCREEN_WIDTH,SCREEN_CENTER_Y+80,SCREEN_WIDTH,SCREEN_CENTER_Y+85;diffusealpha,0;")
end

function failure:Dead()
    GAMESTATE:ApplyGameCommand('sound,ssbm_failure')
    self(1):cmd("diffusealpha,.7;linear,0.3;diffusealpha,0;")
    self(2):cmd("diffusealpha,0;addy,160;decelerate,0.3;diffusealpha,1;addy,-160;sleep,1;accelerate,0.2;diffusealpha,0;")
    self(3):cmd("diffusealpha,1;decelerate,0.1;stretchto,0,SCREEN_CENTER_Y+80,SCREEN_WIDTH,SCREEN_CENTER_Y+85;sleep,1.2;accelerate,0.2;diffusealpha,0;")
end

return failure