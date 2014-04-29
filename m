From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Apr 2014 23:46:55 +0200
Subject: [Buildroot] [git commit] gdb: arc: bump to arc-4.8-R3 release
Message-ID: <20140429223019.C26049CA6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab798588410525659d07846f2a87f58215a60dcd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index cbcec18..e853469 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -51,7 +51,7 @@ config BR2_GDB_VERSION
 	                      (!BR2_PACKAGE_HOST_GDB && BR2_bfin)
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 || \
                                    (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
-	default "cb15acc5eecea46d041730e5c2c9fa1d4283ef25" if BR2_arc
+	default "arc-4.8-R3" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
 	default "7.5.1"    if BR2_GDB_VERSION_7_5 || !BR2_PACKAGE_HOST_GDB
