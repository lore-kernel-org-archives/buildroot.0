From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:35:28 +0100
Subject: [Buildroot] [PATCH 01/31] package/x11r7/xserver_xorg-server:
 bump version to 1.20.4
In-Reply-To: <20190315180256.20256-1-bernd.kuhls@t-online.de>
References: <20190315180256.20256-1-bernd.kuhls@t-online.de>
Message-ID: <20190315213528.06511196@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Mar 2019 19:02:27 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-modesettings-needs-dri2.patch                 |  0
>  ...02-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  0
>  .../0003-Remove-check-for-useSIGIO-option.patch        |  0
>  .../0004-include-misc.h-fix-uClibc-build.patch         |  0
>  package/x11r7/xserver_xorg-server/Config.in            |  4 ++--
>  .../x11r7/xserver_xorg-server/xserver_xorg-server.hash | 10 +++++-----
>  6 files changed, 7 insertions(+), 7 deletions(-)
>  rename package/x11r7/xserver_xorg-server/{1.20.3 => 1.20.4}/0001-modesettings-needs-dri2.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.3 => 1.20.4}/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.3 => 1.20.4}/0003-Remove-check-for-useSIGIO-option.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.3 => 1.20.4}/0004-include-misc.h-fix-uClibc-build.patch (100%)

Thanks, entire series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
