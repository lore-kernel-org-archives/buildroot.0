From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Feb 2017 09:16:39 +0100
Subject: [Buildroot] [git commit] lm-sensors: update homepage link
Message-ID: <20170208081840.E68158211F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1071d7169e00b805dbcdaec33082ad2365dfd23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The lm-sensors.org website is down, and won't be coming back anytime soon. Use
the suggested[1], far from adequate, alternative.

[1] https://github.com/groeck/lm-sensors/issues/3

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lm-sensors/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lm-sensors/Config.in b/package/lm-sensors/Config.in
index 7065c4c..b035f5d 100644
--- a/package/lm-sensors/Config.in
+++ b/package/lm-sensors/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LM_SENSORS
 	  temperature, voltage, and fan speed sensors. It
 	  works with most newer systems.
 
-	  http://www.lm-sensors.org/
+	  https://hwmon.wiki.kernel.org
 
 if BR2_PACKAGE_LM_SENSORS
 comment "lm-sensors tools"
