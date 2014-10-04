From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Oct 2014 19:22:09 +0200
Subject: [Buildroot] [PATCH] package/pkg-cmake.mk: rename
 _INSTALL_HOST_OPTS -> _INSTALL_OPTS
In-Reply-To: <1412443142-12817-1-git-send-email-s.martin49@gmail.com>
References: <1412443142-12817-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20141004172209.GE3990@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-10-04 19:19 +0200, Samuel Martin spake thusly:
> This pacth renames, consistently with the other package infrastructures,
> the _INSTALL_OPTS variable for host CMake-based package.
> 
> As mentioned in [1], no host-cmake-package uses this variable so far; so
> it is a safe rename.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2014-October/107712.html
> 
> Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-cmake.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 85d8828..2bea003 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -41,7 +41,7 @@ $(2)_CONF_OPTS			?=
>  $(2)_MAKE			?= $$(MAKE)
>  $(2)_MAKE_ENV			?=
>  $(2)_MAKE_OPTS			?=
> -$(2)_INSTALL_HOST_OPTS		?= install
> +$(2)_INSTALL_OPTS		?= install
>  $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
>  $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
>  
> -- 
> 2.1.2
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
