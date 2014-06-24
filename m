From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 00:01:03 +0200
Subject: [Buildroot] [PATCHv2] libfreefare: add license information
In-Reply-To: <1403647146-21314-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403647146-21314-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140624220103.GK31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 18:59 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libfreefare/libfreefare.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
> index 362cab2..1b90c3b 100644
> --- a/package/libfreefare/libfreefare.mk
> +++ b/package/libfreefare/libfreefare.mk
> @@ -7,6 +7,8 @@
>  LIBFREEFARE_VERSION = 0.3.4
>  LIBFREEFARE_SITE = http://libfreefare.googlecode.com/files
>  LIBFREEFARE_DEPENDENCIES = libnfc openssl
> +LIBFREEFARE_LICENSE = LGPLv3+ with exception
> +LIBFREEFARE_LICENSE_FILES = COPYING
>  
>  ifeq ($(BR2_PREFER_STATIC_LIB),y)
>  # openssl needs zlib even if the libfreefare example itself doesn't
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
