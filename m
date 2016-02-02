From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 09:51:59 +0100
Subject: [Buildroot] [PATCH 10/10] gst1-imx: bump to version 0.12.0
In-Reply-To: <1454154357-31625-11-git-send-email-gary.bisson@boundarydevices.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-11-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <56B06E2F.9010702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-01-16 12:45, Gary Bisson wrote:
[snip]
> diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
> index 8ede8ad..f3eac0a 100644
> --- a/package/gstreamer1/gst1-imx/gst1-imx.mk
> +++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GST1_IMX_VERSION = 0.11.1
> +GST1_IMX_VERSION = 0.12.0
>  GST1_IMX_SITE = $(call github,Freescale,gstreamer-imx,$(GST1_IMX_VERSION))
>  
>  GST1_IMX_LICENSE = LGPLv2+
> @@ -13,13 +13,23 @@ GST1_IMX_LICENSE_FILES = LICENSE
>  GST1_IMX_INSTALL_STAGING = YES
>  
>  GST1_IMX_DEPENDENCIES += host-pkgconf host-python \
> -	imx-gpu-viv gstreamer1 gst1-plugins-base libfslvpuwrap
> +	gstreamer1 gst1-plugins-base

 Minor nit in addition to Thomas's comments: please split this into one
dependency per line.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
