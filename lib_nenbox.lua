function CHK(int,str,func)if int == str then RunString(func) end end
render.Capture = function() return end
surface.CreateFont("R_17", { font = "Roboto", size = 17, weight = 700, outline = true})
print("inject..")
MOD = {}
-- Wall Hack
MOD.wh = true
MOD.wh_dist = 250000
MOD.wh_hp = true
MOD.wh_ar = true
MOD.wh_wp = true
-- Bhop && Auto Strafe
MOD.bh = true
MOD.as = true

CHK(MOD.wh,true,[[
	hook.Add( "HUDPaint", "ftjnyghmjhb", function() for k,v in pairs ( player.GetAll() ) do if v == LocalPlayer() then return end local Position = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen() local Name = "" local Hp = 0 local Ar = 0 local Wp = "" if v == LocalPlayer() then Name = "" Hp = 0 Ar = 0 Wp = "" else Name = v:Name() Hp = v:Health() Ar = v:Armor() Wp = v:GetActiveWeapon():GetClass() end if LocalPlayer():GetPos():DistToSqr( v:GetPos() ) < MOD.wh_dist then  draw.DrawText( Name, "R_17", Position.x, Position.y, Color( 255, 255, 255, 255 ), 1 )  if MOD.wh_hp then draw.DrawText( "HP: " .. Hp, "R_17", Position.x, Position.y+35, Color( 255, 255, 255, 255 ), 1 ) end if MOD.wh_ar then draw.DrawText( "Armor: " .. Ar, "R_17", Position.x, Position.y+55, Color( 255, 255, 255, 255 ), 1 ) end  if MOD.wh_wp then draw.DrawText( "Weapon: " .. Wp, "R_17", Position.x, Position.y+75, Color( 255, 255, 255, 255 ), 1 ) end end end end )
]])

CHK(MOD.bh, true, [[
	hook.Add("Think", "esgtdrsftycjn", function() if LocalPlayer():IsTyping() == false and input.IsKeyDown(KEY_SPACE) and LocalPlayer():IsOnGround() then RunConsoleCommand("+jump") timer.Create("Bhop", 0, math.random( .280, .290 ), function() RunConsoleCommand("-jump") end) end end)
]])

CHK(MOD.as, true, [[
	hook.Add("CreateMove", "bcvnfgtth", function(cmd) if input.IsKeyDown(KEY_SPACE) and LocalPlayer():IsTyping() == false then if(cmd:GetMouseX() < 0) then cmd:SetSideMove(-10000); elseif(cmd:GetMouseX() > 0) then cmd:SetSideMove(10000); end end end)
]])