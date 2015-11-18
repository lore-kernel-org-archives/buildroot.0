From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Nov 2015 23:12:24 +0100
Subject: [Buildroot] [PATCH 5/6] gst-plugins-ugly: add legal info
In-Reply-To: <1447850352-26299-5-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1447850352-26299-5-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <564CF7C8.3030901@mind.be>
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
>  package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
> index e8f2362..9662623 100644
> --- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
> +++ b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
> @@ -7,6 +7,8 @@
>  GST_PLUGINS_UGLY_VERSION = 0.10.19
>  GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.xz
>  GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
> +GST_PLUGINS_UGLY_LICENSE = LGPLv2.1+

 synaesthesia is GPLv2+ (and is always enabled)

 All the rest is LGPLv2+...

> +GST_PLUGINS_UGLY_LICENSE_FILES = COPYING

 ...except this file which is 2.1...

 I guess there's a reason it's called ugly :-)


 Regards,
 Arnout

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
