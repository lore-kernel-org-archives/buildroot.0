From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 14:25:11 +0200
Subject: [Buildroot] [git commit branch/next] package/gdb: change default
	gdb from 7.5 to 7.6
Message-ID: <20140526123008.87D6C9C963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30bbfe9669d084b1d940454b28bd2042d44c5054
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 9f6b880..16a7291 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -20,7 +20,7 @@ choice
 	default BR2_GDB_VERSION_6_6 if BR2_bfin
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
 	default BR2_GDB_VERSION_7_7 if BR2_powerpc64le
-	default BR2_GDB_VERSION_7_5
+	default BR2_GDB_VERSION_7_6
 	help
 	  Select the version of gdb you wish to use.
 
