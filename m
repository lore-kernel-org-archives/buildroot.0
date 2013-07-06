From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jul 2013 22:48:45 +0200
Subject: [Buildroot] [PATCH 06/12] arch/arm: drop 'if EABI' since it's
	always true now
In-Reply-To: <cover.1373143368.git.yann.morin.1998@free.fr>
References: <cover.1373143368.git.yann.morin.1998@free.fr>
Message-ID: <91f558c7563a286c58210ae8490a057368e84b5c.1373143368.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 1fc0bd7..8399a8c 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -130,4 +130,4 @@ config BR2_GCC_TARGET_ARCH
 	default "iwmmxt"	if BR2_iwmmxt
 
 config BR2_GCC_TARGET_ABI
-	default "aapcs-linux"	if BR2_ARM_EABI
+	default "aapcs-linux"
-- 
1.8.1.2
