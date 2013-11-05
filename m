From: Andi Shyti <andi@etezian.org>
Date: Tue, 5 Nov 2013 18:10:03 +0100
Subject: [Buildroot] [PATCH] perf: libelf is required to compile perf
In-Reply-To: <CAAXf6LVJ7r6mK40v=az-h5p8g8ykwaOsC0RXCZSY6wT9Dh9gmw@mail.gmail.com>
References: <1383660387-31193-1-git-send-email-andi@etezian.org>
 <CAAXf6LVJ7r6mK40v=az-h5p8g8ykwaOsC0RXCZSY6wT9Dh9gmw@mail.gmail.com>
Message-ID: <20131105171003.GA17791@jack.whiskey>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> > Point this out in the related Config.in in the perf directory.
> >
> > Mute the following error by selecting BR2_PACKAGE_LIBELF:
> >
> > The perf tool in your kernel cannot be built without libelf.
> > Either upgrade your kernel to >= 3.7, or enable the elfutils package.
> > make: *** [/home/andi/repo/buildroot-snowball/output/build/perf-stable-linux-ux500-3.4/.stamp_built] Error 1
> 
> This doesn't look right. As the error indicates, if your kernel is
> recent enough you don't need libelf.

I was compiling for snowball which has an old Kernel as default,
that's why I got the error.

> Have you tried enabling libelf manually?

By enabling it manually it works. If the patch doesn't look
right, feel free to ignore it.

Thanks,
Andi
