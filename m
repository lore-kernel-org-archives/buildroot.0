From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Nov 2015 23:41:45 +0100
Subject: [Buildroot] [PATCH v2 5/5] gst-plugins-ugly: add legal info
In-Reply-To: <1447971261-26290-5-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447971261-26290-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1447971261-26290-5-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <564FA1A9.1000509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-11-15 23:14, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Even though COPYING is LGPLv2.1+ many code files state v2+
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
> index e8f2362..b921dc1 100644
> --- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
> +++ b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
> @@ -7,6 +7,10 @@
>  GST_PLUGINS_UGLY_VERSION = 0.10.19
>  GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.xz
>  GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
> +# COPYING is in fact LGPLv2.1, but all of the code is v2+
> +# (except for one test, xingmux)
> +GST_PLUGINS_UGLY_LICENSE = LGPLv2+, GPLv2+ (synaesthesia)
> +GST_PLUGINS_UGLY_LICENSE_FILES = COPYING
>  
>  GST_PLUGINS_UGLY_CONF_OPTS = \
>  	--disable-examples
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
