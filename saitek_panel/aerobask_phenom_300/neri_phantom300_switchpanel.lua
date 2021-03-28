--[[
	Neri's script for phantom300 xsaitek panels
--]]

if PLANE_ICAO == "E55P" then
	nrivar_batteries = 0
	nrivar_generators = 0
	nrivar_hyd_pump = 0
	nrivar_fuel_pump = 0
	nrivar_ice_protection = 0
	nrivar_heating = 0
	nrivar_bleeds = 0
	nrivar_panel = 0
	nrivar_starter = 0
	nrivar_beacon = 0
	nrivar_nav = 0
	nrivar_strobe = 0
	nrivar_taxi = 0
	nrivar_landing = 0

-- **** Starter Switch - ? ****
	function e55p_saitek_starter(position)
		-- ToDo
		nrivar_starter = position
	end
	create_command("neri/saitek/switch/starter/off", "NRI_Starter_Off","e55p_saitek_starter(0)", "", "")
	create_command("neri/saitek/switch/starter/right", "NRI_Starter_Right","e55p_saitek_starter(1)", "", "")
	create_command("neri/saitek/switch/starter/left", "NRI_Starter_Left","e55p_saitek_starter(2)", "", "")
	create_command("neri/saitek/switch/starter/both", "NRI_Starter_Both","e55p_saitek_starter(3)", "", "")
	create_command("neri/saitek/switch/starter/start", "NRI_Starter_Start","e55p_saitek_starter(4)", "", "")

-- **** Battery Switch - Batteries 1&2 ****
	function e55p_saitek_switch_battery_on()
		command_once("sim/electrical/battery_1_on")
		command_once("sim/electrical/battery_2_on")
		nrivar_batteries = 1
	end
	function e55p_saitek_switch_battery_off()
		command_once("sim/electrical/battery_1_off")
		command_once("sim/electrical/battery_2_off")
		nrivar_batteries = 0
	end
	create_command("neri/saitek/switch/bat_on", "NRI_Battery_On","e55p_saitek_switch_battery_on()", "", "")
	create_command("neri/saitek/switch/bat_off", "NRI_Battery_Off","e55p_saitek_switch_battery_off()", "", "")

-- **** Alternator Switch - Generators 1&2 ****
	function e55p_saitek_switch_generator_on()
		command_once("aerobask/electrical/gen1_auto")
		command_once("aerobask/electrical/gen2_auto")
		nrivar_generators = 1
	end
	function e55p_saitek_switch_generator_off()
		command_once("aerobask/electrical/gen1_off")
		command_once("aerobask/electrical/gen2_off")
		nrivar_generators = 0
	end
	create_command("neri/saitek/switch/alt_on", "NRI_Alternator_On","e55p_saitek_switch_generator_on()", "", "")
	create_command("neri/saitek/switch/alt_off", "NRI_Alternator_Off","e55p_saitek_switch_generator_off()", "", "")

-- **** Avionics Switch - Hydraulic Pumps 1&2 ****
	function e55p_saitek_switch_hydraulic_open()
		command_once("aerobask/hyd/pump1_up")
		command_once("aerobask/hyd/pump2_up")
		nrivar_hyd_pump = 1
	end
	function e55p_saitek_switch_hydraulic_close()
		command_once("aerobask/hyd/pump1_dn")
		command_once("aerobask/hyd/pump2_dn")
		nrivar_hyd_pump = 0
	end
	create_command("neri/saitek/switch/avionics_on", "NRI_Avionics_On","e55p_saitek_switch_hydraulic_open()", "", "")
	create_command("neri/saitek/switch/avionics_off", "NRI_Avionics_Off","e55p_saitek_switch_hydraulic_close()", "", "")

-- **** Fuel Pump Switch - Fuel Pumps 1&2 ****
	function e55p_saitek_switch_fuel_auto()
		command_once("aerobask/fuel/pump1_dn")
		command_once("aerobask/fuel/pump1_dn")
		command_once("aerobask/fuel/pump1_up")
		command_once("aerobask/fuel/pump2_dn")
		command_once("aerobask/fuel/pump2_dn")
		command_once("aerobask/fuel/pump2_up")
		nrivar_fuel_pump = 1
	end
	function e55p_saitek_switch_fuel_off()
		command_once("aerobask/fuel/pump1_dn")
		command_once("aerobask/fuel/pump1_dn")
		command_once("aerobask/fuel/pump2_dn")
		command_once("aerobask/fuel/pump2_dn")
		nrivar_fuel_pump = 0
	end
	create_command("neri/saitek/switch/fuel_on", "NRI_Fuel_Pump_On","e55p_saitek_switch_fuel_auto()", "", "")
	create_command("neri/saitek/switch/fuel_off", "NRI_Fuel_Pump_Off","e55p_saitek_switch_fuel_off()", "", "")

-- **** Deice Switch - Ice Protection Panel ****
	function e55p_saitek_switch_iceprot_on()
		command_once("aerobask/iceprot/eng1_on")
		command_once("aerobask/iceprot/eng2_on")
		command_once("aerobask/iceprot/wingstab_up")
		command_once("aerobask/iceprot/wingstab_up")
		nrivar_ice_protection = 1
	end
	function e55p_saitek_switch_iceprot_off()
		command_once("aerobask/iceprot/eng1_off")
		command_once("aerobask/iceprot/eng2_off")
		command_once("aerobask/iceprot/wingstab_up")
		command_once("aerobask/iceprot/wingstab_up")
		command_once("aerobask/iceprot/wingstab_dn")
		nrivar_ice_protection = 0
	end
	create_command("neri/saitek/switch/deice_on", "NRI_Deice_On","e55p_saitek_switch_iceprot_on()", "", "")
	create_command("neri/saitek/switch/deice_off", "NRI_Deice_Off","e55p_saitek_switch_iceprot_off()", "", "")

-- **** Pitot Switch - Heating Panel ****
	function e55p_saitek_switch_heating_on()
		command_once("aerobask/iceprot/ads_probes_lt")
		command_once("aerobask/iceprot/ads_probes_lt")
		command_once("aerobask/iceprot/ads_probes_rt")
		command_once("aerobask/iceprot/wshld1_on")
		command_once("aerobask/iceprot/wshld2_on")
		nrivar_heating = 1
	end
	function e55p_saitek_switch_heating_off()
		command_once("aerobask/iceprot/ads_probes_lt")
		command_once("aerobask/iceprot/ads_probes_lt")
		command_once("aerobask/iceprot/wshld1_off")
		command_once("aerobask/iceprot/wshld2_off")
		nrivar_heating = 0
	end
	create_command("neri/saitek/switch/pitot_on", "NRI_Pitot_On","e55p_saitek_switch_heating_on()", "", "")
	create_command("neri/saitek/switch/pitot_off", "NRI_Pitot_Off","e55p_saitek_switch_heating_off()", "", "")

-- **** Cowl Switch - Pneumatic Panel & Pressurization Panel ****
	function e55p_saitek_switch_bleeds_on()
		command_once("aerobask/bleed/bleed1_auto")
		command_once("aerobask/bleed/bleed2_auto")
		command_once("aerobask/bleed/xbleed_auto")
		command_once("aerobask/press/ecs_rt")
		command_once("aerobask/press/ecs_rt")
		command_once("aerobask/press/ecs_rt")
		command_once("aerobask/press/ecs_lt")
		command_once("aerobask/press/mode_up")
		command_once("aerobask/airco/mode_dn")
		command_once("aerobask/airco/mode_dn")
		command_once("aerobask/airco/mode_up")
		nrivar_bleeds = 1
	end
	function e55p_saitek_switch_bleeds_off()
		command_once("aerobask/bleed/bleed1_off")
		command_once("aerobask/bleed/bleed2_off")
		command_once("aerobask/bleed/xbleed_off")
		command_once("aerobask/press/ecs_lt")
		command_once("aerobask/press/ecs_lt")
		command_once("aerobask/press/ecs_lt")
		command_once("aerobask/press/mode_dn")
		command_once("aerobask/airco/mode_dn")
		command_once("aerobask/airco/mode_dn")
		nrivar_bleeds = 0
	end
	create_command("neri/saitek/switch/cowl_open", "NRI_Cowl_Open","e55p_saitek_switch_bleeds_on()", "", "")
	create_command("neri/saitek/switch/cowl_close", "NRI_Cowl_Close","e55p_saitek_switch_bleeds_off()", "", "")

-- **** Panel Lights Switch - Panel Lights ****
	function e55p_saitek_switch_panel_bright()
		-- ToDo
		-- set("sim/flightmodel2/lights/generic_lights_brightness_ratio", 1.0)
		nrivar_panel = 1
	end
	function e55p_saitek_switch_panel_off()
		-- ToDo
		-- set("sim/flightmodel2/lights/generic_lights_brightness_ratio", 0.0)
		nrivar_panel = 0
	end
	create_command("neri/saitek/switch/lights/panel_on", "NRI_Panel_Lights_On","e55p_saitek_switch_panel_bright()", "", "")
	create_command("neri/saitek/switch/lights/panel_off", "NRI_Panel_Lights_Off","e55p_saitek_switch_panel_off()", "", "")

-- **** Beacon Light Switch - ? ****
	function e55p_saitek_switch_beacon_on()
		-- ToDo
		nrivar_beacon = 1
	end
	function e55p_saitek_switch_beacon_off()
		-- ToDo
		nrivar_beacon = 0
	end
	create_command("neri/saitek/switch/lights/beacon_on", "NRI_Beacon_Light_On","e55p_saitek_switch_beacon_on()", "", "")
	create_command("neri/saitek/switch/lights/beacon_off", "NRI_Beacon_Light_Off","e55p_saitek_switch_beacon_off()", "", "")

-- **** Nav Light Switch - Nav Lights ****
	function e55p_saitek_switch_nav_on()
		command_once("sim/lights/nav_lights_on")
		nrivar_nav = 1
	end
	function e55p_saitek_switch_nav_off()
		command_once("sim/lights/nav_lights_off")
		nrivar_nav = 0
	end
	create_command("neri/saitek/switch/lights/nav_on", "NRI_Nav_Light_On","e55p_saitek_switch_nav_on()", "", "")
	create_command("neri/saitek/switch/lights/nav_off", "NRI_Nav_Light_Off","e55p_saitek_switch_nav_off()", "", "")

-- **** Strobe Light Switch - Strobe Lights ****
	function e55p_saitek_switch_strobe_on()
		command_once("sim/lights/strobe_lights_on")
		nrivar_strobe = 1
	end
	function e55p_saitek_switch_strobe_off()
		command_once("sim/lights/strobe_lights_off")
		nrivar_strobe = 0
	end
	create_command("neri/saitek/switch/lights/strobe_on", "NRI_Strobe_Light_On","e55p_saitek_switch_strobe_on()", "", "")
	create_command("neri/saitek/switch/lights/strobe_off", "NRI_Strobe_Light_Off","e55p_saitek_switch_strobe_off()", "", "")

-- **** Taxi Light Switch - Taxi Lights ****
	function e55p_saitek_switch_taxi_on()
		if nrivar_landing == 0 then
			command_once("aerobask/lights/ldg_taxi_dn")
			command_once("aerobask/lights/ldg_taxi_dn")
			command_once("aerobask/lights/ldg_taxi_up")
		end
		nrivar_taxi = 1
	end
	function e55p_saitek_switch_taxi_off()
		if nrivar_landing == 0 then
			command_once("aerobask/lights/ldg_taxi_dn")
			command_once("aerobask/lights/ldg_taxi_dn")
		end
		nrivar_taxi = 0
	end
	create_command("neri/saitek/switch/lights/taxi_on", "NRI_Taxi_Light_On","e55p_saitek_switch_taxi_on()", "", "")
	create_command("neri/saitek/switch/lights/taxi_off", "NRI_Taxi_Light_Off","e55p_saitek_switch_taxi_off()", "", "")

-- **** Landing Light Switch - Landing Lights ****
	function e55p_saitek_switch_landing_on()
		command_once("aerobask/lights/ldg_taxi_up")
		command_once("aerobask/lights/ldg_taxi_up")
		nrivar_landing = 1
	end
	function e55p_saitek_switch_landing_off()
		if nrivar_taxi == 1 then
			command_once("aerobask/lights/ldg_taxi_up")
			command_once("aerobask/lights/ldg_taxi_up")
			command_once("aerobask/lights/ldg_taxi_dn")
		else
			command_once("aerobask/lights/ldg_taxi_dn")
			command_once("aerobask/lights/ldg_taxi_dn")
		end
		nrivar_landing = 0
	end
	create_command("neri/saitek/switch/lights/landing_on", "NRI_Landing_Light_On","e55p_saitek_switch_landing_on()", "", "")
	create_command("neri/saitek/switch/lights/landing_off", "NRI_Landing_Light_Off","e55p_saitek_switch_landing_off()", "", "")

-- **** Landing Gear Up - Landing Gear ****
	function e55p_saitek_gear_up()
		command_once("sim/flight_controls/landing_gear_up")
		nrivar_gear = 0
	end
	function e55p_saitek_gear_down()
		command_once("sim/flight_controls/landing_gear_down")
		nrivar_gear = 1
	end
	create_command("neri/saitek/switch/gear_up", "NRI_Landing_Gear_Up","e55p_saitek_gear_up()", "", "")
	create_command("neri/saitek/switch/gear_down", "NRI_Landing_Gear_Down","e55p_saitek_gear_down()", "", "")




end