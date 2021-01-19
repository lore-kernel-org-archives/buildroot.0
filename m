From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Jan 2021 21:25:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/zziplib: set
 ZZIPLIB_CPE_ID_VALID
In-Reply-To: <20210119071302.787295-1-fontaine.fabrice@gmail.com>
References: <20210119071302.787295-1-fontaine.fabrice@gmail.com>
Message-ID: <20210119202552.GY2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-19 08:13 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:zziplib_project:zziplib is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azziplib_project%3Azziplib
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I'm getting too lazy to reply individually, so:

  - libbluray
  - ncmpc
  - zzipib
  - libebml

All 4 applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/zziplib/zziplib.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
> index 6c2efe7558..6cb9dedce8 100644
> --- a/package/zziplib/zziplib.mk
> +++ b/package/zziplib/zziplib.mk
> @@ -8,6 +8,7 @@ ZZIPLIB_VERSION = 0.13.72
>  ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
>  ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
>  ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm
> +ZZIPLIB_CPE_ID_VALID = YES
>  ZZIPLIB_INSTALL_STAGING = YES
>  ZZIPLIB_CONF_OPTS += \
>  	-DZZIPDOCS=OFF \
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
