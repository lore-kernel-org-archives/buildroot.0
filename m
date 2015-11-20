From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Nov 2015 23:34:37 +0100
Subject: [Buildroot] [PATCH v2 1/5] gstreamer: add legal info
In-Reply-To: <1447971261-26290-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447971261-26290-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <564F9FFD.90100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-11-15 23:14, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Even though COPYING is LGPLv2+ many code files state v2.1+
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I should have written

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 :-)


 Regards,
 Arnout

> ---
>  package/gstreamer/gstreamer/gstreamer.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
> index 1dbd66f..cd3cf2d 100644
> --- a/package/gstreamer/gstreamer/gstreamer.mk
> +++ b/package/gstreamer/gstreamer/gstreamer.mk
> @@ -8,6 +8,9 @@ GSTREAMER_VERSION = 0.10.36
>  GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.xz
>  GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
>  GSTREAMER_INSTALL_STAGING = YES
> +# COPYING is in fact v2, but most of the code is v2.1+
> +GSTREAMER_LICENSE = LGPLv2.1+
> +GSTREAMER_LICENSE_FILES = COPYING
>  
>  # Checking if unaligned memory access works correctly cannot be done when cross
>  # compiling. For the following architectures there is no information available
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
