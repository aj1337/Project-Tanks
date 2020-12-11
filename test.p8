pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
function _init()
 make_player()
 make_bullets()
end
function _update() 
 move_player(player1)
 move_player(player2)
 move_bullets()
 if (player1.cooldown > 0) player1.cooldown-=1
 if (player2.cooldown > 0) player2.cooldown-=1
end
function _draw()
 cls() --clear screen
 draw_players()
 draw_bullets()
end

--Relating to init
function make_player()
 player1={
  playerNumber=0,
  x=0,
  y=64,
  sprite=1,
  cooldown=0,
  dx=2,
  dy=0,
  bullets={}
  }

 player2={
	 playerNumber=1,
	 x=120,
	 y=64,
	 sprite=2,
	 cooldown=0,
	 dx=-2,
	 dy=0,
	 bullets={}
 }
end

function make_bullets()
 bullets={}
end

function fire(player)
 local bullet = {
	 sp=3,
	 x=player.x+1,
	 y=player.y,
	 dx=player.dx,
	 dy=player.dy
 }
 if (player.playerNumber==1) then
  bullet.x-=8
 end
 add(player.bullets,bullet)
 player.cooldown = 5
end

--Relating to update
function move_player(player)
 if (btn(0,player.playerNumber) and player.x > 0) player.x-=1 --left
 if (btn(1,player.playerNumber) and player.x < 120) player.x+=1 --right
 if (btn(3,player.playerNumber) and player.y < 120) player.y+=1 --down
 if (btn(2,player.playerNumber) and player.y > 0) player.y-=1 --up
 if (btn(4,player.playerNumber) and player.cooldown == 0) then
  fire(player)
 end
end

function move_bullets()
 for b in all(player1.bullets) do 
  b.x += b.dx
  b.y += b.dy
 end
 for b in all(player2.bullets) do 
  b.x += b.dx
  b.y += b.dy
 end
end

--Relating to draw
function draw_players()
 spr(player1.sprite,player1.x,player1.y)
 spr(player2.sprite,player2.x,player2.y,1,1,true,false)
end

function draw_bullets()
 for b in all(player1.bullets) do 
  spr(b.sp, b.x, b.y)
 end
 for b in all(player2.bullets) do 
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
