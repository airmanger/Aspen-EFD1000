--**************************************--
------------------------------------------
-- This is a Aspen EFD1000 inspired EFD --
-- Made by Ralph with help from Corjan  --
------------------------------------------
--**************************************--

----------------------
-- Global variables --
----------------------
dhwarning = true
altwarning = true

---------------------------
-- Add images in Z-order --
---------------------------
img_horizon = img_add("horizon.png", -350, -679, 1500, 3000)
img_horizonscale = img_add("horizonscale.png", -350, -1179, 1500, 3000)
img_flightdirector = img_add("flightdirector.png", 222, 321, 354, 56)
img_roll = img_add("roll.png", 92, 13, 616, 616)
img_add_fullscreen("background.png")
img_slip = img_add("slip.png", 385, 70, 30, 8)
img_spdyellow = img_add("speedyellow.png", 95, -469, 10, 511)
img_spdred = img_add("speedred.png", 95, -469, 10, 511)
img_apaltbox = img_add("apaltbox.png", 621, 0, 179, 42)

-- Running text and images for speed and altitude

function item_value_callback_speed(i)
    return string.format("%d", 0 - (i * 10) )
end

running_text_speed = running_txt_add_ver(0,-25,10,68,66,item_value_callback_speed,"-fx-font-size:28px; -fx-font-family:Arial; -fx-fill:white; -fx-text-alignment:right;")
running_img_speed  = running_img_add_ver("speedimage.png",71,-9,10,34,66)

running_img_move_carot(running_img_speed, 0)
running_txt_move_carot(running_text_speed, 0)

function item_value_callback_alt(i)
	return string.format("%d", i * 100 * -1 )
end

running_text_alt = running_txt_add_ver(710,-159,8,80,116,item_value_callback_alt,"-fx-font-size:28px; -fx-font-family:Arial; -fx-fill:white; -fx-text-alignment:right;")
running_img_alt  = running_img_add_ver("altimage.png",663,-27,6,31,116)

running_img_move_carot(running_img_alt, 0)
running_txt_move_carot(running_text_alt, 0)

-------------------------------------------------
img_altmarker = img_add("altmarker.png", 663, -8, 16, 50)
img_speedmarker = img_add("altmarker.png", 80, -8, 16, 50)
img_add("speedbox.png", 0, 266, 93, 110)
img_add("altbox.png", 664, 266, 137, 110)
img_dh = img_add("dhind.png", 215, 24, 34, 34)
img_windarrow = img_add("windarrow.png", 520, 606, 20, 30)
img_compasrose = img_add("compasrose.png", 147, 701, 506, 506)
img_turnleft = img_add("turnindbar.png", 132, 686, 536, 536)
img_turnright = img_add("turnindbar.png", 132, 686, 536, 536)
img_add("turnindicator.png", 302, 674, 196, 42)
img_degreebox = img_add("degreebox.png", 344, 645, 112, 78)

--------------
-- Add text --
--------------
-- Infobar top
txt_apspd = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 5, 5, 90, 100)
txt_apalt = txt_add("", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 690, 5, 90, 100)
-- Infobar center
txt_add("TAS", "-fx-font-size:20px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:left;", 5, 570, 150, 100)
txt_tas = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 20, 562, 120, 100)
txt_add("GS", "-fx-font-size:20px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:left;", 15, 615, 150, 100)
txt_gs = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 20, 607, 120, 100)
txt_add("OAT", "-fx-font-size:20px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:left;", 200, 615, 150, 100)
txt_oat = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 200, 607, 120, 100)
txt_wind = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 500, 607, 200, 100)
txt_inhg = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 670, 562, 120, 100)
-- Navigation
txt_compheading = txt_add(" ", "-fx-font-size:49px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:center;", 326, 640, 150, 100)
txt_add("CRS", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 90, 642, 200, 100)
txt_course = txt_add(" ", "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 97, 672, 200, 100)
txt_add("HDG", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 380, 642, 200, 100)
txt_hdg = txt_add(" ", "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;", 383, 672, 200, 100)
txt_vsi = txt_add("", "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 558, 642, 200, 100)
txt_add("FPM", "-fx-font-size:26px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 558, 675, 200, 100)
txt_source = txt_add("GPS1", "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: #5fce4b; -fx-font-weight:bold; -fx-text-alignment:center;", 298, 1238, 200, 100)
-- Running text airspeed --
function item_value_callback_inner_speed_minor(i)
    
	if i > 0 then
		return""
	else
		return string.format("%d", (0 - i) % 10 )
	end
	
end

running_text_inner_speed_minor_id = running_txt_add_ver(48,209,5,30,44, item_value_callback_inner_speed_minor, "-fx-font-size:42px; -fx-font-family:arial; -fx-font-weight:bold; -fx-fill:white;")
running_txt_move_carot(running_text_inner_speed_minor_id, 0)

running_txt_viewport_rect(running_text_inner_speed_minor_id,43,268,29,106)

function item_value_callback_inner_speed_major(i)
    
	if i == 0 then
		return ""
	else
		return string.format("%d", (0 - i) )
	end
	
end

running_text_inner_speed_major_id = running_txt_add_ver(-1,253,3,50,44, item_value_callback_inner_speed_major, "-fx-font-size:42px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")
running_txt_move_carot(running_text_inner_speed_major_id, 0)

running_txt_viewport_rect(running_text_inner_speed_major_id,2,295,46,52)
---------------------------

-- Running text altitude --
function item_value_callback_inner_alt_minor(i)
	
	if i == 0 then
		return"0"
	elseif i > 0 then
		return""
	else
		return string.format("%02d", ((0-i)%10) * 10 )
	end
	
end

running_text_inner_alt_minor_id = running_txt_add_ver(745,225,5,50,40, item_value_callback_inner_alt_minor, "-fx-font-size:28px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")
running_txt_move_carot(running_text_inner_alt_minor_id, 0)
running_txt_viewport_rect(running_text_inner_alt_minor_id,755,268,42,106)


function item_value_callback_inner_alt_major100(i)
    
	if i == 0 then
		return""
	else
		return string.format("%d", (0 - i)%10 )
	end
	
end

running_text_inner_alt_major100_id = running_txt_add_ver(716,265,3,44,40, item_value_callback_inner_alt_major100, "-fx-font-size:28px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")
running_txt_move_carot(running_text_inner_alt_major100_id, 0)
running_txt_viewport_rect(running_text_inner_alt_major100_id,700,295,60,52)

function item_value_callback_inner_alt_major1000(i)

	if i == 0 then
		return""
	else
		return"" .. - i
	end
	
end

running_text_inner_alt_major1000_id = running_txt_add_ver(684,247,3,55,50, item_value_callback_inner_alt_major1000, "-fx-font-size:44px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")
running_txt_move_carot(running_text_inner_alt_major1000_id, 0)
running_txt_viewport_rect(running_text_inner_alt_major1000_id,690,295,60,52)
---------------------------
function item_value_callback_compass(i)

    t = i % 12

    if t == 0 then
        return "N"
    elseif t == 3 then
        return "W"
    elseif t == 6 then
        return "S"        
    elseif t == 9 then
        return "E"
    end
    
    value = 36 - (t*3)
    
    if value < 0 then
        value = value + 36
    end
    
    return value
end

compass_inner_txt_id = running_txt_add(380,940,12,40,40,190,"c",item_value_callback_compass, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:center")
--// VOR Needle on top of compass \\--
img_headind = img_add("headingind.png", 374, 700, 52, 506)
img_needle = img_add("vorneedle.png", 286, 734, 228, 440)
img_center_needle = img_add("hsi_center_needle.png", 390, 700, 20, 204)
img_trueh = img_add("trueheading.png", 374, 700, 52, 506)
img_add("airplane-icon.png", 368, 920, 64, 64)

---------------
-- Add sound --
---------------
snd_dhwarning = sound_add("dhaudio.wav")
snd_apaltwarning = sound_add("alttone.wav")
--------------
-- Viewport --
--------------
viewport_rect(img_horizonscale, 0, 82, 800, 516)
viewport_rect(img_roll, 108, 0, 584, 120)
viewport_rect(img_spdyellow, 95, 42, 10, 511)
viewport_rect(img_spdred, 95, 42, 10, 511)
viewport_rect(img_altmarker,663,42,137,511)
viewport_rect(img_speedmarker,80,42,137,511)
viewport_rect(img_turnleft, 302, 674, 96, 42)
viewport_rect(img_turnright, 402, 674, 96, 42)
---------------
-- Functions --
---------------

-- Altitude, speed and radar altimeter --
function new_altitude(radalt, dh, altitude, airspeed, vne, vno, altmarker)

-- VNO and VNE bar
	y_yellow = ((airspeed - vno) * 6.6) - 190
	y_yellow = var_cap(y_yellow, -469, 42)
	if vno > 0 then
		move(img_spdyellow,nil,y_yellow,nil,nil)
	else
		move(img_spdyellow,nil,-469,nil,nil)
	end

	y_red = ((airspeed - vne) * 6.6) - 190
	y_red = var_cap(y_red, -469, 42)
	if vne > 0 then
		move(img_spdred,nil,y_red,nil,nil)
	else
		move(img_spdred,nil,-469,nil,nil)
	end

-- Decision height indicator at 10 feet and below
		visible(img_dh, (dh > 0) and (radalt < (dh + 10)) )
		if (dh > 0) and (radalt < (dh + 10)) then
		
			if dhwarning == false then
				sound_play(snd_dhwarning)
			end
			
			dhwarning = true
		else
			dhwarning = false
		end
		
-- Speed indicator running image
	airspeed = var_cap(airspeed, 0, 999)

	running_txt_move_carot(running_text_speed, (airspeed / 10) * -1)
    running_img_move_carot(running_img_speed, (airspeed / 10) * -1)
	
	yspeed = 300 + (airspeed * 6.6)
	yspeed = var_cap(yspeed, 300, 511)
	
	running_txt_viewport_rect(running_text_speed,0,42,95,yspeed)
	running_img_viewport_rect(running_img_speed,72,42,34,yspeed)
	
-- Speed indicator running text
    running_txt_move_carot(running_text_inner_speed_minor_id, (airspeed / 1) * -1)

    if airspeed % 10 > 9 then
    	running_txt_move_carot(running_text_inner_speed_major_id, ( airspeed - 9 - (math.floor(airspeed / 10) * 9) ) * -1 )
    else
    	running_txt_move_carot(running_text_inner_speed_major_id, math.floor(airspeed / 10) * -1)
    end

-- Altitude indicator running image
	altitude = var_cap(altitude, 0, 40000)

	running_txt_move_carot(running_text_alt, (altitude / 100) * -1)
    running_img_move_carot(running_img_alt, (altitude / 100) * -1)
	
	yalt = 300 + (altitude * 1.16)
	yalt = var_cap(yalt, 300, 511)
	
	running_txt_viewport_rect(running_text_alt,663,42,137,yalt)
	running_img_viewport_rect(running_img_alt,663,42,137,yalt)
	
-- Altitude indicator running text
	running_txt_move_carot(running_text_inner_alt_minor_id, (altitude / 10) * -1)
	
	if altitude % 100 > 90 then
    	running_txt_move_carot(running_text_inner_alt_major100_id, ( altitude - 90 - (math.floor(altitude / 100) * 90) ) * -0.1 )
    else
    	running_txt_move_carot(running_text_inner_alt_major100_id, math.floor(altitude / 100) * -1)
    end
	
	if (altitude % 1000) > 990 then
    	running_txt_move_carot(running_text_inner_alt_major1000_id, (( altitude - 990 - (math.floor(altitude / 1000) * 990) ) * -0.1))
    else
    	running_txt_move_carot(running_text_inner_alt_major1000_id, math.floor( altitude / 1000 ) * -1)
    end

-- Autopilot altitude marker and warning
	y_altmarker = ((altmarker - altitude) * -1.16) + 296
	y_altmarker = var_cap(y_altmarker, -8, 553)
	if altmarker > 0 then
		move(img_altmarker,nil,y_altmarker,nil,nil)
	else
		move(img_altmarker,nil,-8,nil,nil)
	end
	
	if altmarker > 0 then
		visible(img_apaltbox, (altmarker - altitude <= 100) and (altmarker - altitude >= -100))
	else
		visible(img_apaltbox, false)
	end
	
	if (altmarker > 0) and (altmarker - altitude <= 100) and (altmarker - altitude >= -100) then
		
			if altwarning == false then
				sound_play(snd_apaltwarning)
			end
			
			altwarning = true
		else
			altwarning = false
		end
	
end

function new_altitude_FSX(radalt, altitude, airspeed, altmarker)

	new_altitude(radalt, 0, altitude, airspeed, 0, 0, altmarker)
	
end

-- Attitude indicator --
function new_attitude(roll, pitch, slip)    

-- Roll outer ring
	rollind = var_cap(roll, -60, 60)
    img_rotate(img_roll, rollind *-1)
        
-- Roll horizon
    img_rotate(img_horizon, roll * -1)
	img_rotate(img_horizonscale, roll * -1)
    
-- Move horizon pitch
    pitch = var_cap(pitch,-55,55)
    radial = math.rad(roll * -1)
    x = -(math.sin(radial) * pitch * 12.7)
    y = (math.cos(radial) * pitch * 12.7)
    img_move(img_horizon, x - 350, y - 1179, nil, nil)
	img_move(img_horizonscale, x - 350, y - 1179, nil, nil)
    
-- Move slip ball
	slip = var_cap(slip * 2,-30,30)
    img_move(img_slip, 385 - slip, nil, nil, nil)
	
end

function new_attitude_fsx(roll, pitch, slip)
	
	new_attitude(roll *-1, pitch * -1, slip * -1)

end

-- Information bar top --
function new_infobartop(apspeed, apalt, airspeed)

-- Autopilot airspeed setting
	if apspeed > 0 then
		txt_set(txt_apspd, apspeed .. " kt")
	else
		txt_set(txt_apspd, " ")
	end
	
-- Autopilot altitude setting
	if apalt > 0 then
		txt_set(txt_apalt, apalt)
	else
		txt_set(txt_apalt, " ")
	end

-- Autopilot airspeed bug
	img_rotate(img_speedmarker, 180)
	y_speedmarker = ((apspeed - airspeed) * -6.6) + 296
	y_speedmarker = var_cap(y_speedmarker, -8, 553)
	if apspeed > 0 then
		move(img_speedmarker,nil,y_speedmarker,nil,nil)
	else
		move(img_speedmarker,nil,-8,nil,nil)
	end
end

-- Autopilot flight director --
function new_flight_director(state, pitch, roll)

-- Flight director visible
	visible(img_flightdirector, state == 1)

-- Flight director pitch and roll
	img_rotate(img_flightdirector, roll)

	pitch = var_cap(pitch,-35,35)
	radial = math.rad(roll * -1)
	x = -(math.sin(radial) * pitch * 12.7)
	y = (math.cos(radial) * pitch * 12.7)
	img_move(img_flightdirector, (x * -1) + 222, (y * -1) + 321, nil, nil)
	
end

-- Information bar center --
function new_infobarcenter(tas, gs, oat, winddir, windspd, heading, inhg)

-- True airspeed and ground speed
	txt_set(txt_tas, var_round(tas * 1.94384449, 0) .. " kt")
	txt_set(txt_gs, var_round(gs * 1.94384449, 0) .. " kt")
	
-- Outside air temperature
	txt_set(txt_oat, var_round(oat, 0) .. "\°c")
	
-- Wind direction and speed
	txt_set(txt_wind, var_round(winddir, 0) .. "\°/" .. var_round(windspd, 0) .. " kt")
	img_rotate(img_windarrow, (winddir + 180) - heading)
	
-- Barometric setting
	txt_set(txt_inhg, var_format(inhg, 2) .. " in")

end

-- Heading and turnrate indicator --
function new_heading(elecheading, turnrate)

-- Rotate compass
	img_rotate(img_compasrose, elecheading * -1)
	txt_set(txt_compheading, string.format("%03d" .. "\°", elecheading) )
	running_txt_move_carot(compass_inner_txt_id, (elecheading / 30) + 6)

-- Turn indicator
	
	turnrate = var_cap(turnrate, -20, 20)
	
	if turnrate > 0 then
		img_rotate(img_turnright, turnrate - 10)
	else
		img_rotate(img_turnright, -10)
	end
	
	if turnrate < 0 then
		img_rotate(img_turnleft, turnrate + 10)
	else
		img_rotate(img_turnleft, 10)
	end
	
end

function new_heading_FSX(elecheading, turnrate)

	new_heading(elecheading, turnrate * -40)
	
end

-- Vertical speed indicator --
function new_vsi(vs)
	
	if vs <= 600 and vs >= -600 then
		vsi = var_round(vs / 10, 0) * 10
	elseif vs > 600 or vs < -600 then
		vsi = var_round(vs / 100, 0) * 100
	end
	
	if vs >= 10 then
		txt_set(txt_vsi, "+" .. vsi)
	elseif vs <= -10 then
		txt_set(txt_vsi, vsi)
	else
		txt_set(txt_vsi, "0")
	end
	
end

-- Direction indicator (Credits go to macnfly for this code)
function new_HSI(heading, mode, crs, nav1hdef, nav2hdef, gpshdef, nav1vdef, nav2vdef, gpsvdef, nav1display, nav2display, apheading, elecheading, groundtrack)
    
    img_rotate(img_rose, -heading)
    
	nav1hdef = var_cap(nav1hdef, -2, 2)
	nav1vdef = var_cap(nav1vdef, -2, 2)
    if mode == 0 then 
        dh = nav1hdef*54 * math.cos((-heading+crs)*math.pi/180)
        dv = nav1hdef*54 * math.sin((-heading+crs)*math.pi/180)
        dm = nav1vdef*54
    end
    
	nav2hdef = var_cap(nav2hdef, -2, 2)
	nav2vdef = var_cap(nav2vdef, -2, 2)
    if mode == 1 then 
        dh = nav2hdef*54 * math.cos((-heading+crs)*math.pi/180)
        dv = nav2hdef*54 * math.sin((-heading+crs)*math.pi/180)
        dm = nav2vdef*54
    end
    
	gpshdef = var_cap(gpshdef, -2, 2)
	gpsvdef = var_cap(gpsvdef, -2, 2)
    if mode == 2 then 
        dh = gpshdef*54 * math.cos((-heading+crs)*math.pi/180)
        dv = gpsvdef*54 * math.sin((-heading+crs)*math.pi/180)
		dm = gpsvdef*54
    end
    
--    img_rotate(img_center, -heading+crs)
    img_rotate(img_needle, -heading+crs)
	--// Course text \\--
	txt_set(txt_course, string.format("%03d" .. "\°", crs) )
    img_rotate(img_center_needle, -heading+crs)
    img_move(img_center_needle, dh + 390, dv + 852, nil, nil)
    
    if nav1display > 0 or nav2display > 0 or mode == 2 then
        img_visible(img_center_needle, true)
    else
        img_visible(img_center_needle, false)
    end
	
	--// Heading text, AP heading dialled in and true heading, etc...\\--
	txt_set(txt_hdg, string.format("%03d" .. "\°", apheading) )
	img_rotate(img_headind, (elecheading - apheading) * -1)
	img_rotate(img_trueh, elecheading - groundtrack)
	
	if mode == 0 then
		txt_set(txt_source, "NAV1")
	elseif mode == 1 then
		txt_set(txt_source, "NAV2")
	elseif mode == 2 then
		txt_set(txt_source, "GPS1")
	else
		txt_set(txt_source, " ")
	end
	
end

function new_HSI_FSX(obs, tofrom, heading, glide, vertical, horizontal, apheading, elecheading, groundtrack)

	vertical = 4 / 119 * vertical
	horizontal = 4 / 127 * horizontal
	
	new_HSI(heading, 1, obs, 0, horizontal, 0, 0, vertical, 0, 0, 1, apheading, elecheading, groundtrack)

end

------------------------
-- Data bus subscribe --
------------------------
xpl_dataref_subscribe("sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot", "FLOAT",
					  "sim/cockpit/misc/radio_altimeter_minimum", "FLOAT",
					  "sim/flightmodel/misc/h_ind", "FLOAT", 
					  "sim/cockpit2/gauges/indicators/airspeed_kts_pilot", "FLOAT",
					  "sim/aircraft/view/acf_Vne", "FLOAT",
					  "sim/aircraft/view/acf_Vno", "FLOAT", 
					  "sim/cockpit/autopilot/altitude", "FLOAT", new_altitude)
fsx_variable_subscribe("RADIO HEIGHT", "FEET",
					   "INDICATED ALTITUDE", "FEET",
					   "AIRSPEED INDICATED", "KNOTS",
					   "AUTOPILOT ALTITUDE LOCK VAR", "FEET", new_altitude_FSX)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/flightmodel/position/phi", "FLOAT",
					  "sim/flightmodel/position/theta", "FLOAT", 
					  "sim/cockpit2/gauges/indicators/slip_deg", "FLOAT", new_attitude)
fsx_variable_subscribe("ATTITUDE INDICATOR BANK DEGREES", "Degrees",
					   "ATTITUDE INDICATOR PITCH DEGREES", "Degrees",
					   "INCIDENCE BETA", "Degrees", new_attitude_fsx)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit/autopilot/airspeed", "FLOAT", 
					  "sim/cockpit/autopilot/altitude", "FLOAT", 
					  "sim/cockpit2/gauges/indicators/airspeed_kts_pilot", "FLOAT", new_infobartop)
fsx_variable_subscribe("AUTOPILOT AIRSPEED HOLD VAR", "Knots",
					   "AUTOPILOT ALTITUDE LOCK VAR", "Feet",
					   "AIRSPEED INDICATED", "KNOTS", new_infobartop)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit/autopilot/autopilot_mode", "INT",
					  "sim/cockpit/autopilot/flight_director_pitch", "FLOAT",
					  "sim/cockpit/autopilot/flight_director_roll", "FLOAT", new_flight_director)
fsx_variable_subscribe("AUTOPILOT FLIGHT DIRECTOR ACTIVE", "BOOL",
					   "AUTOPILOT FLIGHT DIRECTOR PITCH", "DEGREES",
					   "AUTOPILOT FLIGHT DIRECTOR BANK", "DEGREES", new_flight_director)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/flightmodel/position/true_airspeed", "FLOAT",
					  "sim/flightmodel/position/groundspeed", "FLOAT",
					  "sim/cockpit2/temperature/outside_air_temp_degc", "FLOAT",
					  "sim/cockpit2/gauges/indicators/wind_heading_deg_mag", "FLOAT", 
					  "sim/weather/wind_speed_kt", "FLOAT",
					  "sim/cockpit/gyros/psi_ind_degm3", "FLOAT",
					  "sim/cockpit2/gauges/actuators/barometer_setting_in_hg_pilot", "FLOAT", new_infobarcenter)
fsx_variable_subscribe("AIRSPEED TRUE", "Meters per second",
					   "GPS GROUND SPEED", "Meters per second",
					   "AMBIENT TEMPERATURE", "Celsius",
					   "AMBIENT WIND DIRECTION", "Degrees", 
					   "AMBIENT WIND VELOCITY", "Knots",
					   "GPS GROUND TRUE HEADING", "Degrees",
					   "KOHLSMAN SETTING HG", "inHg", new_infobarcenter)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit/gyros/psi_ind_degm3", "FLOAT",
					  "sim/flightmodel/misc/turnrate_roll", "FLOAT", new_heading)
fsx_variable_subscribe("PLANE HEADING DEGREES GYRO", "Degrees", 
					   "PLANE BANK DEGREES", "radians", new_heading_FSX)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit2/gauges/indicators/vvi_fpm_pilot", "FLOAT", new_vsi)
fsx_variable_subscribe("VERTICAL SPEED", "Feet per minute", new_vsi)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit/gyros/psi_vac_ind_degm", "FLOAT",
              "sim/cockpit2/radios/actuators/HSI_source_select_pilot", "INT",
              "sim/cockpit2/radios/actuators/hsi_obs_deg_mag_pilot", "FLOAT",
              "sim/cockpit2/radios/indicators/nav1_hdef_dots_pilot", "FLOAT",
              "sim/cockpit2/radios/indicators/nav2_hdef_dots_pilot", "FLOAT",
              "sim/cockpit2/radios/indicators/gps_hdef_dots_pilot", "FLOAT",
              "sim/cockpit2/radios/indicators/nav1_vdef_dots_pilot", "FLOAT",
              "sim/cockpit2/radios/indicators/nav2_vdef_dots_pilot", "FLOAT",
              "sim/cockpit2/radios/indicators/gps_vdef_dots_pilot", "FLOAT", 
              "sim/cockpit2/radios/indicators/nav1_display_horizontal", "INT", 
              "sim/cockpit2/radios/indicators/nav2_display_horizontal", "INT",
			  "sim/cockpit/autopilot/heading_mag", "FLOAT", 
			  "sim/cockpit/gyros/psi_ind_degm3", "FLOAT",
			  "sim/flightmodel/position/psi", "FLOAT", new_HSI)
fsx_variable_subscribe("NAV OBS:2", "Degrees",
					   "NAV GS FLAG:2", "Bool",
					   "PLANE HEADING DEGREES GYRO", "Degrees",
					   "NAV HAS GLIDE SLOPE:2", "Bool", 
					   "NAV GSI:1", "Number",
					   "NAV CDI:1", "Number",
					   "AUTOPILOT HEADING LOCK DIR", "DEGREES",
					   "GPS GROUND TRUE HEADING", "DEGREES", 
					   "GPS GROUND TRUE TRACK", "DEGREES", new_HSI_FSX)