From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Jun 2014 21:12:14 +0200
Subject: [Buildroot] [PATCH 02/54] irda-utils: add license information
In-Reply-To: <1403636160-11807-2-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140624191214.GA31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gtkperf/gtkperf.mk       | 2 ++
>  package/irda-utils/irda-utils.mk | 2 ++

Maybe this should have been two patches? ;-)

Hey, I can understand how repetitive this taks must have been. ;-)

Regards,
Yann E. MORIN.

>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
> index fa9531d..0542a26 100644
> --- a/package/gtkperf/gtkperf.mk
> +++ b/package/gtkperf/gtkperf.mk
> @@ -8,5 +8,7 @@ GTKPERF_VERSION = 0.40
>  GTKPERF_SOURCE = gtkperf_$(GTKPERF_VERSION).tar.gz
>  GTKPERF_SITE = http://downloads.sourceforge.net/project/gtkperf/gtkperf/$(GTKPERF_VERSION)
>  GTKPERF_DEPENDENCIES = libgtk2
> +GTKPERF_LICENSE = GPLv2
> +GTKPERF_LICENSE_FILES = COPYING
>  
>  $(eval $(autotools-package))
> diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
> index 4be80d7..e4958e5 100644
> --- a/package/irda-utils/irda-utils.mk
> +++ b/package/irda-utils/irda-utils.mk
> @@ -6,6 +6,8 @@
>  
>  IRDA_UTILS_VERSION = 0.9.18
>  IRDA_UTILS_SITE = http://downloads.sourceforge.net/project/irda/irda-utils/$(IRDA_UTILS_VERSION)
> +IRDA_UTILS_LICENSE = GPLv2+
> +IRDA_UTILS_LICENSE_FILES = man/COPYING
>  
>  IRDA_UTILS_CFLAGS = $(TARGET_CFLAGS) -I.
>  ifeq ($(BR2_USE_MMU),)
> -- 
> 1.8.5.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
