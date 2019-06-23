From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 21:05:45 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] arch: Fix typo breaking
 use of core-avx2 arch
Message-ID: <20190623190545.5BE53880D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d6887c228703e945e7248bdfbb767ae832d4348
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 498a1fabe80aeb1652475b9061b82ba065915183)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.x86 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index f7c53a0fae..85cfb9f5eb 100644
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
