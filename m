From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Jul 2021 23:30:04 +0200
Subject: [Buildroot] [PATCH 1/1] Config.in.legacy: create 2021.08
In-Reply-To: <20210704205112.3410146-1-fontaine.fabrice@gmail.com>
References: <20210704205112.3410146-1-fontaine.fabrice@gmail.com>
Message-ID: <20210706213004.GA410642@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-07-04 22:51 +0200, Fabrice Fontaine spake thusly:
> Commit 469c11c516959375f6caddde178adbdcdc5d9887 wrongly added a new
> option to 2021.05 which has been released, move it to 2021.08
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index bcbb625edb..1049d7af3c 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -144,7 +144,7 @@ endif
>  
>  ###############################################################################
>  
> -comment "Legacy options removed in 2021.05"
> +comment "Legacy options removed in 2021.08"
>  
>  config BR2_PACKAGE_PHP_EXT_XMLRPC
>  	bool "PHP XMLRPC extension removed"
> @@ -153,6 +153,8 @@ config BR2_PACKAGE_PHP_EXT_XMLRPC
>  	  The XMLRPC php extension was removed.
>  	  See: https://wiki.php.net/rfc/unbundle_xmlprc
>  
> +comment "Legacy options removed in 2021.05"
> +
>  config BR2_PACKAGE_UDISKS_LVM2
>  	bool "udisks lvm2 support removed"
>  	select BR2_LEGACY
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
