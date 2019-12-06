From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 22:29:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: bump
 version to 1.20.6
In-Reply-To: <20191206183440.14737-1-bernd.kuhls@t-online.de>
References: <20191206183440.14737-1-bernd.kuhls@t-online.de>
Message-ID: <20191206222959.0868365c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Dec 2019 19:34:40 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patches 0006 & 0007 which were applied upstream as single
> commit on the server-1.20-branch branch:
> https://gitlab.freedesktop.org/xorg/xserver/commit/07efd81b819f21046afc0bb7e19a6cdf7f3c7ea9
> 
> Updated upstream URL for patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-only-use-inx-outx-on-ARM-with-glibc.patch | 34 ----------
>  ...t-include-sys-io.h-on-ARM-with-glibc.patch | 62 -------------------
>  .../0001-modesettings-needs-dri2.patch        |  2 +-
>  ...ure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  0
>  ...003-Remove-check-for-useSIGIO-option.patch |  0
>  ...0004-include-misc.h-fix-uClibc-build.patch |  0
>  ...nd-Makefile.am-fix-build-without-glx.patch |  0
>  package/x11r7/xserver_xorg-server/Config.in   |  4 +-
>  .../xserver_xorg-server.hash                  | 10 +--
>  9 files changed, 8 insertions(+), 104 deletions(-)
>  delete mode 100644 package/x11r7/xserver_xorg-server/1.20.5/0006-compiler.h-only-use-inx-outx-on-ARM-with-glibc.patch
>  delete mode 100644 package/x11r7/xserver_xorg-server/1.20.5/0007-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch
>  rename package/x11r7/xserver_xorg-server/{1.20.5 => 1.20.6}/0001-modesettings-needs-dri2.patch (89%)
>  rename package/x11r7/xserver_xorg-server/{1.20.5 => 1.20.6}/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.5 => 1.20.6}/0003-Remove-check-for-useSIGIO-option.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.5 => 1.20.6}/0004-include-misc.h-fix-uClibc-build.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.5 => 1.20.6}/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
