From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@collabora.com>
Date: Tue, 13 Aug 2019 08:48:03 -0400
Subject: [Buildroot] Buildroot raspberrypi3_qt5we_defconfig no longer
 builds
In-Reply-To: <20190810103022.4b2f16f8@windsurf.home>
References: <20190810103022.4b2f16f8@windsurf.home>
Message-ID: <20190813124803.6dgpy73pln2hcjrn@archlinux.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Peter,

On Sat, Aug 10, 2019 at 10:30:22AM +0200, Thomas Petazzoni wrote:
> Ga?l, Peter,
> 
> The raspberrypi3_qt5we_defconfig in Buildroot no longer buids:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/269139278
> 
> The error is:
> 
> error: stdlib.h: No such file or directory
>  #include_next <stdlib.h>
>                ^~~~~~~~~~
> compilation terminated.
> 
> When building qt5webengine. Could you have a look and propose a patch
> to address this issue ?
> 

I will have a look to it. Probably later that week.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Gael
