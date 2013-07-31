From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 13:56:35 +0200
Subject: [Buildroot] [git commit] merge assuan
In-Reply-To: <20130731114959.21F209AEB9@busybox.osuosl.org>
References: <20130731114959.21F209AEB9@busybox.osuosl.org>
Message-ID: <20130731135635.299531db@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Jul 2013 13:49:07 +0200, Thomas Petazzoni wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=fc8b560d8a6948553aa6396b8f0b784809b2df3d
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> ---
>  package/libassuan/libassuan.mk |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
> index 6d4f7e5..5f5378b 100644
> --- a/package/libassuan/libassuan.mk
> +++ b/package/libassuan/libassuan.mk
> @@ -7,8 +7,8 @@
>  LIBASSUAN_VERSION = 2.1.1
>  LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan/
>  LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
> -LIBASSUAN_LICENSE = LGPLv2.1+
> -LIBASSUAN_LICENSE_FILES = COPYING.LIB
> +LIBASSUAN_LICENSE = LGPLv2.1+ (library), GPLv3 (tests, doc)
> +LIBASSUAN_LICENSE_FILES = COPYING.LIB COPYING
>  LIBASSUAN_INSTALL_STAGING = YES
>  LIBASSUAN_DEPENDENCIES = libgpg-error
>  LIBASSUAN_CONF_OPT = \

Crap, my bad, forgot to rebase before pushing. Since I won't rebase now
that I have pushed, this is going to stay forever in the history. Sorry
for the mess.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
