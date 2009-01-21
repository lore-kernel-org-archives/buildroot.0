From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 21:12:25 +0100
Subject: [Buildroot] List of working packages for ARM
In-Reply-To: <1232568463.11888.74.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Wed\, 21 Jan 2009 21\:07\:43 +0100")
References: <1232523725.11888.11.camel@elrond.atmel.com>
	<87skncsurl.fsf@macbook.be.48ers.dk>
	<1232568463.11888.74.camel@elrond.atmel.com>
Message-ID: <87prigpgeu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> mk	libconfuse                     FAIL	"error: 'input' defined but not used"
 >> 
 >> How is that an error?
 >> 

 Ulf> Ask the compiler writer, I was also confused, but that is
 Ulf> maybe appropriate for a package named "libconfuse" ;-)
 Ulf> There is a comment just before the "error".
 Ulf> "cc1: warnings being treated as errors" so the maintainer
 Ulf> wants to make dead sure that the lexer.c is real clean.

Ok, so that should be easy to fix.

 Ulf> mk	madplay                        OK	"Depends on python"
 Ulf> mk	mpg123                         FAIL	"Depends on python"
 >> 
 >> That sounds unlikely - Do you have a build log?

 Ulf> Have build logs for everything.
 Ulf> For the release toochain, the mpg123 build 
 Ulf> aborts with a segmentation fault.

So a compiler ICE?

-- 
Bye, Peter Korsgaard
