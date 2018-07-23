From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Mon, 23 Jul 2018 17:10:12 +0200
Subject: [Buildroot] [PATCH 2/2] package/ti-utils: update website infos
In-Reply-To: <1532358612-4150-1-git-send-email-julien.boibessot@free.fr>
References: <1532358612-4150-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <1532358612-4150-2-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

As kernel wireless wiki doesn't seem to have the doc about wl12xx calibration,
points to a backup of the old site.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 package/ti-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-utils/Config.in b/package/ti-utils/Config.in
index 0b75c4d..9923234 100644
--- a/package/ti-utils/Config.in
+++ b/package/ti-utils/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_TI_UTILS
 	  The calibrator and other useful utilities for TI wireless
 	  solution, based on wl12xx driver.
 
-	  http://linuxwireless.org/en/users/Drivers/wl12xx/calibrator
+	  http://linuxwireless.sipsolutions.net/en/users/Drivers/wl12xx/calibrator/
 
 comment "ti-utils needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.1.4
