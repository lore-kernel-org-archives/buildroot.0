From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 23:21:01 +0200
Subject: [Buildroot] [git commit] toolchain-external: CodeSourcery ARM
	update upstream URL
Message-ID: <20170430212245.CDEEE81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcf1d93a89a21cab98e15775f0d705cc7805741b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current URL returns error 403: Forbidden, so switch to https.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../toolchain-external-codesourcery-arm.mk                              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk
index f96a0e0..f15a50c 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk
@@ -6,7 +6,7 @@
 
 TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_VERSION = 2014.05-29
 
-TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_SITE = http://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
 TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_SOURCE = arm-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
 TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_ACTUAL_SOURCE_TARBALL = arm-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
 
