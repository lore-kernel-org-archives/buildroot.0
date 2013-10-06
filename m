From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Oct 2013 23:26:48 +0200
Subject: [Buildroot] [PATCH 1/2] i.MX: Use FREESCALE_IMX_SITE for
	Freescale packages
In-Reply-To: <1381088868-12739-2-git-send-email-eric.nelson@boundarydevices.com>
References: <1381088868-12739-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381088868-12739-2-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <20131006232648.69e85f80@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Nelson,

On Sun,  6 Oct 2013 12:47:47 -0700, Eric Nelson wrote:
> This patch consolidates the URLs for various Freescale-supplied
> packages to use FREESCALE_IMX_SITE.
> 
> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
> ---
>  package/freescale-imx/firmware-imx/firmware-imx.mk         | 2 +-
>  package/freescale-imx/freescale-imx.mk                     | 2 +-
>  package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 2 +-
>  package/freescale-imx/imx-lib/imx-lib.mk                   | 2 +-
>  package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk       | 3 +--
>  package/libfslcodec/libfslcodec.mk                         | 3 +--
>  package/libfslparser/libfslparser.mk                       | 3 +--
>  package/libfslvpuwrap/libfslvpuwrap.mk                     | 3 +--
>  8 files changed, 8 insertions(+), 12 deletions(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
