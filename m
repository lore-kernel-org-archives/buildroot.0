From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:49:27 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: use the new bnx2x
	firmware version
Message-ID: <20140921175639.9A33A9D4C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bc711ba0e6af2410facffa676189a5c6daf6542
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 3da757f..32ed3b2 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -154,9 +154,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += \
-	bnx2x/bnx2x-e1-7.8.17.0.fw \
-	bnx2x/bnx2x-e1h-7.8.17.0.fw \
-	bnx2x/bnx2x-e2-7.8.17.0.fw
+	bnx2x/bnx2x-e1-7.10.51.0.fw \
+	bnx2x/bnx2x-e1h-7.10.51.0.fw \
+	bnx2x/bnx2x-e2-7.10.51.0.fw
 # No license file; the license is in the file WHENCE
 # which is installed unconditionally
 endif
