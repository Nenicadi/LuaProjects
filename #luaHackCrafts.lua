surface.CreateFont( "R_24", {
	font = "Roboto",
	extended = false,
	size = 24,
	weight = 500,
	antialias = true,
} )

surface.CreateFont( "A_18", {
	font = "Arial",
	extended = false,
	size = 18,
	weight = 500,
	antialias = true,
} )

-- Конец
local getid = 0
local getname = "Ничего"
local getprice = 0

-- Цвета
local CBlue = Color(78,165,241)
local CDarkBlue = Color(52,108,207)
local CGrey = Color(41,41,41)
local CWhite = Color(255,255,255)

local function NenicadiHack()
    local frame = vgui.Create("DFrame")
    frame:SetTitle("")
    frame:SetSize(350,200)
    frame:MakePopup()

    function frame:Paint( w, h )
        draw.RoundedBox(0,0,0,w,h,Color(CGrey.r , CGrey.g , CGrey.b , 200))
        draw.SimpleText("#.lua", "A_18", 0, 0, CWhite)
    end

    local button_1 = vgui.Create( "DTextEntry", frame )
    button_1:Dock( TOP )
    button_1:SetFont( "R_24" )
    button_1:DockMargin( 0, 0, 0, 5 )
    button_1:SetPlaceholderText( "Предмет, который хочешь заменить" )
    button_1.OnChange = function( self )
		getid = button_1:GetValue()
	end

    local button_2 = vgui.Create( "DTextEntry", frame )
    button_2:Dock( TOP )
    button_2:SetFont( "R_24" )
    button_2:DockMargin( 0, 0, 0, 5 )
    button_2:SetPlaceholderText( "Желаемый предмет" )
    button_2.OnChange = function( self )
		getname = button_2:GetValue()
	end

    -- Цена
    local button_price = vgui.Create( "DTextEntry", frame )
    button_price:Dock( TOP )
    button_price:SetFont( "R_24" )
    button_price:DockMargin( 0, 0, 0, 5 )
    button_price:SetPlaceholderText( "Цена крафта" )
    button_price.OnChange = function( self )
		getprice = button_price:GetValue()
	end

    local button_finish = vgui.Create( "DButton", frame )
    button_finish:Dock( BOTTOM )
    button_finish:SetFont( "R_24" )
    button_finish:DockMargin( 0, 0, 0, 5 )
    button_finish:SetText( "Выставить" )
    button_finish:SetTextColor( CWhite )
    button_finish.DoClick = function()
        net.Start("ent.trades.action3")
        net.WriteUInt(getid, 32)
        net.WriteUInt(getprice, 16)
        net.WriteString(getname)
        net.WriteBool(true)
        net.SendToServer()
    end
    function button_finish:Paint( w, h )
        --draw.RoundedBox(0,0,0,w,h,CGrey)
        draw.RoundedBox( 0, 0, 0, w, h, (self.Depressed or self:IsHovered( )) and CBlue or CDarkBlue )
    end
end

concommand.Add( "Hack_Crafts", NenicadiHack )
