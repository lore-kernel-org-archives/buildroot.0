From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 15:11:24 +0200
Subject: [Buildroot] [PATCH] Defconfig arcturus_ucls1012a_defconfig:
 bump UBOOT_CUSTOM_REPO_VERSION
In-Reply-To: <20190726162824.6906545f@windsurf>
References: <20180605140250.5943-1-oleks@arcturusnetworks.com>
 <20190726162824.6906545f@windsurf>
Message-ID: <20190810151124.7eb24b03@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Jul 2019 16:28:24 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Tue,  5 Jun 2018 10:02:50 -0400
> Oleksandr Zhadan <oleks@arcturusnetworks.com> wrote:
> 
> > This new u-boot custom repo version should fix the arcturus_ucls1012a_defconfig
> > fails to build on master. See the build log at:
> > 
> >   https://gitlab.com/buildroot.org/buildroot/-/jobs/71726827
> > 
> > Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
> > Signed-off-by: Michael Durrant <mdurrant@arcturusnetworks.com>  
> 
> This defconfig no longer builds with gcc 8.x, due to U-Boot:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/259846781
> 
> Could you have a look and send a patch to fix this ?

This is a second reminder about fixing this defconfig, which still
fails to build:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139088

Please send a fix in the near future, as otherwise we would have to
remove this defconfig.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
