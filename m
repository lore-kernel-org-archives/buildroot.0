From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  8 Feb 2017 10:06:23 +0200
Subject: [Buildroot] [PATCH] lm-sensors: update homepage link
Message-ID: <129ad05f12d50d1b3576187a31d2d78fc2b4b5b0.1486541183.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The lm-sensors.org website is down, and won't be coming back anytime soon. Use
the suggested[1], far from adequate, alternative.

[1] https://github.com/groeck/lm-sensors/issues/3

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lm-sensors/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lm-sensors/Config.in b/package/lm-sensors/Config.in
index 7065c4cb1e7c..b035f5d0d51a 100644
--- a/package/lm-sensors/Config.in
+++ b/package/lm-sensors/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LM_SENSORS
 	  temperature, voltage, and fan speed sensors. It
 	  works with most newer systems.
 
-	  http://www.lm-sensors.org/
+	  https://hwmon.wiki.kernel.org
 
 if BR2_PACKAGE_LM_SENSORS
 comment "lm-sensors tools"
-- 
2.11.0
