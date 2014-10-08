From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 8 Oct 2014 22:59:37 +0200
Subject: [Buildroot] [PATCH 5/7 v2] package/freerdp: also install to
	staging
In-Reply-To: <9a8e25046eacb4cdc4cacc5d21817e08762b008e.1412634775.git.yann.morin.1998@free.fr>
References: <cover.1412634775.git.yann.morin.1998@free.fr>
 <9a8e25046eacb4cdc4cacc5d21817e08762b008e.1412634775.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+UoooK+oJ4L2qb8efSX5Er4iSVE-LwhsdKy74Lp_ADFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 7, 2014 at 12:35 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> freerdp installs a library that other packages may use, so
> we must also install it to staging.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Samuel Martin <s.martin49@gmail.com>

> ---
>  package/freerdp/freerdp.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index 594bab3..ea590d1 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -11,6 +11,8 @@ FREERDP_DEPENDENCIES = openssl zlib
>  FREERDP_LICENSE = Apache-2.0
>  FREERDP_LICENSE_FILES = LICENSE
>
> +FREERDP_INSTALL_STAGING = YES
> +
>  FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF
>
>  ifeq ($(BR2_PACKAGE_FREERDP_NEEDS_XLIBS),y)
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Samuel
