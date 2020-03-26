From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 22:28:26 +0100
Subject: [Buildroot] [PATCH 1/2] configs/freescale_imx7dsabresd: kernel
 build needs host-openssl
In-Reply-To: <20200325095005.872113-1-julien.olivain@oss.nxp.com>
References: <20200325095005.872113-1-julien.olivain@oss.nxp.com>
Message-ID: <20200326222826.62359987@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Mar 2020 10:50:04 +0100
Julien Olivain <julien.olivain@oss.nxp.com> wrote:

> With the recent bump of the kernel to 4.19, the kernel configuration
> now needs host-openssl to build.
> 
> Fixes:
> scripts/extract-cert.c:21:10: fatal error: openssl/bio.h: No such file or directory
>    21 | #include <openssl/bio.h>
> 
> Signed-off-by: Julien Olivain <julien.olivain@oss.nxp.com>
> ---
>  configs/freescale_imx7dsabresd_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
