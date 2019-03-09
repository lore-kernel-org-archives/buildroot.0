From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 9 Mar 2019 21:55:03 +0100
Subject: [Buildroot] [PATCH 1/1] Changed download links for libxml2 and
 libxslt
In-Reply-To: <CAJSYY8cDvs-X_pJBvU7o1hDojbXsTerbNqyV3aCLtEg9-xNtJQ@mail.gmail.com>
References: <CAJSYY8e8_uGy5ELd7JpLpVitw-rG3WogxhxhUQxRzVNndfnECw@mail.gmail.com>
 <20190308234112.2128603a@gmx.net>
 <CAJSYY8fUi_chaMOAYPe3whv8c7enG0UxuDFxnaFaR4WFeU31xw@mail.gmail.com>
 <CAJSYY8cDvs-X_pJBvU7o1hDojbXsTerbNqyV3aCLtEg9-xNtJQ@mail.gmail.com>
Message-ID: <20190309215503.5ae94ccf@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nityananda,

thanks for the rework, patch looks good, but please keep buildroot at buildroot.org in CC...

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

On Sat, 9 Mar 2019 18:59:16 +0530, Nityananda Padhan <ntneitin@gmail.com> wrote:

> From dc92f5d7088a9c1c5be0151f2736df900db35e70 Mon Sep 17 00:00:00 2001
> From: Nityananda Padhan <ntneitin@gmail.com>
> Date: Sat, 9 Mar 2019 18:50:05 +0530
> Subject: [PATCH 2/2] package/libxslt: change download site to http
> 
> Changes to be committed:
> modified:   package/libxslt/libxslt.mk
> 
> Signed-off-by: Nityananda Padhan <ntneitin@gmail.com>
> ---
>  package/libxslt/libxslt.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
> index 5b1c0ae268..4632301b16 100644
> --- a/package/libxslt/libxslt.mk
> +++ b/package/libxslt/libxslt.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
> 
>  LIBXSLT_VERSION = 1.1.32
> -LIBXSLT_SITE = ftp://xmlsoft.org/libxslt
> +LIBXSLT_SITE = http://xmlsoft.org/sources
>  LIBXSLT_INSTALL_STAGING = YES
>  LIBXSLT_LICENSE = MIT
>  LIBXSLT_LICENSE_FILES = COPYING
