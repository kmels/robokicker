canvas = document.getElementById("canvas");
field = document.getElementById("field");
robot = document.getElementById("robot");
ctx = canvas.getContext("2d");

mkImagePattern = (img) -> ctx.createPattern(img, 'repeat');

fillPattern = (pattern, xi, yi, xf, yf) ->
    ctx.rect(xi,yi,xf,yf)
    ctx.fillStyle = pattern
    ctx.fill();

paintField = () -> fillPattern(mkImagePattern(field), 0, 0, canvas.width, canvas.height)

drawRobot = (degrees) ->
    image = robot
    ctx.save();
    ctx.translate(canvas.width/2,canvas.height/2);
    ctx.rotate(degrees*Math.PI/180);
    ctx.drawImage(image,-image.width/2,-image.width/2);
    ctx.restore();

window.onload = () ->
    paintField();
    drawRobot(-22)
    #positionateRandomly(robot)

robot.angles = 0

paint = () ->
    console.log "painting"
    paintField()
    drawRobot(robot.angles);
    robot.angles += 3

setInterval(paint,25)
