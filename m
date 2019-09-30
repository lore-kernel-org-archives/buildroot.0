From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:20:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXt: bump version
 to 1.2.0
In-Reply-To: <20190929175550.18569-1-bernd.kuhls@t-online.de>
References: <20190929175550.18569-1-bernd.kuhls@t-online.de>
Message-ID: <20190930232016.39acac90@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 19:55:50 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch applied upstream:
> https://cgit.freedesktop.org/xorg/lib/libXt/commit/?id=0b80bc9904c8d553c760651daca0c964df052c8b
> Also removed _AUTORECONF.
> 
> Added all hashes provided by upstream.
> 
> Updated license hash after upstream commit:
> https://cgit.freedesktop.org/xorg/lib/libXt/commit/?id=a8dcb749458a723dd76e342162c5c00b629374fe
> 
> Removed configure option install-makestrs after upstream commit:
> https://cgit.freedesktop.org/xorg/lib/libXt/commit/?id=345633dc9c79b32a1b391dfb4dfedf87ae9e291b
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...n-t-link-makestrs-with-target-cflags.patch | 33 -------------------
>  package/x11r7/xlib_libXt/xlib_libXt.hash      | 10 ++++--
>  package/x11r7/xlib_libXt/xlib_libXt.mk        |  5 ++-
>  3 files changed, 9 insertions(+), 39 deletions(-)
>  delete mode 100644 package/x11r7/xlib_libXt/0001-util-don-t-link-makestrs-with-target-cflags.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
