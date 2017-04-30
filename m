From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Apr 2017 22:20:48 +0200
Subject: [Buildroot] [PATCH 3/3] toolchain-external: CodeSourcery MIPS
	update upstream URL
In-Reply-To: <20170430202048.11320-1-romain.naour@gmail.com>
References: <20170430202048.11320-1-romain.naour@gmail.com>
Message-ID: <20170430202048.11320-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current URL returns error 403: Forbidden, so switch to https.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-codesourcery-mips.mk                             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk
index 5117d47..94fbbff 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk
@@ -6,7 +6,7 @@
 
 TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_VERSION = 2016.05-8
 
-TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_SITE = http://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
 TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_SOURCE = mips-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
 TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_ACTUAL_SOURCE_TARBALL = mips-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
 
-- 
2.9.3
