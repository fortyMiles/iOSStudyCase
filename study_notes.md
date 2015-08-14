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
	> Don't confuse frame and center, which are about positioning, with bound which is your size and area that you're drawing into your 
	> coordinate syste.

* Customer Views
	
> To draw just create a UIView subclass and override drawRect.

> *Never* call _drawRect()_

* tuple

	let s = "howday"

	for (ix, c) in enumerate(s){
		println("character \(ix) is \(c)")
	}

* Optional

Just as an Optional wrapping a String can be expressed as String?, an implicity unwrapped Optional wrapping a String can be expressed as String!. 

You cannot send a message to an Optional without unwrapping it. Optionals themselves don't respond to any messages.

One very important purpose of Optional is to provide _interchange of object of Object-C_. Because in Object-C, _any_ object reference can be nil. You thus need a way to send nil to Object-C and to receive nil from Objective-C. From Swift's point of view, strictly speaking, _all_ Object-C objects are Optionals.



笔记记录

