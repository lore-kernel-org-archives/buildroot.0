From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 23:16:26 +0200
Subject: [Buildroot] [PATCH] configs/imx6-sabreauto: Select
 BR2_TARGET_UBOOT_NEEDS_LZOP
In-Reply-To: <20191014140058.7753-1-festevam@gmail.com>
References: <20191014140058.7753-1-festevam@gmail.com>
Message-ID: <20191014231626.11bee498@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 11:00:58 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Select BR2_TARGET_UBOOT_NEEDS_LZOP in order to avoid
> the following build error on a host machine without lzop
> installed:
> 
> /bin/sh: 1: lzop: not found
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/318105190
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/imx6-sabreauto_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
