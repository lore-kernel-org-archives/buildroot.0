From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 13 Dec 2012 08:44:35 +0100
Subject: [Buildroot] [PATCH] barebox: bump to version 2012.12.1
Message-ID: <1355384675-8965-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 boot/barebox/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index e7498a8..10eb650 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -22,7 +22,7 @@ config BR2_TARGET_BAREBOX_2012_11
 	bool "2012.11"
 
 config BR2_TARGET_BAREBOX_2012_12
-	bool "2012.12"
+	bool "2012.12.1"
 
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
@@ -44,7 +44,7 @@ config BR2_TARGET_BAREBOX_VERSION
 	default "2012.09.0"	if BR2_TARGET_BAREBOX_2012_09
 	default "2012.10.0"	if BR2_TARGET_BAREBOX_2012_10
 	default "2012.11.0"	if BR2_TARGET_BAREBOX_2012_11
-	default "2012.12.0"	if BR2_TARGET_BAREBOX_2012_12
+	default "2012.12.1"	if BR2_TARGET_BAREBOX_2012_12
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
-- 
1.8.0
