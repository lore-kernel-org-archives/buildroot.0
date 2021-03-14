From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 16:55:30 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnet: add LIBNET_CPE_ID_VENDOR
In-Reply-To: <20210310192139.265084-1-fontaine.fabrice@gmail.com>
References: <20210310192139.265084-1-fontaine.fabrice@gmail.com>
Message-ID: <20210314155530.GE2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-10 20:21 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:libnet_project:libnet is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibnet_project%3Alibnet
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libnet/libnet.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
> index 966106837a..5c5071b9c3 100644
> --- a/package/libnet/libnet.mk
> +++ b/package/libnet/libnet.mk
> @@ -11,5 +11,6 @@ LIBNET_INSTALL_STAGING = YES
>  LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
>  LIBNET_LICENSE = BSD-2-Clause, BSD-3-Clause
>  LIBNET_LICENSE_FILES = doc/COPYING
> +LIBNET_CPE_ID_VENDOR = libnet_project
>  
>  $(eval $(autotools-package))
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
