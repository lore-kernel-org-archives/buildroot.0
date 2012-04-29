From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Apr 2012 10:57:30 +0200
Subject: [Buildroot] [git commit] gdb: bump 7.4.x series to 7.4.1
Message-ID: <20120429090502.5E6F496C08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d459e0d216546dc043a9b876938bacdcdc75fdcc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 980666b..c9c54b8 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -103,4 +103,4 @@ config BR2_GDB_VERSION
 	default "7.1a"     if BR2_GDB_VERSION_7_1
 	default "7.2a"     if BR2_GDB_VERSION_7_2
 	default "7.3.1"    if BR2_GDB_VERSION_7_3
-	default "7.4"      if BR2_GDB_VERSION_7_4
+	default "7.4.1"    if BR2_GDB_VERSION_7_4
