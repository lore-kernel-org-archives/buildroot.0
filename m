From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Nov 2013 09:56:49 -0300
Subject: [Buildroot] [PATCH] arch/sparc: drop unused variants
Message-ID: <1385643409-5995-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop stale v9/ultrasparc/niagara variants.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in.sparc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index 33204a2..21e83f7 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -25,12 +25,6 @@ config BR2_ENDIAN
 
 config BR2_GCC_TARGET_TUNE
 	default "v8"		if BR2_sparc_v8
-	default "v9"		if BR2_sparc_v9
-	default "v9"		if BR2_sparc_v9a
-	default "v9"		if BR2_sparc_v9b
-	default "ultrasparc"	if BR2_sparc_ultrasparc
-	default "ultrasparc3"	if BR2_sparc_ultrasparc3
-	default "niagara"	if BR2_sparc_niagara
 
 config BR2_GCC_TARGET_CPU
 	default "sparchfleon"	if BR2_sparc_sparchfleon
-- 
1.8.3.2
