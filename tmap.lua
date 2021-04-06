--[[

zlib License

(C) 2021 Bowuigi

This software is provided 'as-is', without any express or implied
warranty.  In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation would be
   appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.

]]

local tmap={}

function tmap.new(w,h,fill)
	w=math.floor(w)
	h=math.floor(h)
	fill=tostring(fill)
	
	local tilemap={}

	for y=1,h do
		tilemap[y]={}
		for x=1,w do
			tilemap[y][x]=fill
		end
	end

	return tilemap,w,h
end

function tmap.getTile(tilemap,x,y)
	x=math.floor(x)
	y=math.floor(y)
	if not tmap.tileExists(tilemap,x,y) then error("TMAP library: Tile "..x..","..y.." of the given tilemap does not exist") end

	return tilemap[y][x]
end

function tmap.setTile(tilemap,x,y,tile)
	x=math.floor(x)
	y=math.floor(y)
	if not tmap.tileExists(tilemap,x,y) then error("TMAP library: Tile "..x..","..y.." of the given tilemap does not exist") end

	tilemap[y][x]=tile
end

function tmap.tileExists(tilemap,x,y)
	x=math.floor(x)
	y=math.floor(y)
	if x<1 or y<1    then return false end
	if #tilemap<y    then return false end
	if #tilemap[y]<x then return false end
	return true
end

function tmap.copy(tilemap)
	local tmp = {}

	for y=1,#tilemap do
		tmap[y]={}
		for x=1,#tilemap[y] do
			tmp[y][x]=tilemap[y][x]
		end
	end

	return tmp
end

function tmap.print(tilemap)
	for y=1,#tilemap do
		for x=1,#tilemap[y] do
			io.write(tilemap[y][x])
		end
		io.write("\n")
	end
end

return tmap
