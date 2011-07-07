From: Arnout Vandecappelle (Essensium - Mind) <arnout@mind.be>
Date: Thu, 7 Jul 2011 22:15:25 +0200
Subject: [Buildroot] [git commit] BR2_ARCH definition was missing for 32-bit
	AMD architecture variants.
Message-ID: <20110707201646.BD1C1890C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f4889573af6f43cc87c963fa4eae7f1ce29a46c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in.arch |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 23946e8..91956ec 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -478,6 +478,13 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_pentiumpro
 	default "i686"		if BR2_x86_nocona
 	default "i686"		if BR2_x86_core2
+	default "i686"		if BR2_x86_opteron
+	default "i686"		if BR2_x86_opteron_sse3
+	default "i686"		if BR2_x86_barcelona
+	default "i686"		if BR2_x86_k6
+	default "i686"		if BR2_x86_k6_2
+	default "i686"		if BR2_x86_athlon
+	default "i686"		if BR2_x86_athlon_4
 	default "m68k"		if BR2_m68k
 	default "mips"		if BR2_mips
 	default "mipsel"	if BR2_mipsel
-- 
1.7.3.4
