From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 23:39:13 +0200
Subject: [Buildroot] [PATCH 1/2] libinput: add explicit event-gui
 handling
In-Reply-To: <1461273652-8935-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461273652-8935-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160421233913.7ed963dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Apr 2016 18:20:51 -0300, Gustavo Zacarias wrote:

> diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
> index 6d8b7b6..2954760 100644
> --- a/package/libinput/libinput.mk
> +++ b/package/libinput/libinput.mk
> @@ -7,13 +7,18 @@
>  LIBINPUT_VERSION = 1.1.5
>  LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
>  LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
> -LIBINPUT_LICENSE = MIT
> -LIBINPUT_LICENSE_FILES = COPYING
> -
>  LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
>  LIBINPUT_INSTALL_STAGING = YES
> -
> +LIBINPUT_LICENSE = MIT
> +LIBINPUT_LICENSE_FILES = COPYING

You say in the commit log you're doing whitespace changes, but it seems
like the licence lines were moved down in the file. For what reason?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
