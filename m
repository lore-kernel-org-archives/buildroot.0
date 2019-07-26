From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jul 2019 16:28:24 +0200
Subject: [Buildroot] [PATCH] Defconfig arcturus_ucls1012a_defconfig:
 bump UBOOT_CUSTOM_REPO_VERSION
In-Reply-To: <20180605140250.5943-1-oleks@arcturusnetworks.com>
References: <20180605140250.5943-1-oleks@arcturusnetworks.com>
Message-ID: <20190726162824.6906545f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jun 2018 10:02:50 -0400
Oleksandr Zhadan <oleks@arcturusnetworks.com> wrote:

> This new u-boot custom repo version should fix the arcturus_ucls1012a_defconfig
> fails to build on master. See the build log at:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/71726827
> 
> Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
> Signed-off-by: Michael Durrant <mdurrant@arcturusnetworks.com>

This defconfig no longer builds with gcc 8.x, due to U-Boot:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/259846781

Could you have a look and send a patch to fix this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
