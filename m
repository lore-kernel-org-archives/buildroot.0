From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Feb 2014 21:16:31 +0100
Subject: [Buildroot] [PATCH V5 1/3] i.MX: Use FREESCALE_IMX_SITE for
	Freescale packages
In-Reply-To: <1392337580-16568-2-git-send-email-eric.nelson@boundarydevices.com>
 (Eric Nelson's message of "Thu, 13 Feb 2014 17:26:18 -0700")
References: <1392337580-16568-1-git-send-email-eric.nelson@boundarydevices.com>
 <1392337580-16568-2-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <878utdmov4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Nelson <eric.nelson@boundarydevices.com> writes:

 > This patch consolidates the URLs for various Freescale-supplied
 > packages to use FREESCALE_IMX_SITE.

 > Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
 > Reviewed-by: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > No changes in V4.
 > No changes in V5.
 
 >  package/freescale-imx/firmware-imx/firmware-imx.mk         | 2 +-
 >  package/freescale-imx/freescale-imx.mk                     | 2 +-
 >  package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 2 +-
 >  package/freescale-imx/imx-lib/imx-lib.mk                   | 2 +-
 >  package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk       | 3 +--
 >  package/libfslcodec/libfslcodec.mk                         | 3 +--
 >  package/libfslparser/libfslparser.mk                       | 3 +--
 >  package/libfslvpuwrap/libfslvpuwrap.mk                     | 3 +--
 >  8 files changed, 8 insertions(+), 12 deletions(-)

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
