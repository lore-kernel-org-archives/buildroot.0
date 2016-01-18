From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Date: Mon, 18 Jan 2016 13:48:12 +0530
Subject: [Buildroot] [PATCH] NVME Makefile update
Message-ID: <20160118081653.30513.53744.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makefile cleanup: remove -Werror flag in CFLAGS

Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
---
 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d0c0ce4..003928b 100644
--- a/Makefile
+++ b/Makefile
@@ -1,4 +1,4 @@
-CFLAGS += -std=gnu99 -O2 -g -Wall -Werror
+CFLAGS += -std=gnu99 -O2 -g -Wall
 CPPFLAGS += -I $(SRC) -D_GNU_SOURCE
 NVME = nvme
 INSTALL ?= install
