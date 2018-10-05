From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 13:41:08 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] boot/vexpress-firmware:
 add upstream URL in Config.in help text
Message-ID: <20181005114023.14E7E8D22C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc768cb6458d3425b5c77c39ddd18833c3023094
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 49fff788d6ce84f01fc4c89019204d2436e7d5a7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
