From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:57:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx: update SITE to
 use NXP url
In-Reply-To: <20191202200500.418195-1-juju@cotds.org>
References: <20191202200500.418195-1-juju@cotds.org>
Message-ID: <20191216225732.54c22556@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  2 Dec 2019 21:05:00 +0100
Julien Olivain <juju@cotds.org> wrote:

> NXP BSPs has been using the nxp.com URL for a while:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/commit/conf/layer.conf?id=d6abbbc1ce0882bdc82e03b1868eeba1a50a7bd3
> 
> It's  unclear for how long the freescale.com redirect will be
> maintained. This patch update the FREESCALE_IMX_SITE variable
> to point directly to the NXP site.
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>
> ---
>  package/freescale-imx/freescale-imx.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
