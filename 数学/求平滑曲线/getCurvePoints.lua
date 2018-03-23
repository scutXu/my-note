function getCurvePoints(pts, tension, isClosed, numOfSegments)
	local _pts = {}
	for k, v in pairs(pts) do
		_pts[k] = v
	end

	if isClosed then
		table.insert(_pts, 1, pts[#pts])
		table.insert(_pts, 1, pts[#pts - 1])
		table.insert(_pts, 1, pts[#pts])
		table.insert(_pts, 1, pts[#pts - 1])
		table.insert(_pts, pts[1])
		table.insert(_pts, pts[2])
	else
		table.insert(_pts, 1, pts[2])
		table.insert(_pts, 1, pts[1])
		table.insert(_pts, pts[#pts - 1])
		table.insert(_pts, pts[#pts])
	end

	local x, y, t1x, t2x, t1y, t2y, c1, c2, c3, c4, st
	local res = {}

	for i = 3, (#_pts - 5), 2 do
		for t = 0, numOfSegments do
            t1x = (_pts[i+2] - _pts[i-2]) * tension
            t2x = (_pts[i+4] - _pts[i]) * tension

            t1y = (_pts[i+3] - _pts[i-1]) * tension
            t2y = (_pts[i+5] - _pts[i+1]) * tension

            st = t / numOfSegments;

            c1 =   2 * math.pow(st, 3)  - 3 * math.pow(st, 2) + 1; 
            c2 = -(2 * math.pow(st, 3)) + 3 * math.pow(st, 2); 
            c3 =       math.pow(st, 3)  - 2 * math.pow(st, 2) + st; 
            c4 =       math.pow(st, 3)  -     math.pow(st, 2);

            x = c1 * _pts[i]    + c2 * _pts[i+2] + c3 * t1x + c4 * t2x;
            y = c1 * _pts[i+1]  + c2 * _pts[i+3] + c3 * t1y + c4 * t2y;

            res[#res + 1] = x
            res[#res + 1] = y
		end
	end

	return res
end