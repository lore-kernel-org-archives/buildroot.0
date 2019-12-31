From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 16:20:49 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add Masahiro Yamada as contact
 for arm_foundation_v8_defconfig
In-Reply-To: <20190811120739.26539-15-thomas.petazzoni@bootlin.com>
References: <20190811120739.26539-15-thomas.petazzoni@bootlin.com>
Message-ID: <20191231152049.GI26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-08-11 14:07 +0200, Thomas Petazzoni spake thusly:
> Masahiro is the last person who made significant changes to this
> defconfig, so let's add him as a contact for it, so that he receives
> notifications of build failures and gets Cc'ed on patches.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to master, thanks.

> ---
> Masahiro, could you reply with a Acked-by if you're willing to
> maintain this defconfig in Buildroot? Thanks!

Masahiro, we really need people to take care of the defconfigs, at least
when they fail to build. Without caretakers interested in those, we may
have to remove them in the end.

If you really can't handle it, please say so, so we can take appropriate
action.

Thanks! ;-)

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 409a0364c2..35e8d871bc 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1499,6 +1499,10 @@ F:	package/tslib/
>  F:	package/x11r7/xdriver_xf86-input-tslib/
>  F:	package/x11vnc/
>  
> +N:	Masahiro Yamada <yamada.masahiro@socionext.com>
> +F:	board/arm/foundation-v8/
> +F:	configs/arm_foundationv8_defconfig
> +
>  N:	Mathieu Audat <mathieu.audat@savoirfairelinux.com>
>  F:	board/technologic/ts4900/
>  F:	configs/ts4900_defconfig
> -- 
> 2.21.0
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
