From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 17 Jul 2017 13:22:54 +0100
Subject: [Buildroot] [PATCH 1/2] arch/mips: improve help text of NaN option
Message-ID: <20170717122255.61795-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 7dd69659d..f2b352b0b 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -169,7 +169,9 @@ choice
 	depends on BR2_mips_32r5 || BR2_mips_64r5
 	default BR2_MIPS_ENABLE_NAN_2008
 	help
-	  NaN encoding to be used
+	  MIPS supports two different NaN encodings, legacy and 2008.
+	  Information about MIPS NaN encodings can be found here:
+	  https://sourceware.org/binutils/docs/as/MIPS-NaN-Encodings.html
 
 config BR2_MIPS_ENABLE_NAN_LEGACY
 	bool "legacy"
-- 
2.13.0
