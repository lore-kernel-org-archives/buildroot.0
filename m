From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 13:34:06 +0100
Subject: [Buildroot] List of working packages for ARM
In-Reply-To: <1232523725.11888.11.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Wed\, 21 Jan 2009 08\:42\:05 +0100")
References: <1232523725.11888.11.camel@elrond.atmel.com>
Message-ID: <87skncsurl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> Using gcc-4.2.4, bu-2.18, uclibc-0.9.30
 Ulf> wchar, largefile,ipv6, NWFPE

Again, it would be neat to have such a list with the toolchain config
that really matters.

 Ulf> nmk	valgrind                       DISABLED	x86 specific  

i386/x86-64/powerpc


 Ulf> mk	libconfuse                     FAIL	"error: 'input' defined but not used"

How is that an error?

 Ulf> nmk	database                       DISABLED	Need to enter subdirectory 

? So you didn't test sqlite/mysql?


 Ulf> mk	libcurl                        FAIL	"checking for socklen_t
 Ulf> equivalent... unknown"

I have recently built that on armv4l without problems.

 Ulf> mk	madplay                        OK	"Depends on python"
 Ulf> mk	mpg123                         FAIL	"Depends on python"

That sounds unlikely - Do you have a build log?

-- 
Bye, Peter Korsgaard
