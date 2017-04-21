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
var word = axiom
var lineLength = 300
let angle = 60
var n = 3

LindenmayerSystem.init(axiom: "F++F++F", rule: "F-F++F-F", lineLength: 300, n: 3, angle: 60, x: 100, y: 100)
if n > 0 {
    for generation in 1...n {
        var newWord = ""
        
        for character in word.characters {
            if character == "F" {
                newWord.append(rule)
            } else {
                newWord.append(character)
            }
        }
        
        word = newWord
        lineLength = lineLength/3
    }
}
canvas.translate(byX: 100, byY: 100)
canvas.saveState()

for char in word.characters {
    if char == "F" {
        canvas.drawLine(fromX: 0, fromY: 0, toX: lineLength, toY: 0)
        canvas.translate(byX: lineLength, byY: 0)
    }
    else if char == "+" {
        canvas.rotate(by: Degrees(angle))
    }
    else if char == "-" {
        canvas.rotate(by: -(Degrees)(angle))
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
