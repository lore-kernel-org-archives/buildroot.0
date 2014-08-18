From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:01:40 +0200
Subject: [Buildroot] [git commit] arch/m68k: always has atomic ops
Message-ID: <20140818090640.4FDB59D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d79bc13ec73c307711b875b0d49b9689f35089c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.m68k |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index ba6cedf..6b79307 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -4,6 +4,9 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "BIG"
 
+config BR2_ARCH_HAS_ATOMICS
+	default y
+
 config BR2_GCC_TARGET_TUNE
 	default "68000"		if BR2_m68k_68000
 	default "68010"		if BR2_m68k_68010
