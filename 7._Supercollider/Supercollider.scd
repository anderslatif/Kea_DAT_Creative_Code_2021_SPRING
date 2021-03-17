
// ########################## SynthDefs ###########################
// ################################################################


// More about Synethesis Definitions: https://composerprogrammer.com/teaching/supercollider/sctutorial/3.2%20SynthDefs.html

// A SynthDef defines and generates a random hertz pitch pattern (notice the values of .ar()). The followihng line calls it.
{LPF.ar(WhiteNoise.ar(0.1),1000)}.scope

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
		\dur, 1,
		\degree, Pseq([0, [0, 3, 2], [5, 7, 2], 1], inf),
	)
).play
)

// More about patterns: https://composerprogrammer.com/teaching/supercollider/sctutorial/9.2%20Patterns.html
// try CTRL/CMD + D on a keyword to see its documentation... try with Pbind
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
// Calling bind with variable synth and using midinotes.
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
{
	5.do {|i|
		("Iteration"+i).postln;
	}
}.fork(TempoClock(1))


(
{
	inf.do {
		s.bind{Synth(\beep,[\freq, 440,\amp,0.1,\pan,0])};
		1.wait;
	}
}.fork(TempoClock(0.5))
)



// A sequence is evaluated as a stream
p = Pseq((1..10)).postln
p = p.asStream
p.next
















