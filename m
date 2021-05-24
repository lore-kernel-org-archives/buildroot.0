From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 15:28:30 +0200
Subject: [Buildroot] [PATCH] package/libffi: drop superfluous
 CPE_ID_VERSION
In-Reply-To: <20210524125327.2098921-1-yann.morin.1998@free.fr>
References: <20210524125327.2098921-1-yann.morin.1998@free.fr>
Message-ID: <20210524132830.GC3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2021-05-24 14:53 +0200, Yann E. MORIN spake thusly:
> The default for FOO_CPE_ID_VERSION is to default to FOO_VERSION, so drop
> this superfluous definition.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libffi/libffi.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
> index f8b6568341..c7705b9e46 100644
> --- a/package/libffi/libffi.mk
> +++ b/package/libffi/libffi.mk
> @@ -6,7 +6,6 @@
>  
>  LIBFFI_VERSION = 3.3
>  LIBFFI_SITE = $(call github,libffi,libffi,v$(LIBFFI_VERSION))
> -LIBFFI_CPE_ID_VERSION = 3.3
>  LIBFFI_CPE_ID_UPDATE = rc0
>  LIBFFI_LICENSE = MIT
>  LIBFFI_LICENSE_FILES = LICENSE
> -- 
> 2.25.1
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
