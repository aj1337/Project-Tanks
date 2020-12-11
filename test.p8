pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
function _init()
 make_player()
 make_bullets()
 cooldown = 0
end
function _update() 
 move_player()
 move_bullets()
 if (cooldown > 0) cooldown-=1
end
function _draw()
 cls() --clear screen
 draw_player()
 draw_bullets()
end

--Relating to init
function make_player()
 player = {}
 player.x=64
 player.y=64
 player.sprite=1
end

function make_bullets()
 bullets={}
end

function fire()
 local bullet = {
	 sp=3,
	 x=player.x,
	 y=player.y,
	 dx=2,
	 dy=0
 }
 add(bullets,bullet)
 cooldown = 5
end

--Relating to update
function move_player()
 if (btn(0) and player.x > 0) player.x-=1 --left
 if (btn(1) and player.x < 120) player.x+=1 --right
 
 if (btn(3) and player.y < 120) player.y+=1 --down
 if (btn(2) and player.y > 0) player.y-=1 --up
 if (btn(4) and cooldown == 0) then
  fire()
 end
end

function move_bullets()
 for b in all(bullets) do 
  b.x += b.dx
  b.y += b.dy
 end
end

--Relating to draw
function draw_player()
 spr(player.sprite,player.x,player.y)
end

function draw_bullets()
 for b in all(bullets) do 
  spr(b.sp, b.x, b.y)
 end
end
__gfx__
65599556000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56599565000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55999955000666000005550000000000007760000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99999999006666660055555500000076007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99999999000666000005550000000067007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55999955666666665555555500000000007760000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56599565650505065606060500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
65599556066666600555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
