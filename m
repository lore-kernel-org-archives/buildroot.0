From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Apr 2017 22:20:46 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain-external: CodeSourcery aarch64
	update upstream URL
Message-ID: <20170430202048.11320-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current URL returns error 403: Forbidden, so switch to https.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-codesourcery-aarch64.mk                          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
index 5f4453a..192763a 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_SITE = http://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
 TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION = 2014.11-95
 TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_SOURCE = aarch64-amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
 TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_ACTUAL_SOURCE_TARBALL = aarch64-amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
-- 
2.9.3
