From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 May 2017 09:21:18 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] toolchain-external:
	CodeSourcery MIPS update upstream URL
Message-ID: <20170501072637.3F046821A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=296ffa677072dd2e0cdf1c2afa8134ed0bafe0cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The current URL returns error 403: Forbidden, so switch to https.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 25902b111a93e562e3c1991f65c03649c88802c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
