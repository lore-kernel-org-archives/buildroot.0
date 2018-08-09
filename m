From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 10:34:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: bump
 version to 1.20.1
In-Reply-To: <20180807203736.31559-1-bernd.kuhls@t-online.de>
References: <20180807203736.31559-1-bernd.kuhls@t-online.de>
Message-ID: <20180809103422.1a961e3d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Aug 2018 22:37:36 +0200, Bernd Kuhls wrote:
> Release notes for this bugfix release:
> https://lists.x.org/archives/xorg-announce/2018-August/002912.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-modesettings-needs-dri2.patch                 |  0
>  ...02-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  0
>  .../0003-Remove-check-for-useSIGIO-option.patch        |  0
>  .../0004-include-misc.h-fix-uClibc-build.patch         |  0
>  package/x11r7/xserver_xorg-server/Config.in            |  4 ++--
>  .../x11r7/xserver_xorg-server/xserver_xorg-server.hash | 10 +++++-----
>  6 files changed, 7 insertions(+), 7 deletions(-)
>  rename package/x11r7/xserver_xorg-server/{1.20.0 => 1.20.1}/0001-modesettings-needs-dri2.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.0 => 1.20.1}/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.0 => 1.20.1}/0003-Remove-check-for-useSIGIO-option.patch (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.0 => 1.20.1}/0004-include-misc.h-fix-uClibc-build.patch (100%)

We normally don't apply version bumps in master, but since 1.20.0 was
introduced fairly late in our release cycle, and this is really a bug
fix release of an important package, I decided to take this in master.

So: applied to master!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
