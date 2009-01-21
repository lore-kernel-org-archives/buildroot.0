From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 13:28:12 +0100
Subject: [Buildroot] List of working packages for ARM
In-Reply-To: <1232538049.11888.16.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Wed\, 21 Jan 2009 12\:40\:49 +0100")
References: <1232523725.11888.11.camel@elrond.atmel.com>
	<87vds9t51h.fsf@macbook.be.48ers.dk>
	<1232538049.11888.16.camel@elrond.atmel.com>
Message-ID: <87wscosv1f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> Thanks, but why? Please use the default versions as that's what we're
 >> releasing with and what new users will use.
 >> 
 >> E.G. binutils 2.29, uclibc 0.9.30, gcc 4.3.2

 Ulf> I have seen compiler errors with this combination,
 Ulf> so I want to build with several toolchain versions,
 Ulf> but it is in the plan.

 Ulf> I have seen some compiler problems with my combination
 Ulf> as well...

Ok, but if we're releasing with that combination (and we should), then
that's the one we should be spending our time on getting stable, not
some other combination with other problems.

-- 
Bye, Peter Korsgaard
