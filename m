From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Mar 2014 17:24:23 +0100
Subject: [Buildroot] [git commit] device table dev: drop old CDROMs
Message-ID: <20140312162501.E31949BEEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43691a67c7e6c84518de6a5cf713115b6eba806f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop old custom CDROM devices from the device table, these are x86-only
and really really old so it would be amazing these would be in working
order.
And they haven't been supported in linux for while.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/device_table_dev.txt |   15 ---------------
 1 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/system/device_table_dev.txt b/system/device_table_dev.txt
index 91ed769..c4257a6 100644
--- a/system/device_table_dev.txt
+++ b/system/device_table_dev.txt
@@ -125,21 +125,6 @@
 #/dev/fd0u2880	b	640	0	0	2	32	0	0	-
 #/dev/fd1u2880	b	640	0	0	2	33	0	0	-
 
-# All the proprietary cdrom devices in the world
-#/dev/aztcd	b	640	0	0	29	0	0	0	-
-#/dev/bpcd	b	640	0	0	41	0	0	0	-
-#/dev/capi20	c	640	0	0	68	0	0	1	2
-#/dev/cdu31a	b	640	0	0	15	0	0	0	-
-#/dev/cdu535	b	640	0	0	24	0	0	0	-
-#/dev/cm206cd	b	640	0	0	32	0	0	0	-
-#/dev/sjcd	b	640	0	0	18	0	0	0	-
-#/dev/sonycd	b	640	0	0	15	0	0	0	-
-#/dev/gscd	b	640	0	0	16	0	0	0	-
-#/dev/sbpcd	b	640	0	0	25	0	0	0	-
-#/dev/sbpcd	b	640	0	0	25	0	0	1	4
-#/dev/mcd	b	640	0	0	23	0	0	0	-
-#/dev/optcd	b	640	0	0	17	0	0	0	-
-
 # I2C device nodes
 /dev/i2c-	c	666	0	0	89	0	0	1	4
 
