From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 19:12:08 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: fix legal-info
Message-ID: <20150405171514.736FB7F8D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd6919e33d4b6b32c25f0a3cd366d1317846017a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sorry, I was not careful enough when reworking the radeon parts...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0919b16..9acfc53 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -16,7 +16,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RADEON),y)
 LINUX_FIRMWARE_DIRS += radeon
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.radeon
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
 endif
 
 # rt2501/rt61
