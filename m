From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 12 Dec 2009 03:23:46 +0100
Subject: [Buildroot] [PATCH 4/6] package: Added libdvdread package
 (dependency of gst-plugins-bad)
In-Reply-To: <1260487878-21126-5-git-send-email-llandwerlin@gmail.com>
References: <1260487878-21126-1-git-send-email-llandwerlin@gmail.com>
	<1260487878-21126-5-git-send-email-llandwerlin@gmail.com>
Message-ID: <1260584626.9059.19.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le vendredi 11 d?cembre 2009 ? 00:31 +0100, llandwerlin at gmail.com a
?crit :
> From: Lionel Landwerlin <llandwerlin@gmail.com>
> 
> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
> ---
>  package/multimedia/Config.in                |    1 +
>  package/multimedia/libdvdread/Config.in     |    7 +++++++
>  package/multimedia/libdvdread/libdvdread.mk |   13 +++++++++++++
>  3 files changed, 21 insertions(+), 0 deletions(-)
>  create mode 100644 package/multimedia/libdvdread/Config.in
>  create mode 100644 package/multimedia/libdvdread/libdvdread.mk
> 
> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
> index 7f60dcd..cd07fdc 100644

> +
> +LIBDVDREAD_VERSION = 4.1.3
> +LIBDVDREAD_SOURCE = libdvdread_$(LIBDVDREAD_VERSION).orig.tar.gz
> +LIBDVDREAD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libd/libdvdread/
> +LIBDVDREAD_INSTALL_STAGING = YES
> +LIBDVDREAD_INSTALL_TARGET = YES
> +
> +$(eval $(call AUTOTARGETS,package/multimedia,libdvdread))

This one was broken too...

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-package-Added-libdvdread-package-dependency-of-gst-p.patch
Type: text/x-patch
Size: 2364 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091212/32055ee0/attachment.bin>
