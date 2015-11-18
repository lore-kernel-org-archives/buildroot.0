From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Nov 2015 22:49:59 +0100
Subject: [Buildroot] [PATCH 2/6] gst-plugins-base: add legal info
In-Reply-To: <1447850352-26299-2-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1447850352-26299-2-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <564CF287.7010808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18-11-15 13:39, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/gstreamer/gst-plugins-base/gst-plugins-base.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
> index 08733d1..43e4df0 100644
> --- a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
> +++ b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
> @@ -8,6 +8,8 @@ GST_PLUGINS_BASE_VERSION = 0.10.36
>  GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.xz
>  GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
>  GST_PLUGINS_BASE_INSTALL_STAGING = YES
> +GST_PLUGINS_BASE_LICENSE = GPLv2+ LGPLv2+

 comma-separated, otherwise

 Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> +GST_PLUGINS_BASE_LICENSE_FILES = COPYING COPYING.LIB
>  
>  # freetype is only used by examples, but if it is not found
>  # and the host has a freetype-config script, then the host
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
