From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 11:44:40 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: fix typo in
	firmware file for cxgb4
Message-ID: <20140311104935.390D69B1CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cea2cf8fc130d4744a90ea6b76130caa40d2188c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Trivial inversion b/g: cxbg4 -> cxgb4

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Jeremy Kerr <jk@ozlabs.org>
Acked-by: Jeremy Kerr <jk at ozlabs.org.
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c4e7857..45c82c6 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -157,7 +157,7 @@ endif
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4),y)
 LINUX_FIRMWARE_FILES += \
 	cxgb4/t4fw-1.9.23.0.bin \
-	cxbg4/t4fw.bin
+	cxgb4/t4fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
