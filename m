From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 21:47:04 +0200
Subject: [Buildroot] [git commit] arch/mips: improve help text of NaN option
Message-ID: <20170719194306.C1A2882161@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfc6f1e9b71ae0ade69daeecededc74bb3dde969
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.mips | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 7dd6965..f2b352b 100644
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
