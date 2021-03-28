local socket = require "socket"
local udp = assert(socket.udp())

ip = "192.168.1.202"
port = 11000

dataref("dome_switch", "laminar/B738/toggle_switch/cockpit_dome_pos", "readonly")
dataref("battery_switch" ,"laminar/B738/electric/battery_pos", "readonly")
last_state = ""

function send_udp_state()
	-- check dome light state (battery on, dome switch bright or dim)
	state = last_state
	if battery_switch == 1 and dome_switch == -1 then
		state = "bright"
	elseif battery_switch == 1 and dome_switch == 1 then
		state = "dim"
	else
		state = "off"
	end

	if state ~= last_state then
		assert(udp:sendto("{\"ref\":\"dome_light\", \"value\":\"" .. state .. "\"}", ip, port))
		last_state = state
	end
end

function cleanup()
	assert(udp:close())
end

do_every_frame("send_udp_state()")
--do_often("send_udp_state()")
do_on_exit("cleanup()")