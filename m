From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Jul 2013 09:15:02 +0200
Subject: [Buildroot] [git commit] gcc: fix avr32 typo
Message-ID: <20130705071749.571709A32E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=820e8c3f81a0f932369b5815309ead3127e38fa7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 0e26a80..1b19128 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -6,7 +6,7 @@ config BR2_GCC_NEEDS_MPC
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
-	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr3
+	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
 	default BR2_GCC_VERSION_4_4_7_ARC if BR2_arc
 	default BR2_GCC_VERSION_4_7_X
 	help
