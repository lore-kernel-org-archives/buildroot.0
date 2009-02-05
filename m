From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 05 Feb 2009 21:37:32 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <87vdrpaug2.fsf@macbook.be.48ers.dk>
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<d6cda7730902041833r5e5af2ax26c0eebb48df19a4@mail.gmail.com>
	<87vdrpaug2.fsf@macbook.be.48ers.dk>
Message-ID: <1233866252.4148.12.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-02-05 klockan 14:23 +0100 skrev Peter Korsgaard:
> >>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
> 
>  Thiago> Hi,
>  >> To me the sane thing would just be for the files to be named whatever
>  >> the kernel names them (uImage/zImage/bzImage/..), but even if we don't
>  >> do that we should atleast make the 2 Linux types use the same style.
>  >> 
> 
>  Thiago> Unless someone oposes, I will commit the patch below tomorrow night.
> 
> Please do it today, I'm planning on cutting the release tomorrow
> (Friday) at noon.
> 
>  Thiago> It will use the rootfs suffix if one is specified for the kernel, but
>  Thiago> if none is supplied, we get default kernel names. Then you can get
>  Thiago> both rootfs and kernel with your board names, dates, etc. And both
>  Thiago> rootfs and kernel names will always match.
> 


And you have no clue about the kernel version.
And you have to modify the suffix for every project.
Much better to just create the link to uImage etc.

Then you have both.
BR


> Seems good, but don't forget the non-advanced version as well. We
> should imho use the same naming convention for both kernel builds.
> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
