From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 23:07:08 +0100
Subject: [Buildroot] [git commit] arch/Config.in.arm: add BR2_ARM_CPU_ARMV8
Message-ID: <20161205221749.7E6167FEC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c37189b35ed09fc1f51debd2e51aac2520a4a213
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to prepare the addition of ARM64 cores, add the blind
BR2_ARM_CPU_ARMV8 option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 0ca6a14..9e5accc 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -55,6 +55,9 @@ config BR2_ARM_CPU_ARMV7A
 config BR2_ARM_CPU_ARMV7M
 	bool
 
+config BR2_ARM_CPU_ARMV8
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	default BR2_arm926t
