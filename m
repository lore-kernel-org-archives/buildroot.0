From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 13:22:17 +0200
Subject: [Buildroot] [git commit] MIPS: state that the current architecture
	variants are generic
Message-ID: <20161015112247.6759081EB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e14ce3cf295355a0af8b5b247291256a94f10c4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.mips | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 8771cd5..56b8a6b 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -24,27 +24,27 @@ choice
 	  non-64bit capable: 32, 32r2, 32r6
 
 config BR2_mips_32
-	bool "mips 32"
+	bool "Generic MIPS32"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32
 config BR2_mips_32r2
-	bool "mips 32r2"
+	bool "Generic MIPS32R2"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R2
 config BR2_mips_32r6
-	bool "mips 32r6"
+	bool "Generic MIPS32R6"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R6
 config BR2_mips_64
-	bool "mips 64"
+	bool "Generic MIPS64"
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64
 config BR2_mips_64r2
-	bool "mips 64r2"
+	bool "Generic MIPS64R2"
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64R2
 config BR2_mips_64r6
-	bool "mips 64r6"
+	bool "Generic MIPS64R6"
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64R6
 endchoice
