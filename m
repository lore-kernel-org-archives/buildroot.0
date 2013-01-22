From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Jan 2013 19:02:23 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: update to newer version
Message-ID: <1358877743-16068-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index db20d33..1eb08f6 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -3,7 +3,7 @@
 # linux-firmware
 #
 #############################################################
-LINUX_FIRMWARE_VERSION = a707c25a6e992b8ee6127a6ebab63dd063043047
+LINUX_FIRMWARE_VERSION = 65a5163b8bb77bd7759efa3ca780867fcaed89b0
 LINUX_FIRMWARE_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
-- 
1.7.2.5
