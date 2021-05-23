From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 11:03:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/msmtp: add MSMTP_CPE_ID_VENDOR
In-Reply-To: <20210522204209.284119-1-fontaine.fabrice@gmail.com>
References: <20210522204209.284119-1-fontaine.fabrice@gmail.com>
Message-ID: <20210523090325.GN3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-22 22:42 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:marlam:msmtp is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amarlam%3Amsmtp
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/msmtp/msmtp.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
> index cae03d7724..3db36f4cd0 100644
> --- a/package/msmtp/msmtp.mk
> +++ b/package/msmtp/msmtp.mk
> @@ -11,6 +11,7 @@ MSMTP_DEPENDENCIES = host-pkgconf
>  MSMTP_CONF_OPTS = --disable-gai-idn
>  MSMTP_LICENSE = GPL-3.0+
>  MSMTP_LICENSE_FILES = COPYING
> +MSMTP_CPE_ID_VENDOR = marlam
>  
>  # msmtpd needs fork
>  ifeq ($(BR2_USE_MMU),y)
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
