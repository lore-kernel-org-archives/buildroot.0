From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 12:22:43 +0100
Subject: [Buildroot] [git commit] arch/arm: add help text to
	BR2_ARM_ENABLE_VFP
Message-ID: <20151227112454.B57ED822CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb02e4c0b367c004565178f50e3ea74ee98e249f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 01555a6..ea84147 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -200,6 +200,10 @@ config BR2_ARM_ENABLE_VFP
 	select BR2_ARM_CPU_HAS_VFPV4 if BR2_ARM_CPU_MAYBE_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_VFPV3 if BR2_ARM_CPU_MAYBE_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_VFPV2 if BR2_ARM_CPU_MAYBE_HAS_VFPV2
+	help
+	  For some CPU cores, the VFP extension is optional. Select
+	  this option if you are certain your particular
+	  implementation has VFP support and you want to use it.
 
 choice
 	prompt "Target ABI"
