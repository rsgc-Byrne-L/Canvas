/*:
 
 # Canvas
 
 The Canvas class provides methods that allow basic shapes to be drawn on a Cartesian plane.
 
 - callout(Experiment):
 
    Uncomment line 27 so that the axes of the plane are automatically drawn.
 
    Where is the origin?
 
    In what direction do values on the *x* and *y* axes increase?
 
 */
// These are some required statements to make this playground work.
import Cocoa
import PlaygroundSupport

// Create a new canvas
let canvas = Canvas(width: 500, height: 500)

// View the current state of the canvas
canvas

// Draw the axes
canvas.drawAxes()

// Add code below...
let axiom = "F++F++F"
let rule = "F-F++F-F"
let word = "F-F++F-F++F-F++F-F++F-F++F-F++F-F"
canvas.translate(byX: 0, byY: 100)
canvas.saveState()

for char in word.characters {
    if char == "F" {
        canvas.drawLine(fromX: 0, fromY: 0, toX: 100, toY: 0)
        canvas.translate(byX: 100, byY: 0)
    }
    if char == "+" {
        canvas.rotate(by: 60)
    }
    if char == "-" {
        canvas.rotate(by: -60)
    }
}

canvas.restoreState()
/*:
 
 ## To see output
 
 To see output, ensure that you have enabled the Assistant Editor...
 
 ![assistant-editor](assistant-editor.png "Enable the Assistant Editor")
 
 ... and verify that you have selected the *Timeline* option:
 
 ![timeline-option](timeline-option.png "Show the timeline")
 
 Finally, do not remove the following line of code:

 */
PlaygroundPage.current.liveView = canvas.imageView
