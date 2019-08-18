From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Aug 2019 14:43:17 +0200
Subject: [Buildroot] Buildroot raspberrypi3_qt5we_defconfig no longer
 builds
In-Reply-To: <20190813124803.6dgpy73pln2hcjrn@archlinux.localdomain>
References: <20190810103022.4b2f16f8@windsurf.home>
 <20190813124803.6dgpy73pln2hcjrn@archlinux.localdomain>
Message-ID: <20190818144317.487720fc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ga?l,

On Tue, 13 Aug 2019 08:48:03 -0400
Ga?l PORTAY <gael.portay@collabora.com> wrote:

> > The error is:
> > 
> > error: stdlib.h: No such file or directory
> >  #include_next <stdlib.h>
> >                ^~~~~~~~~~
> > compilation terminated.
> > 
> > When building qt5webengine. Could you have a look and propose a patch
> > to address this issue ?
> 
> I will have a look to it. Probably later that week.

Have you had the chance to look into this ? It failed again in the last
Gitlab CI pipeline:
https://gitlab.com/buildroot.org/buildroot/-/jobs/273673252.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
