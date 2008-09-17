From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Sep 2008 14:34:27 +0200
Subject: [Buildroot] Login on a ttyS fails
In-Reply-To: <1221654253.30276.18.camel@chip.lis.inpg.fr> (=?utf-8?Q?=22St?=
	=?utf-8?Q?=C3=A9phane?= Mancini"'s message of "Wed\,
	17 Sep 2008 14\:24\:13 +0200")
References: <1221579108.7973.21.camel@chip.lis.inpg.fr>
	<873ak07x9m.fsf@macbook.be.48ers.dk>
	<1221648506.30276.10.camel@chip.lis.inpg.fr>
	<874p4f2elw.fsf@macbook.be.48ers.dk>
	<1221652957.30276.16.camel@chip.lis.inpg.fr>
	<1221654253.30276.18.camel@chip.lis.inpg.fr>
Message-ID: <8763ov0x4c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "St?phane" == St?phane Mancini <stephane.mancini@grenoble-inp.fr> writes:

 St?phane> Well, I've tried to launch ash after the boot instead of init.
 St?phane> I get a kernel panic :

 St?phane> init has generated signal 4 but has no handler for it

 St?phane> Kernel panic - not syncing: Attempted to kill init!

 St?phane> Rebooting in 180 seconds..

Did you by any change configure buildroot for hardware floating point
and not enable the FPU emulation in the kernel?

-- 
Bye, Peter Korsgaard
