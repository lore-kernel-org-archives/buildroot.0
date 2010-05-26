From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] qt: powerpc config is now called
	powerpc, not ppc
Message-ID: <20100526122002.AD82D1EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a7ebf231b4141d1746870f79e994099a999b5f14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 4bc4eaa..b09d642 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -243,7 +243,7 @@ config BR2_PACKAGE_QT_EMB_PLATFORM
 	default "x86_64"	if BR2_x86_64
 	default "mips"	if BR2_mips
 	default "mips"	if BR2_mipsel
-	default "ppc"	if BR2_powerpc
+	default "powerpc"	if BR2_powerpc
 # Not that I really believe these will work..
 	default "generic"	if BR2_alpha
 	default "generic"	if BR2_chris
-- 
1.6.3.3
