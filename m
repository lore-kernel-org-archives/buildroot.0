From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 22:05:11 +0200
Subject: [Buildroot] [git commit] arch: remove BR2_arm920 reference
Message-ID: <20140918201342.4B1849D6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad0e217bb2c9a0ea132d841c57f310020f336bd5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_GCC_TARGET_CPU defines a value for the BR2_arm920 case, but
this option does not exist. Therefore, this commit removes one line of
dead code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arm |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index e404a50..5ae2378 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -344,7 +344,6 @@ config BR2_ARCH_HAS_ATOMICS
 	default y
 
 config BR2_GCC_TARGET_CPU
-	default "arm920"	if BR2_arm920
 	default "arm920t"	if BR2_arm920t
 	default "arm922t"	if BR2_arm922t
 	default "arm926ej-s"	if BR2_arm926t
