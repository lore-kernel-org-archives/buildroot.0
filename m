From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 21 Jan 2009 12:40:49 +0100
Subject: [Buildroot] List of working packages for ARM
In-Reply-To: <87vds9t51h.fsf@macbook.be.48ers.dk>
References: <1232523725.11888.11.camel@elrond.atmel.com>
	<87vds9t51h.fsf@macbook.be.48ers.dk>
Message-ID: <1232538049.11888.16.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-21 klockan 09:52 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  Ulf> Using gcc-4.2.4, bu-2.18, uclibc-0.9.30
>  Ulf> wchar, largefile,ipv6, NWFPE
> 
> Thanks, but why? Please use the default versions as that's what we're
> releasing with and what new users will use.
> 
> E.G. binutils 2.29, uclibc 0.9.30, gcc 4.3.2

I have seen compiler errors with this combination,
so I want to build with several toolchain versions,
but it is in the plan.

I have seen some compiler problems with my combination
as well...

BR
Ulf Samuelsson

> Could you rerun it with proper toolchain settings? Thanks.
> 
