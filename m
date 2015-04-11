From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2015 11:03:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: Show toolchain
 comment only on mmu archs
In-Reply-To: <1428739246-3867-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428739246-3867-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150411090304.GB4221@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-11 10:00 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/e2fsprogs/Config.in |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
> index f5011d1..12d135b 100644
> --- a/package/e2fsprogs/Config.in
> +++ b/package/e2fsprogs/Config.in
> @@ -100,3 +100,4 @@ endif
>  
>  comment "e2fsprogs needs a toolchain w/ wchar"
>  	depends on !BR2_USE_WCHAR
> +	depends on BR2_USE_MMU

We usually put that dependency first. But that's not too problemtaic,
so:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> -- 
> 1.7.10.4
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
