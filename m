From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jul 2013 00:27:27 +0200
Subject: [Buildroot] [PATCHv2 04/25] arch/arm: remove setting gcc's apcs-gnu
	ABI (aka OABI)
In-Reply-To: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373754468-7527-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

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
-- 
1.8.1.2
