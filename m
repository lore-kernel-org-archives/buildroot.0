From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Jul 2020 21:25:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5: fix check-package warnings
In-Reply-To: <1593778322-13727-1-git-send-email-pjtexier@koncepto.io>
References: <1593778322-13727-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20200703192557.GD20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pierre-Jean, All,

On 2020-07-03 14:12 +0200, Pierre-Jean Texier spake thusly:
> Fixes:
> 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/622129163
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Applied to master, thanks.

/me has to check why his post-apply hook did not trigger...

Regards,
Yann E. MORIN.

> ---
>  package/qt5/qt5.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
> index 4fa687f..a2572be 100644
> --- a/package/qt5/qt5.mk
> +++ b/package/qt5/qt5.mk
> @@ -21,7 +21,7 @@ endef
>  
>  ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>  define QT5_QT_CONF_FIXUP
> -        $(QT5_INSTALL_QT_CONF)
> +	$(QT5_INSTALL_QT_CONF)
>  endef
>  endif
>  
> -- 
> 2.7.4
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
