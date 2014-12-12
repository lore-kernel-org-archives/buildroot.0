From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 13 Dec 2014 00:16:10 +0100
Subject: [Buildroot] [PATCH 13/14] docs/manual/customize-quick-guide.txt:
	Add uboot documentation
In-Reply-To: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418426171-3483-14-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based on the Barebox documentation text.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 docs/manual/customize-quick-guide.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/manual/customize-quick-guide.txt b/docs/manual/customize-quick-guide.txt
index 617cc9a..75bab6f 100644
--- a/docs/manual/customize-quick-guide.txt
+++ b/docs/manual/customize-quick-guide.txt
@@ -20,6 +20,7 @@ your project can be skipped.
    * +BR2_UCLIBC_CONFIG+
    * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
    * +BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE+
+   * +BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE+
 1. Write the configuration files:
    * +make linux-update-defconfig+
    * +make busybox-update-config+
@@ -27,6 +28,7 @@ your project can be skipped.
    * +cp <output>/build/at91bootstrap3-*/.config
      board/<manufacturer>/<boardname>/at91bootstrap3.config+
    * +make barebox-update-defconfig+
+   * +make uboot-update-defconfig+
 1. Create +board/<manufacturer>/<boardname>/rootfs-overlay/+ and fill it
    with additional files you need on your rootfs, e.g.
    +board/<manufacturer>/<boardname>/rootfs-overlay/etc/inittab+.
-- 
2.1.3
