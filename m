From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Apr 2014 23:47:16 +0200
Subject: [Buildroot] [git commit] binutils: arc: bump to arc-4.8-R3 release
Message-ID: <20140429223019.C99689CA6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11f4a14b1acb9a65fbb3b9ba771b972174505fb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 5515570..15def13 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -49,7 +49,7 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "a934fe50786aa0dc0fb5da4754e7e07591c9cd8e" if BR2_arc
+	default "arc-4.8-R3"	if BR2_arc
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
