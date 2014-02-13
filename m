From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2014 22:13:21 +0100
Subject: [Buildroot] [git commit] binutils: arc: Bump to git commit a934fe5
Message-ID: <20140228133411.D3B219BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a14988b7312a8c50da42c263dbf5f137ae004853
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 49b857e..58738e8 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -49,7 +49,7 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "0c824ba511fa9b028220eb3c39b566af89ac9dda" if BR2_arc
+	default "a934fe50786aa0dc0fb5da4754e7e07591c9cd8e" if BR2_arc
 	default "8351467c933d277ebea0c8d99ad2b65b5f7b6bc2" if BR2_microblaze
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
