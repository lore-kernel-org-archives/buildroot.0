From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 23:33:44 +0200
Subject: [Buildroot] [PATCH 03/30] package/matchbox-wm: drop useless
 commented options
In-Reply-To: <000cdecc50eb5979cb4e94e1b8291dfe67efd275.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <000cdecc50eb5979cb4e94e1b8291dfe67efd275.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <55396538.1020903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 20:09, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I'd put this one at the beginning of the series though since it's the simplest
of them all and can be accepted quickly. Perhaps it's already gone by the time
you respin :-).

 Regards,
 Arnout

> ---
>  package/matchbox/matchbox-wm/matchbox-wm.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
> index 16f1417..da9efd7 100644
> --- a/package/matchbox/matchbox-wm/matchbox-wm.mk
> +++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
> @@ -25,10 +25,7 @@ endif
>  endif
>  
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
> -#MATCHBOX_WM_OPTS += --enable-standalone-xft
>  MATCHBOX_WM_DEPENDENCIES += xlib_libXft
> -else
> -#MATCHBOX_WM_OPTS += --disable-standalone-xft
>  endif
>  
>  ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
