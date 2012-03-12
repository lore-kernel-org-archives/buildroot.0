From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 12 Mar 2012 19:04:24 +0100
Subject: [Buildroot] [PATCH] Microblaze: Escaped semicolons in
	TOOLCHAIN_EXTERNAL_SITE
Message-ID: <1331575464-21884-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 toolchain/toolchain-external/ext-tool.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 8904542..466f2f7 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -236,10 +236,10 @@ TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease
 TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2011R1-RC4.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2),y)
-TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git;a=blob;hb=HEAD;f=
+TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git\;a=blob\;h=d7b493c5dbcc24ba9cc3be2e4c14d6d9701e6805;hb=00163583b771bb4e937632765dd0c5516b3e31c4\;f=
 TOOLCHAIN_EXTERNAL_SOURCE=microblazeel-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
-TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=blob;hb=HEAD;f=
+TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0.git\;a=blob\;h=71e031ae990e063a5718f90d30cf97ad85e2f565;hb=569081301f0f1d8d3b24335a364e8ff1774190d4\;f=
 TOOLCHAIN_EXTERNAL_SOURCE=microblaze-unknown-linux-gnu.tgz
 else
 # A value must be set (even if unused), otherwise the
-- 
1.7.0.4
