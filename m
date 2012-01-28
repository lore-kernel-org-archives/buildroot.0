From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 28 Jan 2012 22:36:29 +0100
Subject: [Buildroot] Gdb(server) on ARM and uClibc
In-Reply-To: <CAE4k23-gErY-gcTnjN1Ldeo6Qv=+ze4OFrMui-sw5HfP0R=9Kw@mail.gmail.com>
 (Anders Darander's message of "Sat, 28 Jan 2012 21:04:01 +0100")
References: <CAE4k23-gErY-gcTnjN1Ldeo6Qv=+ze4OFrMui-sw5HfP0R=9Kw@mail.gmail.com>
Message-ID: <87fwezjyqq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anders" == Anders Darander <anders.darander@gmail.com> writes:

Hi,

 Anders> Hi,
 Anders> I'm probably missing something simple when it comes to my
 Anders> uClibc-configuration... (Or is there still problems with gdb on uClibc
 Anders> and ARM?)

 Anders> I'm getting "error: No uintptr_t available; your C library is too
 Anders> old." when I'm compiling uClibc. I've tried both 7.2.x and 7.3.x. Next

I'm getting confused. Are you talking about uClibc or gdb here?

 Anders> step will be to merge the tree I've based my work on sofar with
 Anders> master, and try 7.4, however I doubt that it'll help me... (I've sofar
 Anders> based this work on the tree
 Anders> https://github.com/fhunleth/buildroot-beaglebone.git, as I'm working
 Anders> on a beaglebone. I know that the tree in question is getting close to
 Anders> 2 months behind master now, but apart from the 7.4 inclusion, I
 Anders> haven't seen anything in the git log that I immediately recognize as a
 Anders> potential solution).

I recently fixed a fairly serious gdb issue (afb6e3ed52142e), but that
doesn't sound the problem you're having.

I'll be starting an am335x based project soon, so I plan on integrating
am335x / beaglebone support into mainline.

 Anders> Any ideas were to start looking?
 Anders> I've mostly been out of the buildroot world for a 1 1/2 year, working
 Anders> on OE instead.

Welcome back then ;)

-- 
Bye, Peter Korsgaard
