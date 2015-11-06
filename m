From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 6 Nov 2015 15:05:45 +0100
Subject: [Buildroot] [PATCH 2/2] arch: add tune options for powerpc e5500
	and e6500
In-Reply-To: <1446818745-32224-1-git-send-email-arnout@mind.be>
References: <1446818745-32224-1-git-send-email-arnout@mind.be>
Message-ID: <1446818745-32224-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These were forgotten when the subarches were added in cd88e49.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Alvaro Gamez <alvaro.gamez@hazent.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in.powerpc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 95bcaee..8581a4d 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -200,6 +200,8 @@ config BR2_GCC_TARGET_CPU
 	default "e300c2"	if BR2_powerpc_e300c2
 	default "e300c3"	if BR2_powerpc_e300c3
 	default "e500mc"	if BR2_powerpc_e500mc
+	default "e5500"		if BR2_powerpc_e5500
+	default "e6500"		if BR2_powerpc_e6500
 	default "power4"	if BR2_powerpc_power4
 	default "power5"	if BR2_powerpc_power5
 	default "power6"	if BR2_powerpc_power6
-- 
2.6.2
