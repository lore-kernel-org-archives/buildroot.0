From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 21:47:11 +0200
Subject: [Buildroot] [git commit] arch/mips: improve help text of FP32 mode
	option
Message-ID: <20170719194307.190897FAE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2985125a4cd1b6a4377859bdc372f17387ae8e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.mips | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index f2b352b..de71110 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -139,7 +139,10 @@ choice
 	depends on !BR2_ARCH_IS_64 && !BR2_MIPS_SOFT_FLOAT
 	default BR2_MIPS_FP32_MODE_XX
 	help
-	  FP mode to be used
+	  MIPS32 supports different FP modes (32,xx,64). Information about FP
+	  modes can be found here:
+	  https://sourceware.org/binutils/docs/as/MIPS-Options.html
+	  https://dmz-portal.imgtec.com/wiki/MIPS_O32_ABI_-_FR0_and_FR1_Interlinking#5._Generating_modeless_code
 
 config BR2_MIPS_FP32_MODE_32
 	bool "32"
