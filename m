From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Jun 2014 23:35:59 +0200
Subject: [Buildroot] [PATCH 03/54] kexec: add license information
In-Reply-To: <1403636160-11807-3-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140624213559.GC31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

COPYING is indeed GPLv2. Files seem to all be missing a license header.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kexec/kexec.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
> index 9787038..609825a 100644
> --- a/package/kexec/kexec.mk
> +++ b/package/kexec/kexec.mk
> @@ -7,6 +7,8 @@
>  KEXEC_VERSION = 2.0.7
>  KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
>  KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
> +KEXEC_LICENSE = GPLv2
> +KEXEC_LICENSE_FILES = COPYING
>  
>  ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
>  KEXEC_CONF_OPT += --with-zlib
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
