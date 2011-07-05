From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jul 2011 08:58:17 +0200
Subject: [Buildroot] problems compiling uclibc for Geode (i386)
In-Reply-To: <1309350574.17457.5.camel@sven> (Sven Neumann's message of "Wed, 
 29 Jun 2011 14:29:34 +0200")
References: <1309291371.21632.5.camel@bender> <1309350574.17457.5.camel@sven>
Message-ID: <87vcvhz01i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 Sven> Looks like NPTL support is broken for the generic 386 target. I've
 Sven> changed the uclibc configuration to i586 now (in the hope that this will
 Sven> work for a Geode processor) and that has fixed above problem for me.

I've committed a fix so you cannot enable NPTL if you choose i386.

-- 
Bye, Peter Korsgaard
