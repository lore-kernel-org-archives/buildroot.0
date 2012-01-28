From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2012 18:36:48 +0100
Subject: [Buildroot] [PATCH 08/16] external-toolchain: bump MIPS 2011.03
	from -93 to -110
In-Reply-To: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
References: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1a3098b78ff3a6c69b7cdd7d16759cf9fc714c04.1327772176.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/ext-tool.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index ab9b0c2..1e8e03e 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -193,8 +193,8 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/mips/portal/package7401/public/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-4.4-303-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/mips/portal/package9055/public/mips-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE=mips-2011.03-93-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/mips/portal/package9469/public/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE=mips-2011.03-110-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/power/portal/package7703/public/powerpc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.7.4.1
