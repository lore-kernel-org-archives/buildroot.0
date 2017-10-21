From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:20:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfont: bump
 version to 1.5.3
In-Reply-To: <20171021175353.10854-1-bernd.kuhls@t-online.de>
References: <20171021175353.10854-1-bernd.kuhls@t-online.de>
Message-ID: <20171021212030.2bbcdd12@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Oct 2017 19:53:53 +0200, Bernd Kuhls wrote:
> Added all hashes provided by upstream.
> 
> Removed patches applied upstream:
> https://cgit.freedesktop.org/xorg/lib/libXfont/commit/?h=libXfont-1.5-branch&id=a2a5fa591762b430037e33f1df55b460550ab406
> https://cgit.freedesktop.org/xorg/lib/libXfont/commit/?h=libXfont-1.5-branch&id=3b08934dca75e4c559db7d83797bc3d365c2a50a
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...nd-of-string-in-PatternMatch-CVE-2017-137.patch | 34 --------------
>  ...rties-Check-string-boundaries-CVE-2017-13.patch | 52 ----------------------
>  package/x11r7/xlib_libXfont/xlib_libXfont.hash     |  7 ++-
>  package/x11r7/xlib_libXfont/xlib_libXfont.mk       |  2 +-
>  4 files changed, 6 insertions(+), 89 deletions(-)
>  delete mode 100644 package/x11r7/xlib_libXfont/0001-Check-for-end-of-string-in-PatternMatch-CVE-2017-137.patch
>  delete mode 100644 package/x11r7/xlib_libXfont/0002-pcfGetProperties-Check-string-boundaries-CVE-2017-13.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
