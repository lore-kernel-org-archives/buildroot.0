From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 22:23:43 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: fix typo in
	variable name
Message-ID: <20140421202703.A5AF99C96C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82d685d33931a89ad023a89dd248707ab4da2690
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove a trailing _ leftover from: c0d82bd3 (package/linux-firmware: install
license files with 'make legal-info')

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index df6c36b..135b29b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -10,7 +10,7 @@ LINUX_FIRMWARE_SITE_METHOD = git
 
 # rt2501/rt61
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
-LINUX_FIRMWARE_FILES_ += rt2561.bin rt2561s.bin rt2661.bin
+LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink-firmware.txt
 endif
 
