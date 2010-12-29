From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 29 Dec 2010 17:26:20 -0600
Subject: [Buildroot] oprofile "requires" gmp???
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com><20101223082740.3a8e44c4@surf><9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com>	<20101224090517.0c935c19@surf>	<9AC3F0E75060224C8BBC5BA2DDC8853A1EA2689B@EXV1.corp.adtran.com>
	<4D18D7B3.3020900@zacarias.com.ar>
	<4D18D873.9010502@zacarias.com.ar>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB132@EXV1.corp.adtran.com>
	<4D19E079.9030704@zacarias.com.ar> 
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBC41@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Original Message-----
> From: ANDY KENNEDY
> Sent: Wednesday, December 29, 2010 4:42 PM
> To: 'buildroot at busybox.net'
> Subject: RE: [Buildroot] oprofile "requires" gmp???
> 
> > Okay, that fixed all the toolchain deps.  Everything looks  good in
> the
> > new toolchain when compiling with Linux Stable threads, however, it
> > will not build with Native Posix threads.  I'll work with that later
> to
> > give you more information as to what is broken and maybe a way to
> fix.
> 
> <snip>
> 
> > Still poking around, will post more when I have it.
> >
> > Andy
> 
> Strange.  I built earlier today and I get an error on every file that
> includes limits.  I did a make clean, make menuconfig and select linux
> threads stable, change the build options to 50 simultaneous jobs and I
> don't get the errors on the limits not having the PATH_MAX and
> PIPE_BUF.
> 
> Now, I must attempt this again with 2 jobs as I was doing earlier when
> I got this.  Is there something that oprofile depends on that is being
> built out-of-order with 2 jobs vs. 50?
> 
> Whether it breaks again, I'll let you know.
> 
> Andy


oprofile builds just fine -- no errors with the limits include this time
either.  Guess the other was a fluke?
