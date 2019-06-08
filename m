From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Jun 2019 12:04:02 +0200
Subject: [Buildroot] [git commit] arch: Fix typo breaking use of core-avx2
 arch
Message-ID: <20190608100705.0E73E8ED93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=498a1fabe80aeb1652475b9061b82ba065915183
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.x86 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index ce91317dc6..3f6983ac1b 100644
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
