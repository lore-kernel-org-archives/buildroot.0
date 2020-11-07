From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 13:53:40 +0100
Subject: [Buildroot] [PATCH 1/2] configs/mx6sx_udoo_neo: select
 host-openssl for the Linux kernel build
In-Reply-To: <20201106133634.15452-1-festevam@gmail.com>
References: <20201106133634.15452-1-festevam@gmail.com>
Message-ID: <20201107135340.75d03ee3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Nov 2020 10:36:33 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y to fix the following
> build error:
> 
> scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
>  #include <openssl/bio.h>
> 
> Fixes:
>  https://gitlab.com/buildroot.org/buildroot/-/jobs/831421063
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/mx6sx_udoo_neo_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
