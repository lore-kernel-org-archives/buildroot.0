From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 19 Sep 2018 13:44:05 -0500
Subject: [Buildroot] [PATCH] boot/vexpress-firmware: updated url
Message-ID: <1537382645-36060-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matt@thewebers.ws>

---
 boot/vexpress-firmware/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/vexpress-firmware/Config.in b/boot/vexpress-firmware/Config.in
index 8479df3..265fb4b 100644
--- a/boot/vexpress-firmware/Config.in
+++ b/boot/vexpress-firmware/Config.in
@@ -4,3 +4,5 @@ config BR2_TARGET_VEXPRESS_FIRMWARE
 	help
 	  Versatile Express firmware from ARM, with Linaro mods last
 	  change.
+
+	  https://git.linaro.org/arm/vexpress-firmware.git
-- 
1.9.1
