mon = peripheral.wrap("top")

function open()
	if rednet.isOpen() == false then
		rednet.open("left")
	else
		active()
end

function active()
	rednet.send(202, "I'm Online!")
end

os.sleep(5)

function wait()
	mon.clear()
	mon.setBackgroundColor(colors.green)
	mon.setTextScale()
	mon.setCursorPos(2, 3)
	mon.wrtie("Ready")
	touch()
end

function touch()
	if os.pullEvent("monitor_touch") then
		redstone.setOutput("top", 16)
		os.sleep(3)
		mon.clear()
		mon.setBackgroundColor(colors.red)
		mon.term.setCursorPos(1, 3)
		mon.write("Working")
	end
	if os.pullEvent("monitor_touch") then
		redstone.setOutput("top", 0)
		os.sleep(3)
		wait()
	end
end