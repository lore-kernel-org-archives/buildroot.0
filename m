From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 23:58:22 +0200
Subject: [Buildroot] [git commit] ext-toolchain: fix download url
Message-ID: <20110912220529.6A30D8D597@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d1a9698bec65de83d45b77977e14de45c4946516
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The website for downloading the toolchain has changed from
http://www.codesourcery.com to http://sourcery.mentor.com

Signed-off-by: Subramaniam C.A <subramaniam.ca@ti.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/ext-tool.mk |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index fd9a530..b9d932f 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -161,34 +161,34 @@ TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(STAMP_DIR)/ext-toolchain-checked
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1),y)
-TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/arm/portal/package4571/public/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package4571/public/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3),y)
-TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/arm/portal/package5383/public/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package5383/public/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2009q3-67-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1),y)
-TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/arm/portal/package6488/public/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package6488/public/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009),y)
-TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/arm/portal/package7851/public/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package7851/public/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2010.09-50-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103),y)
-TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/arm/portal/package8739/public/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package8739/public/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.03-41-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44),y)
-TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/mips/portal/package7401/public/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/mips/portal/package7401/public/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-4.4-303-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103),y)
-TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/mips/portal/package8715/public/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/mips/portal/package8715/public/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-2011.03-53-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
-TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/power/portal/package7703/public/powerpc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/power/portal/package7703/public/powerpc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009),y)
-TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/superh/portal/package7783/public/sh-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/superh/portal/package7783/public/sh-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-45-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009),y)
-TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/superh/portal/package7859/public/sh-uclinux/
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/superh/portal/package7859/public/sh-uclinux/
 TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1),y)
 TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/501/8378/
-- 
1.7.3.4
