From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Date: Wed, 20 Jan 2016 09:19:41 +0530
Subject: [Buildroot] [PATCH V2] NVME Makefile update
Message-ID: <20160120034712.7432.71222.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makefile cleanup: remove -Werror flag in CFLAGS

Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
---
 package/nvme/0001-NVME-Makefile-cleanup.patch |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/nvme/0001-NVME-Makefile-cleanup.patch

diff --git a/package/nvme/0001-NVME-Makefile-cleanup.patch b/package/nvme/0001-NVME-Makefile-cleanup.patch
new file mode 100644
index 0000000..74beac9
--- /dev/null
+++ b/package/nvme/0001-NVME-Makefile-cleanup.patch
@@ -0,0 +1,25 @@
+From 985a18605f8decd766370a7d9873c77c16b9253c Mon Sep 17 00:00:00 2001
+From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
+Date: Mon, 18 Jan 2016 12:40:00 +0530
+Subject: [PATCH V2] NVME Makefile update
+
+Makefile cleanup: remove -Werror flag in CFLAGS
+
+Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index d0c0ce4..003928b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,4 +1,4 @@
+-CFLAGS += -std=gnu99 -O2 -g -Wall -Werror
++CFLAGS += -std=gnu99 -O2 -g -Wall
+ CPPFLAGS += -I $(SRC) -D_GNU_SOURCE
+ NVME = nvme
+ INSTALL ?= install
+--
+1.9.3
+
