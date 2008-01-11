From: friedrich Euler <friedrich.euler@googlemail.com>
Date: Fri, 11 Jan 2008 19:15:54 +0100
Subject: [Buildroot] build for mipsel failed - incompatible ABI
In-Reply-To: <20080110142119.GA29066@aon.at>
References: <bd9bbe900801100046m4be2629au43ab3d094b382dc@mail.gmail.com>
	<20080110142119.GA29066@aon.at>
Message-ID: <bd9bbe900801111015j4fd624bam9f308a4af980b839@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This works now. But fakeroot version 1.8.2 is not available anymore. I thing
it should work after patching fakeroot. I will check this on the weekend.


Thanks

friedrich

On Jan 10, 2008 3:21 PM, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:

> On Thu, Jan 10, 2008 at 09:46:47AM +0100, friedrich Euler wrote:
> >Hello,
> >
> >I have a problen with buildroot. I would like to compile it for mipsel
> >target architecture. I called make menuconfig and than make. The build
> ends
> >up with the following error message:
> >
> >--- begin cut ---
> >...
> >make[1]: Entering directory
>
> >`/home/friedrich/buildroot-090108/buildroot/toolchain_build_mipsel/uClibc-
> >0.9.29'
> >make[2]: `conf' is up to date.
> >ln -fs sgidefs.h ./include/
> >:0: error: -march=mips1 is not compatible with the selected ABI
>
> >The problem is that it show this error for all 3 possible ABI options.
> >Another thing is that i selected mips32 and not mips1 as the target
> >architecture. I found some other problem descriptions like this one but
> no
> >solution. I am using Ubuntu 7.1 as build system.
> >
> >Any suggestions?
>
> If you can reproduce this with
> http://repo.or.cz/w/buildroot.git
>
> then please send me your .config (for both buildroot and uclibc) for me
> to reproduce.
>
> Thanks,
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080111/ad082f11/attachment.htm 
