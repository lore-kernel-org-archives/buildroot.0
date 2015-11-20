From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Nov 2015 23:34:06 +0100
Subject: [Buildroot] [PATCH v2 4/5] gst-plugins-bad: add legal info
In-Reply-To: <1447971261-26290-4-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447971261-26290-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1447971261-26290-4-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <564F9FDE.2080109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-11-15 23:14, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Even though COPYING.LIB is LGPLv2+ many code files state v2.1+
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
> index 0a85603..fa2f124 100644
> --- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
> +++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
> @@ -7,6 +7,9 @@
>  GST_PLUGINS_BAD_VERSION = 0.10.23
>  GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.xz
>  GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
> +# COPYING.LIB is in fact v2, but most of the code is v2.1+
> +GST_PLUGINS_BAD_LICENSE = LGPLv2.1+, GPLv2+
> +GST_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB COPYING
>  
>  GST_PLUGINS_BAD_CONF_OPTS = \
>  	--disable-examples
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
