From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:47:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/heirloom-mailx: add CPE
 variables
In-Reply-To: <20210612212834.636625-1-fontaine.fabrice@gmail.com>
References: <20210612212834.636625-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612214734.GJ168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-12 23:28 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:heirloom:mailx is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aheirloom%3Amailx
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/heirloom-mailx/heirloom-mailx.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
> index 2f7e635e0f..b3cece0cfc 100644
> --- a/package/heirloom-mailx/heirloom-mailx.mk
> +++ b/package/heirloom-mailx/heirloom-mailx.mk
> @@ -9,6 +9,8 @@ HEIRLOOM_MAILX_SOURCE = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
>  HEIRLOOM_MAILX_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/h/heirloom-mailx
>  HEIRLOOM_MAILX_LICENSE = BSD-4-Clause, Bellcore (base64), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPL-1.1 (nss)
>  HEIRLOOM_MAILX_LICENSE_FILES = COPYING
> +HEIRLOOM_MAILX_CPE_ID_VENDOR = heirloom
> +HEIRLOOM_MAILX_CPE_ID_PRODUCT = mailx
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  HEIRLOOM_MAILX_DEPENDENCIES += openssl
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
