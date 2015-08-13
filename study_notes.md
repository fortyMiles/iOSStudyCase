# IOS Study Notes

>> 2015-Aug-13 Thu Cloudy and Raining

How do we draw and handle events in this rectangular area. we need a coordinate system to work in.

First of all, all coordiantes are goona be CGFloat. CGFloat is a type im Swift struct. And always use CGFloat when you're drawing or handing events in view.  Do not use Double Do not use Float.

	let cfg = CGFloat(aDouble)

	var point = CGPoint(x: 37.0, y:55.2)
	
	point.x -= 30
	point.y += 20.0
	
	var size = CGSize(width:100.0, height:50.0)
	size.width += 42.5
	size.height += 40


When we combine the CGPoint, and CGFloat => CGRect

	struct CGRect{
		var origin: CGPoint
		var size: CGSize
	}

	let rect = CGRect(origin: aCGPoint, size: aCGSize)


* View Coordiante System

	* Origin is upper left.
	* Units are points, not pixels
		
	> iOS will handle this, how many pixel included in one points. 
	> If we want to see how many pixels in one points, we could use _contentScaleFactor_

测试文档
