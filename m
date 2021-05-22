From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 22:04:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/pigz: add PIGZ_CPE_ID_VENDOR
In-Reply-To: <20210522175803.279609-1-fontaine.fabrice@gmail.com>
References: <20210522175803.279609-1-fontaine.fabrice@gmail.com>
Message-ID: <20210522200433.GF3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-22 19:58 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:zlib:pigz is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azlib%3Apigz
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pigz/pigz.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
> index fdf5fa40e8..3e5e892797 100644
> --- a/package/pigz/pigz.mk
> +++ b/package/pigz/pigz.mk
> @@ -10,6 +10,7 @@ PIGZ_DEPENDENCIES = zlib
>  HOST_PIGZ_DEPENDENCIES = host-zlib
>  PIGZ_LICENSE = Zlib
>  PIGZ_LICENSE_FILES = README
> +PIGZ_CPE_ID_VENDOR = zlib
>  
>  define PIGZ_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
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
