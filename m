From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 08:49:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/musl: add MUSL_CPE_ID_VENDOR
In-Reply-To: <20210519064044.1632631-1-fontaine.fabrice@gmail.com>
References: <20210519064044.1632631-1-fontaine.fabrice@gmail.com>
Message-ID: <20210519064937.GD2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-19 08:40 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:musl-libc:musl is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amusl-libc%3Amusl
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/musl/musl.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/musl/musl.mk b/package/musl/musl.mk
> index 82b3eeaf52..d4f26b50a7 100644
> --- a/package/musl/musl.mk
> +++ b/package/musl/musl.mk
> @@ -8,6 +8,7 @@ MUSL_VERSION = 1.2.2
>  MUSL_SITE = http://www.musl-libc.org/releases
>  MUSL_LICENSE = MIT
>  MUSL_LICENSE_FILES = COPYRIGHT
> +MUSL_CPE_ID_VENDOR = musl-libc
>  
>  # Before musl is configured, we must have the first stage
>  # cross-compiler and the kernel headers
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
