From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Jul 2011 07:19:07 +0200
Subject: [Buildroot] Compiling problem with NPTL threads on x86
In-Reply-To: <4E04CD6C.3000200@in-2-technology.co.uk> (Dominic Newton's
 message of "Fri, 24 Jun 2011 18:46:20 +0100")
References: <4E037C99.2030308@in-2-technology.co.uk>
 <4E04CD6C.3000200@in-2-technology.co.uk>
Message-ID: <87box8ugtw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dominic" == Dominic Newton <dominic.newton@in-2-technology.co.uk> writes:

 Dominic> OK problem looks more or less solved.
 Dominic> NPTL threads are mainly supported by the latest uclibc release, but
 Dominic> the devil is in the detail. Some target architecture variants are not
 Dominic> supported. The buildroot menuconfig may show that NPTL threads are
 Dominic> available as an options, but when uclibc is configured the local logic
 Dominic> throws this out. A good check is to run uclibc-menuconfig and test out
 Dominic> the options on that.

What configurations are those? Perhaps we can improve the menuconfig
logic in buildroot.

-- 
Bye, Peter Korsgaard
