From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Feb 2009 12:03:06 +0100
Subject: [Buildroot] 2009.02-rc3 released
In-Reply-To: <3465FC6D-040F-475F-8AFA-BB3F1F0C7E5E@arcormail.de> (Claus
	Klein's message of "Sat\, 7 Feb 2009 23\:10\:44 +0100")
References: <87skmyirxq.fsf@macbook.be.48ers.dk>
	<3465FC6D-040F-475F-8AFA-BB3F1F0C7E5E@arcormail.de>
Message-ID: <87fxip8a39.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Claus" == Claus Klein <claus.klein@arcormail.de> writes:

 Claus> Hi,
 Claus> I  tried to build the default busybox on mac-OX, but it failed.

 Claus> A year ago, I tried to build a buildsystem based on a minmal system
 Claus> like DSL using busybox tools.
 Claus> but it failed too.

 Claus> I want to build a cross-development tool-chain and the embedded
 Claus> destination system at a small virtual vmware image.

 Claus> So I want to ask if it is possible to use only posix conform options
 Claus> when building a system with buildroot?
 Claus> At leased, the options available at the busybox should be enough, or
 Claus> not?

Sure, but as none of the regular BR developers build on macosx,
chances are that you'll find broken stuff. Cleanup patches are
ofcourse welcome.

 Claus> And to start, there is a small patch to fix my first problem I had:

I cleaned up the sed invocation instead in r25264, could you give it a
try please?

-- 
Bye, Peter Korsgaard
