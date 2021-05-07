// Tip: hover over a word and use CTRL/CMD + D to see its documentation...

// ########################## SynthDefs ###########################
// ################################################################


// More about Synethesis Definitions: https://composerprogrammer.com/teaching/supercollider/sctutorial/3.2%20SynthDefs.html


// There are a couple built in SynthDefs in SuperCollider. 
// This one generates WhiteNoise and wrapped in a low pass filter to suit your ears. 
// Finally the result is displayed with .scope

{LPF.ar(WhiteNoise.ar(0.1),1000)}.scope

// You can also define your own. This SynthDef Out(puts). 
// You can then call it with Synth. 
// Try alternativing between the two since it produces a Rand pitch every time.

SynthDef(\sine, {Out.ar(0,SinOsc.ar(Rand(440,880),0,0.1))}).add; 

Synth(\sine);


/* This one-liner by Lance Putnam is an example of SuperCollider’s expressive power. It modulates the pitch of a single sine-wave oscillator.*/

play{SinOsc.ar(OnePole.ar(Mix(
    LFSaw.ar([1,0.99],[0,0.6],2000,2000).trunc([400,600])*[1,-1]
),0.98)).dup*0.1}



// ########################### Patterns ###########################
// ################################################################


(
// Pdef ensures that when we rerun the code then it doesn't create a new event but changes the existing event
Pdef(\technoTune,
	// Binds value patterns to a single event stream
	Pbind(
		// dictionary / list where first is a key and second element is the value
		\stretch, 0.25,
		\dur, 1,           // it plays the sequence infinitely
		\degree, Pseq([0, [0, 3, 2], [5, 7, 2], 1], inf),
	)
).play
)

// More about patterns: https://composerprogrammer.com/teaching/supercollider/sctutorial/9.2%20Patterns.html

(
Pdef(\technoTune,
	Pbind(
		\stretch, 0.25,
		\scale, Scale.egyptian,
		\dur, Pseq([1, 1/2, Rest(0.25), 1/4], inf),
		\degree, [0, 3, 5] + Pbrown(0, 10, 1),
		\sustain, 1,
		\release, 4
	)
).play
)

(
// Uses midinotes, inline instrument definition and looping through \pan
Pbind(
	\dur, 1.25,
	\midinote, Pseq([0,5,0,7,4,0,0]+60,inf),
	\amp, Prand([0.125,0.2,0.25],inf),
	\instrument, Pseq([\nickinstr,\default],inf),
	\pan, Prand([-1,0,1],inf)
).play

)


// Using Ppar allows for two voices (polyphony)
(
	var melodypat, basspat;
	melodypat = Pbind(
			[\midinote, \dur],
			Pseq([
				[60, 0.75],[64, 0.5],[66, 0.5],[69, 0.25],
				[67,0.75],[64,0.5],[60,0.5],[57,0.25]
			],inf)
	);
	basspat = Pbind(

			\midinote, Pseq([48, 42], inf),
			\dur, 1
	);
	Ppar([ melodypat, basspat ]).play(TempoClock(1));
)



// ######################## Programming ###########################
// ################################################################

// loops
(
{
	5.do {|i|
		("Iteration"+i).postln;
	}
}.fork(TempoClock(1))
)

// infinite loops are possible
(
{
	SynthDef(\sine, {Out.ar(0,SinOsc.ar(Rand(440,880),0,0.1))}).add; 

	inf.do {
		Synth(\sine);
		// calling wait is crucial otherwise it tries to play infinite amount of notes immediately and crashes
		1.wait;
	}
}.fork(TempoClock(0.5))
)



// A sequence is evaluated as a stream
// can't be evaluated in a block - run each step
p = Pseq((1..10)).postln
p = p.asStream
p.next

