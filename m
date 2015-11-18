From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Nov 2015 22:53:18 +0100
Subject: [Buildroot] [PATCH 3/6] gst-plugins-good: add legal info
In-Reply-To: <1447850352-26299-3-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1447850352-26299-3-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <564CF34E.7040409@mind.be>
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
>  package/gstreamer/gst-plugins-good/gst-plugins-good.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gstreamer/gst-plugins-good/gst-plugins-good.mk b/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
> index fee83a1..a686caf 100644
> --- a/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
> +++ b/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
> @@ -7,6 +7,8 @@
>  GST_PLUGINS_GOOD_VERSION = 0.10.31
>  GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.xz
>  GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
> +GST_PLUGINS_GOOD_LICENSE = LGPLv2.1+

 Here there are also some files marked as LGPLv2+, but as I commented on patch
1, it may be better like that. So

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> +GST_PLUGINS_GOOD_LICENSE_FILES = COPYING
>  
>  GST_PLUGINS_GOOD_CONF_OPTS = \
>  	--disable-examples \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
