From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Oct 2017 15:57:22 +0200
Subject: [Buildroot] [PATCH 1/4] package/x11r7/xlib_libXfont2: bump
 version to 2.0.2
In-Reply-To: <20171014113728.22890-1-bernd.kuhls@t-online.de>
References: <20171014113728.22890-1-bernd.kuhls@t-online.de>
Message-ID: <20171015155722.3f84d337@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 Oct 2017 13:37:25 +0200, Bernd Kuhls wrote:
> Removed patches applied upstream, added all upstream hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...nd-of-string-in-PatternMatch-CVE-2017-137.patch | 34 --------------
>  ...rties-Check-string-boundaries-CVE-2017-13.patch | 52 ----------------------
>  package/x11r7/xlib_libXfont2/xlib_libXfont2.hash   |  7 ++-
>  package/x11r7/xlib_libXfont2/xlib_libXfont2.mk     |  2 +-
>  4 files changed, 6 insertions(+), 89 deletions(-)
>  delete mode 100644 package/x11r7/xlib_libXfont2/0001-Check-for-end-of-string-in-PatternMatch-CVE-2017-137.patch
>  delete mode 100644 package/x11r7/xlib_libXfont2/0002-pcfGetProperties-Check-string-boundaries-CVE-2017-13.patch

All four patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
