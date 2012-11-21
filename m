From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 21 Nov 2012 11:08:12 +0100
Subject: [Buildroot] [PATCH] Remove unused barebox 2012.07 string
Message-ID: <1353492492-29514-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 boot/barebox/Config.in |    1 -
 1 file changed, 1 deletion(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index c9e7088..0273dd0 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -41,7 +41,6 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2012.07.0"	if BR2_TARGET_BAREBOX_2012_07
 	default "2012.08.0"	if BR2_TARGET_BAREBOX_2012_08
 	default "2012.09.0"	if BR2_TARGET_BAREBOX_2012_09
 	default "2012.10.0"	if BR2_TARGET_BAREBOX_2012_10
-- 
1.7.9.5
