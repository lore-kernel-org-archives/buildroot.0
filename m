From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 9 Mar 2019 21:53:40 +0100
Subject: [Buildroot] [PATCH 1/1] Changed download links for libxml2 and
 libxslt
In-Reply-To: <CAJSYY8fUi_chaMOAYPe3whv8c7enG0UxuDFxnaFaR4WFeU31xw@mail.gmail.com>
References: <CAJSYY8e8_uGy5ELd7JpLpVitw-rG3WogxhxhUQxRzVNndfnECw@mail.gmail.com>
 <20190308234112.2128603a@gmx.net>
 <CAJSYY8fUi_chaMOAYPe3whv8c7enG0UxuDFxnaFaR4WFeU31xw@mail.gmail.com>
Message-ID: <20190309215340.7f53d68c@gmx.net>
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

On Sat, 9 Mar 2019 18:58:48 +0530, Nityananda Padhan <ntneitin@gmail.com> wrote:

> From f0f7715ecb3c5e08a0c1d96f6844acbad8b294bf Mon Sep 17 00:00:00 2001
> From: Nityananda Padhan <ntneitin@gmail.com>
> Date: Sat, 9 Mar 2019 18:36:09 +0530
> Subject: [PATCH 1/2] package/libxml2: change download site to http
> 
> Changes to be committed:
> modified:   package/libxml2/libxml2.mk
> 
> Signed-off-by: Nityananda Padhan <ntneitin@gmail.com>
> ---
>  package/libxml2/libxml2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index 3b3714fff1..f4b4de090e 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
> 
>  LIBXML2_VERSION = 2.9.9
> -LIBXML2_SITE = ftp://xmlsoft.org/libxml2
> +LIBXML2_SITE = http://xmlsoft.org/sources
>  LIBXML2_INSTALL_STAGING = YES
>  LIBXML2_LICENSE = MIT
>  LIBXML2_LICENSE_FILES = COPYING
