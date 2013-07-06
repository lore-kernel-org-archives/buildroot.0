From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jul 2013 22:48:42 +0200
Subject: [Buildroot] [PATCH 03/12] arch/arm: remove setting gcc's apcs-gnu
	ABI (aka OABI)
In-Reply-To: <cover.1373143368.git.yann.morin.1998@free.fr>
References: <cover.1373143368.git.yann.morin.1998@free.fr>
Message-ID: <ece2c842d5a26541c2183f871854d169ebc35433.1373143368.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 45d2b4b..1fc0bd7 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -130,5 +130,4 @@ config BR2_GCC_TARGET_ARCH
 	default "iwmmxt"	if BR2_iwmmxt
 
 config BR2_GCC_TARGET_ABI
-	default "apcs-gnu"	if BR2_ARM_OABI
 	default "aapcs-linux"	if BR2_ARM_EABI
-- 
1.8.1.2
