From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 23 Jan 2009 22:08:47 +0100
Subject: [Buildroot] ARM release compiler broken for mpg123.
In-Reply-To: <87eiytkbc5.fsf@macbook.be.48ers.dk>
References: <1232723429.5311.73.camel@elrond.atmel.com>
	<87eiytkbc5.fsf@macbook.be.48ers.dk>
Message-ID: <1232744927.5311.95.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-23 klockan 21:37 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  Ulf> ?Have been struggling with mpg123 last night.
>  Ulf> There seems to be a bug in the release version
>  Ulf> (gcc-4.3.2/bu-2-19/uclibc-0.9.30)
>  Ulf> of the toolchain which creates a Segment violation.
> 
>  Ulf> Anyone else can build mpg123, maybe for another architecture?
> 
> Yes, it builds on atleast powerpc without problems (afaik also i386,
> but that has been a while).
> 
>  Ulf> I have found an upstream patch, which I will test
>  Ulf> and apply if it seems to solve the problem.
> 
> I guess you'll need to patch the compiler instead as it's the compiler
> ICE'ing. Any change you do to mpg123 won't make that bug go away.
> 

Yes, it is a gcc patch for ARM.

BR
Ulf Samuelsson
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
