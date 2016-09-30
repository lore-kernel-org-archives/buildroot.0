From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 30 Sep 2016 10:36:50 +0100
Subject: [Buildroot] [PATCH 04/13] MIPS: state that the current architecture
	variants are generic
In-Reply-To: <20160930093659.35032-1-Vincent.Riera@imgtec.com>
References: <20160930093659.35032-1-Vincent.Riera@imgtec.com>
Message-ID: <20160930093659.35032-5-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
2.10.0
