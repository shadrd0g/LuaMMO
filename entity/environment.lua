--- Environment module



Time = {}
Weather = {}
Additional = {}

function Time:init()

	h = 0 --
	m = 0 -- Set the variables to zero
	mS = 0	  --


end


function Time:setTime(h,m)

	hours = h
	minutes = m -- Change the time with a special method

	print("Set time to"..h..":"..m)

end

function Time:update(dt)

end

function Time:counter()

	if mS == 60 then

		m = m + 1
		mS = 0

	end

	if m == 60 then

		m = 0
		h = h + 1

	end

	if h == 24 then

		h = 0

	end


	mS = mS + 1


	love.graphics.print("Time: "..h..":"..m,5,35) -- Print the current time

end

function Weather:init()

	love.audio.setVolume(0.1)

	rain_sound = love.audio.newSource("sounds/rain.wav","static")


	clear = false
	rain = false
	storm = false
	wind = false

	sec = 0

end

function Weather:type( input )

	if input == clear then
		clear = true
		rain = false
		storm = false
		wind = false
	elseif input == rain then
		clear = false
		rain = true
		storm = false
		wind = false
	end



end

function Weather:draw()

	rain = true

	firstX = math.random() * 100 + math.random() * 100
	firstY = math.random() * 200 + math.random() * 200

	secondX = math.random() * 200 + math.random() * 200
	secondY = math.random() * 200 + math.random() * 200

	thirdX = math.random() * 300 + math.random() * 300
	thirdY = math.random() * 300 + math.random() * 300

	if rain == true then

		love.graphics.setColor(0, 0, 255)
		love.graphics.line( firstX, firstY ,firstX-3, firstY + 2)
		love.graphics.line( secondX, secondY ,secondX-3 , secondY + 2)
		love.graphics.line( thirdX, thirdY ,thirdX-3, thirdY + 2)
		love.graphics.setColor(255, 255, 255)


	end

end

function Weather:sound()


  if rain == true then

	sec = sec + 1

	if sec == 1 then

		rain_sound:play()
		sec = 0
	end

	if sec == 60 then

		rain_sound:stop()
		sec = 0
	end


   end



end
