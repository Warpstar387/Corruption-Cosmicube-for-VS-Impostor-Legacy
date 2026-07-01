//script by nea
var floatRange = 14; 
var floatSpeed = 2.1; //these two are self-explanatory

function onUpdatePost(elapsed) {
    var songPos = Conductor.songPosition / 1000;
    
    var movement = Math.sin(songPos * floatSpeed) * floatRange;
    if (game.dad != null) {
        game.dad.y += (movement * elapsed * 10); // extend the range  of the floating EVEN FURTHER if you want it to be absurd. 10 is recommended bro.
    }
}