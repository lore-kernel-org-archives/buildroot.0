From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Tue, 20 Nov 2012 12:14:46 +0100
Subject: [Buildroot] [PATCH] barebox: Add BR2_TARGET_BAREBOX_2012_11
Message-ID: <1353410086-10233-1-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 boot/barebox/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index c9e7088..997f45b 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -45,6 +45,7 @@ config BR2_TARGET_BAREBOX_VERSION
 	default "2012.08.0"	if BR2_TARGET_BAREBOX_2012_08
 	default "2012.09.0"	if BR2_TARGET_BAREBOX_2012_09
 	default "2012.10.0"	if BR2_TARGET_BAREBOX_2012_10
+	default "2012.11.0"	if BR2_TARGET_BAREBOX_2012_11
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
-- 
1.7.9.5
