From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:02:51 +0200
Subject: [Buildroot] [git commit] arch/nios2: always has atomic ops
Message-ID: <20140818090640.626059D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=700080c494c56c2c5e00432bafaa52098988cbfb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.nios2 |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.nios2 b/arch/Config.in.nios2
index ed63898..7807769 100644
--- a/arch/Config.in.nios2
+++ b/arch/Config.in.nios2
@@ -3,3 +3,6 @@ config BR2_ARCH
 
 config BR2_ENDIAN
 	default "LITTLE"
+
+config BR2_ARCH_HAS_ATOMICS
+	default y
