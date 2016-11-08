From: Gergely Imreh <imrehg@gmail.com>
Date: Tue, 8 Nov 2016 10:53:34 +0200
Subject: [Buildroot] via_imx6_vab820_defconfig fails to build
In-Reply-To: <20161105152208.70041169@free-electrons.com>
References: <20161105152208.70041169@free-electrons.com>
Message-ID: <CAJ3iQcqS2qN9a_hedO-+N+uskH6bOgV2XVWYetD0noG1=s190A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Sure thing, I still have some access to the platform. I'll check out the
build failure and send a patch when fixed.

Cheers,
   Gergely

On 5 November 2016 at 16:22, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello Gergely,
>
> Last year, you contributed the via_imx6_vab820_defconfig to Buildroot
> to add support for this HW platform from VIA.
>
> Unfortunately, this defconfig no longer builds, because the U-Boot
> version used is too old to build with gcc 5.x.
>
> If you still have access to this HW platform, could you submit a patch
> that updates the defconfig to use a newer U-Boot version, which
> builds properly with gcc 5.x ?
>
> See
> http://free-electrons.com/~thomas/pub/buildroot-
> defconfigs/via_imx6_vab820_defconfig.log.FAIL
> for the full build log.
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161108/d302a358/attachment.html>
