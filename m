From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:03:09 +0200
Subject: [Buildroot] [git commit] arch/sparc: always has atomic ops
Message-ID: <20140818090640.7373F9D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da86e94f80ab227e5acc08a9bcfa97a94af16b6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.sparc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index 21e83f7..657c825 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -23,6 +23,9 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "BIG"
 
+config BR2_ARCH_HAS_ATOMICS
+	default y
+
 config BR2_GCC_TARGET_TUNE
 	default "v8"		if BR2_sparc_v8
 
