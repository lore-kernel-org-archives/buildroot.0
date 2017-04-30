From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Apr 2017 21:51:39 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain-external: CodeSourcery NIOSII
	update upstream URL
Message-ID: <20170430195140.6401-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current URL returns error 403: Forbidden, so switch to https.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-codesourcery-niosII.mk                           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
index 7381061..dcca94f 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
@@ -6,7 +6,7 @@
 
 TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION = 2016.11-32
 
-TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SITE = http://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
 TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SOURCE = sourceryg++-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
 TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_ACTUAL_SOURCE_TARBALL = sourceryg++-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
 
-- 
2.9.3
