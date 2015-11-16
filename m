From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 00:16:39 +0100
Subject: [Buildroot] [git commit] arch: add tune options for powerpc e5500
	and e6500
Message-ID: <20151116231849.C359181E76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3f7f949f0935535bff5d2fd51e3e14308b714bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These were forgotten when the subarches were added in cd88e49.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Alvaro Gamez <alvaro.gamez@hazent.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Alvaro G. M <alvaro.gamez@hazent.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.powerpc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
