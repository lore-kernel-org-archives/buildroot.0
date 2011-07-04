From: Arnout Vandecappelle (Essensium - Mind) <arnout@mind.be>
Date: Mon,  4 Jul 2011 16:37:20 +0200
Subject: [Buildroot] [PATCH] BR2_ARCH definition was missing for 32-bit AMD
	architecture variants.
Message-ID: <1309790240-25341-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium - Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 target/Config.in.arch |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 7c80945..1964357 100644
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
1.7.5.4
