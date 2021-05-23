From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 19:58:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/oprofile: add
 OPROFILE_CPE_ID_VENDOR
In-Reply-To: <20210523135214.1521410-1-fontaine.fabrice@gmail.com>
References: <20210523135214.1521410-1-fontaine.fabrice@gmail.com>
Message-ID: <20210523175843.GX3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-23 15:52 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:maynard_johnson:oprofile is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amaynard_johnson%3Aoprofile
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/oprofile/oprofile.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
> index 50693ddd1e..85bc4efa9b 100644
> --- a/package/oprofile/oprofile.mk
> +++ b/package/oprofile/oprofile.mk
> @@ -8,6 +8,7 @@ OPROFILE_VERSION = 1.4.0
>  OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
>  OPROFILE_LICENSE = GPL-2.0+
>  OPROFILE_LICENSE_FILES = COPYING
> +OPROFILE_CPE_ID_VENDOR = maynard_johnson
>  OPROFILE_CONF_OPTS = \
>  	--disable-account-check \
>  	--enable-gui=no \
> -- 
> 2.30.2
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
