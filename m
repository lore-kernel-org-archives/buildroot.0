From: Will Newton <will.newton@gmail.com>
Date: Mon, 31 Aug 2009 16:49:35 +0100
Subject: [Buildroot] Does the kexec package buildroot-2009.05 for i386?
In-Reply-To: <873a79svka.fsf@macbook.be.48ers.dk>
References: <2d6a9f6f0908271429j91a36e9s2342c23762a8552@mail.gmail.com>
	<87fxbcro1c.fsf@macbook.be.48ers.dk>
	<2d6a9f6f0908280920q41f09dak9120c88370e14aa1@mail.gmail.com>
	<87a5b0800908280931x523f6c88k1e006634d612425f@mail.gmail.com>
	<873a79svka.fsf@macbook.be.48ers.dk>
Message-ID: <87a5b0800908310849sb80aaf6hcdf356e34c2b3b92@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 30, 2009 at 6:46 AM, Peter Korsgaard<jacmet@uclibc.org> wrote:
>>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:
>
> Hi,
>
> ?Will> buildroot does not seem to be happy with /bin/sh pointing at
> ?Will> dash, it would seem to require bash (I don't have any specific
> ?Will> failures in mind, but I have seen a few). I find it easiest just
> ?Will> to make sure that /bin/sh points at bash if I'm using Ubuntu.
>
> Really? Buildroot itself shouldn't care as we explicitly use bash, but
> the build system of various packages could ofcourse fail.
>
> Please report if you notice something like this in the future so we can
> get it fixed.

I believe there is/was an issue with globbing and patch-kernel.sh in
the linux-headers Makefile. I'll see if i can reproduce it this week
sometime.

Problems have also been reported using buildroot on Ubuntu systems by
our customers so I don't think it's isolated to my system.
