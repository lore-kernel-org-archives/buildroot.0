From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 21:49:50 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/x11r7/xserver_xorg-server:
 bump version to 1.20.5
In-Reply-To: <20190602100321.7601-1-bernd.kuhls@t-online.de>
References: <20190602100321.7601-1-bernd.kuhls@t-online.de>
Message-ID: <20190620214950.0a3a0c87@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  2 Jun 2019 12:03:21 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-modesettings-needs-dri2.patch                 |  0
>  ...02-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  0
>  .../0003-Remove-check-for-useSIGIO-option.patch        |  0
>  .../0004-include-misc.h-fix-uClibc-build.patch         |  0
>  ...hw-xwayland-Makefile.am-fix-build-without-glx.patch |  0
>  package/x11r7/xserver_xorg-server/Config.in            |  4 ++--
>  .../x11r7/xserver_xorg-server/xserver_xorg-server.hash | 10 +++++-----
>  7 files changed, 7 insertions(+), 7 deletions(-)
>  rename package/x11r7/xserver_xorg-server/{1.20.4 => 1.20.5}/0001-modesettings-needs-dri2.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.4 => 1.20.5}/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.4 => 1.20.5}/0003-Remove-check-for-useSIGIO-option.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.4 => 1.20.5}/0004-include-misc.h-fix-uClibc-build.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.4 => 1.20.5}/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
