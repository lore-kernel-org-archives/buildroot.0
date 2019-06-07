From: Esben Haabendal <esben@geanix.com>
Date: Fri,  7 Jun 2019 14:53:12 +0200
Subject: [Buildroot] [PATCH 1/2] arch: Fix typo breaking use of core-avx2
 arch
Message-ID: <20190607125313.20376-1-esben@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 arch/Config.in.x86 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index ce91317dc6ae..3f6983ac1b63 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -236,7 +236,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_core2 && BR2_i386
 	default "i686"		if BR2_x86_corei7 && BR2_i386
 	default "i686"		if BR2_x86_corei7_avx && BR2_i386
-	default "i686"		if BR2_x86_corei7_avx2 && BR2_i386
+	default "i686"		if BR2_x86_core_avx2 && BR2_i386
 	default "i686"		if BR2_x86_atom && BR2_i386
 	default "i686"		if BR2_x86_silvermont && BR2_i386
 	default "i686"		if BR2_x86_opteron && BR2_i386
-- 
2.21.0
