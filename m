From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 18:21:40 +0100
Subject: [Buildroot] [PATCH 2/2] Add libjson-glib to make menu
In-Reply-To: <1295248645-3677-2-git-send-email-EliasWoods@gmail.com>
References: <1295248645-3677-1-git-send-email-EliasWoods@gmail.com>
	<1295248645-3677-2-git-send-email-EliasWoods@gmail.com>
Message-ID: <20110124182140.349b3a64@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This should be part of the patch that also introduces libjson-glib.

On Mon, 17 Jan 2011 02:17:25 -0500
Elias Woods <eliaswoods@gmail.com> wrote:

> diff --git a/package/Config.in b/package/Config.in
> index 48f245c..0f21fb6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -328,6 +328,11 @@ source "package/libdaemon/Config.in"
>  source "package/libelf/Config.in"
>  source "package/libevent/Config.in"
>  source "package/libglib2/Config.in"
> +if BR2_PACKAGE_LIBGLIB2
> +menu "glib addons"
> +source "package/libjson-glib/Config.in"
> +endmenu
> +endif
>  source "package/liboil/Config.in"
>  source "package/libsigc/Config.in"
>  source "package/startup-notification/Config.in"

-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
