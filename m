From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Dec 2013 23:47:41 +0100
Subject: [Buildroot] [PATCH] gnutls: revert bump
In-Reply-To: <1386088080-4286-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386088080-4286-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131203224741.GC3633@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2013-12-03 13:28 -0300, Gustavo Zacarias spake thusly:
> Revert bump to 3.2.7 from commit 8238e744b813e9922c0a81f21b271263ef0e216a
> It causes build issues because of an internal gnulib bump:
> http://autobuild.buildroot.net/results/48d/48d5c6364fec55e84309b2fb6986f206699f1800/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/gnutls/gnutls.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index 8a7f3f7..8ab0665 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GNUTLS_VERSION = 3.2.7
> +GNUTLS_VERSION = 3.2.6
>  GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
>  GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v3.2
>  GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
> -- 
> 1.8.3.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
