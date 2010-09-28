From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 29 Sep 2010 01:29:45 +0200
Subject: [Buildroot] [PATCH 2/3] libglib2: bump version to 2.24.2
In-Reply-To: <4521f45c3a8a87d3cdbbc774dfbb935b58e587e8.1285711883.git.thomas.petazzoni@free-electrons.com>
References: <cover.1285711882.git.thomas.petazzoni@free-electrons.com>
	<4521f45c3a8a87d3cdbbc774dfbb935b58e587e8.1285711883.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1285716585.27944.305.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just for information, Glib 2.26 has been released 2 days ago.

Le mercredi 29 septembre 2010 ? 00:12 +0200, Thomas Petazzoni a ?crit :
> This is a mechanical bump, no other changes involved.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libglib2/libglib2.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 61e8c1c..e45e89c 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -4,7 +4,7 @@
>  #
>  #############################################################
>  LIBGLIB2_VERSION_MAJOR = 2.24
> -LIBGLIB2_VERSION_MINOR = 1
> +LIBGLIB2_VERSION_MINOR = 2
>  LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
>  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
>  LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
