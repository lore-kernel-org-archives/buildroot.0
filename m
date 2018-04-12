From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 23:30:36 +0200
Subject: [Buildroot] [PATCH] configs/freescale_{p1025twr,
 t1040d4rdb}: headers version
In-Reply-To: <20180412212606.1428-1-vincent.stehle@laposte.net>
References: <20180412212606.1428-1-vincent.stehle@laposte.net>
Message-ID: <20180412233036.01eb21bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 23:26:06 +0200, Vincent Stehle wrote:
> From: Vincent Stehl? <vincent.stehle@laposte.net>
> 
> The freescale p1025twr and t1040d4rdb defconfigs use a 4.15 series kernel;
> specify BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15 accordingly.
> 
> This fixes the following build error:
> 
>   Incorrect selection of kernel headers: expected 4.16.x, got 4.15.x
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  configs/freescale_p1025twr_defconfig   | 3 +++
>  configs/freescale_t1040d4rdb_defconfig | 3 +++
>  2 files changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
