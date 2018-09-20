From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 21:40:03 +0200
Subject: [Buildroot] [git commit] boot/vexpress-firmware: add upstream URL
 in Config.in help text
Message-ID: <20180920193954.54822886B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49fff788d6ce84f01fc4c89019204d2436e7d5a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/vexpress-firmware/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/vexpress-firmware/Config.in b/boot/vexpress-firmware/Config.in
index 8479df3d57..265fb4be1d 100644
--- a/boot/vexpress-firmware/Config.in
+++ b/boot/vexpress-firmware/Config.in
@@ -4,3 +4,5 @@ config BR2_TARGET_VEXPRESS_FIRMWARE
 	help
 	  Versatile Express firmware from ARM, with Linaro mods last
 	  change.
+
+	  https://git.linaro.org/arm/vexpress-firmware.git
