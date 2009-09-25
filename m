From: Dominic Mason <dominic@opusvl.com>
Date: Fri, 25 Sep 2009 17:41:56 +0100
Subject: [Buildroot] ARCH=mips and linux-2.6.30.2
In-Reply-To: <87bpkzv4ma.fsf@macbook.be.48ers.dk>
References: <1253809626.16645.27.camel@xd-02.opusvl.com>
	<87bpkzv4ma.fsf@macbook.be.48ers.dk>
Message-ID: <1253896916.23251.20.camel@xd-02.opusvl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2009-09-25 at 09:57 +0200, Peter Korsgaard wrote:
>  Dominic> For what it's worth, if you copy arch/mips/lib/delay.c 
>  Dominic> from a vanilla 2.6.30.4 kernel, then the error disappears.
> 
> Really?
> 
> diff -u linux-2.6.30.{2,4}/arch/mips/lib/delay.c
> (nothing)

Oops, it's possible I'd downloaded a patched linux-2.6.30.4 archive from
somewhere, after doing some searching for that error. I've got a bz2 on
my system that I've just extracted again and that one was patched. Sorry
about that, 'twas a couple of weeks ago I did this, and have only just
got round to subscribing to the buildroot mailing list.


> I'll add the patch to kernel-headers, so it should get included if you
> use git and select the simple Linux kernel option.

Thanks for that.

Regards

-- 
Dominic Mason <dominic@opusvl.com>
Opus VL
