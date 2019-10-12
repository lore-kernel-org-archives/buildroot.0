From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 15:29:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libX11: bump version
 to 1.6.9
In-Reply-To: <20191012055629.18055-1-bernd.kuhls@t-online.de>
References: <20191012055629.18055-1-bernd.kuhls@t-online.de>
Message-ID: <20191012152914.333002f0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Oct 2019 07:56:29 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patched applied upstream:
> 
> 0001-makekeys-detach-ourselves-from-X-headers-entirely.patch
> https://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=0327c427d62f671eced067c6d9b69f4e216a8cac
> 
> 0002-remove-reliance-on-static-libc.patch
> https://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=edc7680ed5a03cedb5facf14693823455e12c29c
> 
> Removed autoreconf.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ch-ourselves-from-X-headers-entirely.patch | 39 -------------------
>  .../0002-remove-reliance-on-static-libc.patch | 36 -----------------
>  package/x11r7/xlib_libX11/xlib_libX11.hash    | 10 ++---
>  package/x11r7/xlib_libX11/xlib_libX11.mk      |  3 +-
>  4 files changed, 6 insertions(+), 82 deletions(-)
>  delete mode 100644 package/x11r7/xlib_libX11/0001-makekeys-detach-ourselves-from-X-headers-entirely.patch
>  delete mode 100644 package/x11r7/xlib_libX11/0002-remove-reliance-on-static-libc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
