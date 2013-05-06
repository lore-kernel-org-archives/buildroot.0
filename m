From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon,  6 May 2013 16:10:54 +0200
Subject: [Buildroot] [PATCH v4 2/5] barebox: bump version to 2013.05.0
In-Reply-To: <1367849457-31738-1-git-send-email-fabio.porcedda@gmail.com>
References: <1367849457-31738-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1367849457-31738-3-git-send-email-fabio.porcedda@gmail.com>
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
index 47926cb..21da3f9 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2013.04.0"
+	bool "2013.05.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2013.04.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2013.05.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default $BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
-- 
1.8.1.4
