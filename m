From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 14:02:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/rdesktop: add
 RDESKTOP_CPE_ID_VENDOR
In-Reply-To: <20210302092531.269814-1-fontaine.fabrice@gmail.com>
References: <20210302092531.269814-1-fontaine.fabrice@gmail.com>
Message-ID: <20210302130216.GD2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-02 10:25 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:rdesktop:rdesktop is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ardesktop%3Ardesktop
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

I also applied bubblewrap, libsndfile, and bootstrap. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/rdesktop/rdesktop.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
> index 672d85b5c5..5a1739a46e 100644
> --- a/package/rdesktop/rdesktop.mk
> +++ b/package/rdesktop/rdesktop.mk
> @@ -24,6 +24,7 @@ RDESKTOP_DEPENDENCIES = \
>  RDESKTOP_CONF_OPTS = --disable-credssp
>  RDESKTOP_LICENSE = GPL-3.0+
>  RDESKTOP_LICENSE_FILES = COPYING
> +RDESKTOP_CPE_ID_VENDOR = rdesktop
>  
>  ifeq ($(BR2_PACKAGE_PCSC_LITE),y)
>  RDESKTOP_DEPENDENCIES += pcsc-lite
> -- 
> 2.30.0
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
