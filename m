From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 21:21:37 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] package/ti-utils: update
 website URL
Message-ID: <20180823191357.D16878E389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=114bba0df0beb0f8eb0cf47efdc34637b92df4c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

As kernel wireless wiki doesn't seem to have the doc about wl12xx
calibration, points to a backup of the old site.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f0a0ace4212597307c21e058f7f40eee4a3d71a4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-utils/Config.in b/package/ti-utils/Config.in
index 0b75c4d5be..992323487e 100644
--- a/package/ti-utils/Config.in
+++ b/package/ti-utils/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_TI_UTILS
 	  The calibrator and other useful utilities for TI wireless
 	  solution, based on wl12xx driver.
 
-	  http://linuxwireless.org/en/users/Drivers/wl12xx/calibrator
+	  http://linuxwireless.sipsolutions.net/en/users/Drivers/wl12xx/calibrator/
 
 comment "ti-utils needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
