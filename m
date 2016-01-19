From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Jan 2016 21:16:10 +0100
Subject: [Buildroot] [PATCH v3 3/3] util-linux: put package options in a
 sub-menu
In-Reply-To: <1436842628-29469-3-git-send-email-danomimanchego123@gmail.com>
References: <1436842628-29469-1-git-send-email-danomimanchego123@gmail.com>
 <1436842628-29469-3-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20160119201610.GD3360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2015-07-13 22:57 -0400, Danomi Manchego spake thusly:
> Hide all the util-linux options in a menuconfig, as the option
> list is quite long.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/util-linux/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index 042cae0..c8d16d2 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_PACKAGE_UTIL_LINUX
> +menuconfig BR2_PACKAGE_UTIL_LINUX
>  	bool "util-linux"
>  	depends on BR2_USE_WCHAR
>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
> -- 
> 1.9.1
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
