From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 22:10:50 +0200
Subject: [Buildroot] [PATCH 21/54] nasm: add license information
In-Reply-To: <1403636160-11807-21-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-21-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140625201050.GI3489@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

LICENSE is here, a few random files are indeed BSD-2c.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/nasm/nasm.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
> index 18efa4a..b9077eb 100644
> --- a/package/nasm/nasm.mk
> +++ b/package/nasm/nasm.mk
> @@ -5,8 +5,10 @@
>  ################################################################################
>  
>  NASM_VERSION = 2.11.02
> -NASM_SOURCE  = nasm-$(NASM_VERSION).tar.xz
> -NASM_SITE    = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
> +NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
> +NASM_SITE = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
> +NASM_LICENSE = BSD-2c
> +NASM_LICENSE_FILES = LICENSE
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
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
