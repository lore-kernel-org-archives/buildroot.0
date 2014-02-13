From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2014 22:13:36 +0100
Subject: [Buildroot] [git commit] gdb: arc: bump to git commit cb15acc
Message-ID: <20140228133412.08CAC9BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89673ec0df06b32dda86895f16f18064bc367ce2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 9c77028..420408a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -53,5 +53,5 @@ config BR2_GDB_VERSION
                                    (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
 	default "7.5.1"    if BR2_GDB_VERSION_7_5 || !BR2_PACKAGE_HOST_GDB
-	default "f25a1952afd054205f9471e449c1f7ca5b271b7c" if BR2_arc
+	default "cb15acc5eecea46d041730e5c2c9fa1d4283ef25" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
