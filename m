From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Jul 2013 22:11:32 +0200
Subject: [Buildroot] [git commit] arch/arm: remove setting gcc's apcs-gnu
	ABI (aka OABI)
Message-ID: <20130714204246.829BC9A49D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de1b4f99aefcd5d82e470b737172eb63998aa16e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in.arm |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 4daa91f..027dac2 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -142,5 +142,4 @@ config BR2_GCC_TARGET_ARCH
 	default "iwmmxt"	if BR2_iwmmxt
 
 config BR2_GCC_TARGET_ABI
-	default "apcs-gnu"	if BR2_ARM_OABI
-	default "aapcs-linux"	if BR2_ARM_EABI
+	default "aapcs-linux"
