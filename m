From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:01:22 +0200
Subject: [Buildroot] [git commit] arch/avr32: always has atomic ops
Message-ID: <20140818090640.442CF9D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=116f63f4d77fb592fcf575c99b29170327902527
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.avr32 |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.avr32 b/arch/Config.in.avr32
index 8429589..fc1f4f6 100644
--- a/arch/Config.in.avr32
+++ b/arch/Config.in.avr32
@@ -6,3 +6,6 @@ config BR2_ENDIAN
 
 config BR2_GCC_TARGET_ARCH
 	default "ap"
+
+config BR2_ARCH_HAS_ATOMICS
+	default y
