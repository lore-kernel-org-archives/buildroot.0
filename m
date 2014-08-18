From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:01:31 +0200
Subject: [Buildroot] [git commit] arch/bfin: always has atomic ops
Message-ID: <20140818090640.49C939D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b98309f5941f90fbad4647ec8bb081d3a455b65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.bfin |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 415fc89..0783969 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -68,6 +68,9 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "LITTLE"
 
+config BR2_ARCH_HAS_ATOMICS
+	default y
+
 config BR2_GCC_TARGET_CPU
 	default bf606		if BR2_bf606
 	default bf607		if BR2_bf607
