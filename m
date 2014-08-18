From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:03:28 +0200
Subject: [Buildroot] [git commit] arch/xtensa: always has atomic ops
Message-ID: <20140818090640.7E6B19D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a1f8b712d2770bc0582e809d5433c907bf27fc4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.xtensa |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index 60c03f5..ff71e0b 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -35,3 +35,6 @@ config BR2_XTENSA_OVERLAY_DIR
 
 config BR2_ARCH
 	default "xtensa"	if BR2_xtensa
+
+config BR2_ARCH_HAS_ATOMICS
+	default y
