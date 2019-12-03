From: Jan Kotas <jank@cadence.com>
Date: Tue, 3 Dec 2019 04:18:13 -0500
Subject: [Buildroot] [PATCH v2 1/3] boot/boot-wrapper-aarch64: bump version
In-Reply-To: <20191203091815.22668-1-jank@cadence.com>
References: <20191203091815.22668-1-jank@cadence.com>
Message-ID: <20191203091815.22668-2-jank@cadence.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps the bootwrapper version to the latest.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index cd6e1b7b7..3383cb58a 100644
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
-- 
2.18.0
