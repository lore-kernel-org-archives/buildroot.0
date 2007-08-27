From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 27 Aug 2007 15:18:42 +0100
Subject: [Buildroot] Anyone have *working* ARM(9) toolchain/cross compi
	ler with buildroot?
In-Reply-To: <DcJYsnhV0KHd.0vPY6rqB@mailout.dof.se>
References: <DcJYsnhV0KHd.0vPY6rqB@mailout.dof.se>
Message-ID: <d6cda7730708270718t6e31bcf1t7dd974978fb929ce@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This seams to be different, as one can't opt not to have a toolchain :)



On 8/27/07, Ulf Samuelsson <ulf@atmel.com> wrote:
>
>
> Hello all,
>
> In my desperation, this is my first message to the buildroot community - I
> don't have too much experience with cross compiling, but enough to get
> around. I'm having a terrible time getting buildroot to finish *anything* I
> give it. It always fails on one thing or another, and I'm beginning to get
> very frustrated after days of trying.
>
> At first, I used a Debian build, which failed miserably at every turn,
> despite installing package after package. So, I turned to a Fedora Core 7
> install, and things looked up. In fact, buildroot completed if:
>
> I selected my correct ARM --> arm920t, soft float, and ONLY C library
> support, no C++/GCJ, and gcc 3.4.6. This worked well enough, I was able to
> compile JamVM, and even Jikes to compile the classpath. But of course, as
> would be expected, while JamVM runs well enough to give me a proper "usage
> information" screen, it won't run anything.
>
> This leads me to need gcj, because there exists no competent JVM for ARM
> that will compile properly, apparently. but whenever I try to run buildroot
> with c++/gcj enabled, it just won't work. Can anyone tell me if/how they got
> an ARM implementation to run? I've tried all the gcc versions possible (each
> one comes up with different errors), and I've tried snapshot vs. 0.9.29 of
> uclibc, etc., all to no avail. Any help is appreciated. Thanks,
>
> -Adrian
>
> => There is plenty of things
> that doesn't work for
> ARM.
> I proposed that packages
> which does not build for
> a certain architecture
> can conditionally be
> disabled so people do
> not end up in continuous
> failures.
> There are opinions against
> this.
> They like people to repeat
> the failures and spend
> time on fixing bugs.
>
> Best Regards
> Ulf Samuelsson
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
