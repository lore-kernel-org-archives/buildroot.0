From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Jun 2014 23:45:33 +0200
Subject: [Buildroot] [PATCH 06/54] liesmtp: add license information
In-Reply-To: <1403636160-11807-6-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140624214533.GE31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

COPYING is GPLv2; COPYING.LIB is LGPLv2.1.
Files either refer to GPLv2+ or LGPLv2.1+.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libesmtp/libesmtp.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
> index f3f5611..cad2e27 100644
> --- a/package/libesmtp/libesmtp.mk
> +++ b/package/libesmtp/libesmtp.mk
> @@ -10,5 +10,7 @@ LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
>  LIBESMTP_INSTALL_STAGING = YES
>  LIBESMTP_CONFIG_SCRIPTS = libesmtp-config
>  LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
> +LIBESMTP_LICENSE = GPLv2+ (examples), LGPLv2.1+ (library)
> +LIBESMTP_LICENSE_FILES = COPYING COPYING.LIB
>  
>  $(eval $(autotools-package))
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
