From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Aug 2018 16:24:34 +0200
Subject: [Buildroot] [git commit] boot-wrapper-aarch64: use SPDX identifier
 for 3 clause BSD
Message-ID: <20180808142437.DDB418B518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2d748e13be6ca119271af8487adda5856d43da4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the correct SPDX identifier for the 3 clause BSD license, like we do
elsewhere.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index 601cfab314..cd6e1b7b77 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -6,7 +6,7 @@
 
 BOOT_WRAPPER_AARCH64_VERSION = 4266507a84f8c06452109d38e0350d4759740694
 BOOT_WRAPPER_AARCH64_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
-BOOT_WRAPPER_AARCH64_LICENSE = BSD3c
+BOOT_WRAPPER_AARCH64_LICENSE = BSD-3-Clause
 BOOT_WRAPPER_AARCH64_LICENSE_FILES = LICENSE.txt
 BOOT_WRAPPER_AARCH64_DEPENDENCIES = linux
 BOOT_WRAPPER_AARCH64_INSTALL_IMAGES = YES
