From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Oct 2018 09:34:37 +0200
Subject: [Buildroot] [PATCH 1/4] package/x11r7/xserver_xorg-server: bump
 version to 1.20.2
In-Reply-To: <20181015164734.16624-1-bernd.kuhls@t-online.de>
References: <20181015164734.16624-1-bernd.kuhls@t-online.de>
Message-ID: <20181018093437.6e5fe0d2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Oct 2018 18:47:30 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-modesettings-needs-dri2.patch                 |  0
>  ...02-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  0
>  .../0003-Remove-check-for-useSIGIO-option.patch        |  0
>  .../0004-include-misc.h-fix-uClibc-build.patch         |  0
>  package/x11r7/xserver_xorg-server/Config.in            |  4 ++--
>  .../x11r7/xserver_xorg-server/xserver_xorg-server.hash | 10 +++++-----
>  6 files changed, 7 insertions(+), 7 deletions(-)
>  rename package/x11r7/xserver_xorg-server/{1.20.1 => 1.20.2}/0001-modesettings-needs-dri2.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.1 => 1.20.2}/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.1 => 1.20.2}/0003-Remove-check-for-useSIGIO-option.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.1 => 1.20.2}/0004-include-misc.h-fix-uClibc-build.patch (100%)

Series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
