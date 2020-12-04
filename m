From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Fri,  4 Dec 2020 14:30:19 +0100
Subject: [Buildroot] [PATCH] boot/boot-wrapper-aarch64: bump version
Message-ID: <20201204133019.2258-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump bootwrapper to the latest version.

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---


Hi,

I have tested this with the arm_foundationv8_defconfig and the Foundation-v8
11.12 build 38.

Best regards,
Vincent.


 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index 117e113984..3a1af9b02c 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOT_WRAPPER_AARCH64_VERSION = fd74c8cbd0e17483d2299208cad9742bee605ca7
+BOOT_WRAPPER_AARCH64_VERSION = 8d5a765251d9113c3c0f9fa14de42a9e7486fe8a
 BOOT_WRAPPER_AARCH64_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
 BOOT_WRAPPER_AARCH64_LICENSE = BSD-3-Clause
 BOOT_WRAPPER_AARCH64_LICENSE_FILES = LICENSE.txt
-- 
2.29.2
