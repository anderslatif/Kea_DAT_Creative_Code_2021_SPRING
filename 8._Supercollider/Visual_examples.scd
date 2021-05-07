// ############################# Plot #############################
// ################################################################

Env([1,0,1],[1,1]).plot  //This makes an Envelope with three control points, at y positions given by the first array, and separated in x by the values in the second (see the Env help file). The curve drawn out should actually look like a letter envelope!

// plot an envelop
Env.perc(0.05,0.5,1.0,0).plot //arguments attackTime, releaseTime, level, curve: good for percussive hit envelopes

Env.adsr(0.1, 0.5, 0.5, 0.1, 1.0, 0).plot  //attackTime, decayTime, sustainLevel, releaseTime, peakLevel, curve
//note that the sustain portion is not shown in time; this particular envelope type deals with variable hold times, and the hold is missed out in the plot


// ####################### Mouse + Scope ##########################
// ################################################################

{SinOsc.ar(440, mul: -20.dbamp)}.scope

// Simple mouse event on the X-axis
{Dust.ar(MouseX.kr(1,100))}.play

// Visualize the sinus wave with scope
{SinOsc.ar(mul:MouseY.kr(1.0,0.1))}.scope

(
{
	//cutoff values need to be sensible frequencies in Hz; here sine output turned from -1 to 1 into 2000+-1700
	var cutoff = 	SinOsc.ar(1,mul:MouseX.kr(0.0,1700.0), add:2000.0);
	//var cutoff = SinOsc.ar(1)*1700.0 + 2000.0;  //same thing
	LPF.ar(WhiteNoise.ar,freq:cutoff);
}.scope
)



