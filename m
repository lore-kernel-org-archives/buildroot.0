From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2020 22:25:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: bump
 version to 1.20.7
In-Reply-To: <20200114185728.46824-1-bernd.kuhls@t-online.de>
References: <20200114185728.46824-1-bernd.kuhls@t-online.de>
Message-ID: <20200114222546.49d60bc2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jan 2020 19:57:28 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Added patch to fix build error.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-modesettings-needs-dri2.patch        |  0
>  ...ure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  0
>  ...003-Remove-check-for-useSIGIO-option.patch |  0
>  ...0004-include-misc.h-fix-uClibc-build.patch |  0
>  ...nd-Makefile.am-fix-build-without-glx.patch |  0
>  ...mon-xf86Init.c-fix-build-without-glx.patch |  0
>  ...-modesetting-explicitly-include-mi-h.patch | 31 +++++++++++++++++++
>  package/x11r7/xserver_xorg-server/Config.in   |  4 +--
>  .../xserver_xorg-server.hash                  | 10 +++---
>  9 files changed, 38 insertions(+), 7 deletions(-)
>  rename package/x11r7/xserver_xorg-server/{1.20.6 => 1.20.7}/0001-modesettings-needs-dri2.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.6 => 1.20.7}/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.6 => 1.20.7}/0003-Remove-check-for-useSIGIO-option.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.6 => 1.20.7}/0004-include-misc.h-fix-uClibc-build.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.6 => 1.20.7}/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.6 => 1.20.7}/0006-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch (100%)
>  create mode 100644 package/x11r7/xserver_xorg-server/1.20.7/0007-modesetting-explicitly-include-mi-h.patch

Applied to master, thanks. Though it's not great that when bumping we
have to *add* more patches, instead of removing patches.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
