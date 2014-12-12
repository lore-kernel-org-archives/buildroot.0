From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 13 Dec 2014 00:16:11 +0100
Subject: [Buildroot] [PATCH 14/14]
	docs/manual/configure-other-components.txt: Add uboot documentation
In-Reply-To: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418426171-3483-15-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add documentation for U-Boots Kconfig configuration.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 docs/manual/configure-other-components.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/manual/configure-other-components.txt b/docs/manual/configure-other-components.txt
index 514c95f..1aad29c 100644
--- a/docs/manual/configure-other-components.txt
+++ b/docs/manual/configure-other-components.txt
@@ -50,3 +50,14 @@ kernel. The corresponding configuration variables are
 +BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG+ and
 +BR2_TARGET_BAREBOX_USE_DEFCONFIG+. To open the configuration editor,
 use +make barebox-menuconfig+.
+
+U-Boot::
++
+Configuration of U-Boot requires a target board defconfig file.
+This can either be a default <board>_defconfig file from the configs
+directory in the U-Boot source tree specified in
++BR2_TARGET_UBOOT_USE_DEFCONFIG+ or custom defconfig file specified
+in +BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG+.
++
+To make subsequent changes to the configuration, use +make
+uboot-menuconfig+ to open the U-Boot configuration editor.
-- 
2.1.3
