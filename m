From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 21:20:48 +0100
Subject: [Buildroot] [git commit] boot/boot-wrapper-aarch64: bump version
Message-ID: <20191212201447.C1F838A2C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3c7dd69e56c2eafc4ab9a0118c013f7e5f9621f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps the bootwrapper version to the latest.

Signed-off-by: Jan Kotas <jank@cadence.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index cd6e1b7b77..3383cb58ac 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOT_WRAPPER_AARCH64_VERSION = 4266507a84f8c06452109d38e0350d4759740694
+BOOT_WRAPPER_AARCH64_VERSION = fd74c8cbd0e17483d2299208cad9742bee605ca7
 BOOT_WRAPPER_AARCH64_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
 BOOT_WRAPPER_AARCH64_LICENSE = BSD-3-Clause
 BOOT_WRAPPER_AARCH64_LICENSE_FILES = LICENSE.txt
