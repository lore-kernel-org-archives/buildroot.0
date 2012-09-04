From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Sep 2012 16:04:08 +0200
Subject: [Buildroot] [PATCH 3/4] Remove target/Makefile.in, now useless
In-Reply-To: <cover.1346767209.git.thomas.petazzoni@free-electrons.com>
References: <cover.1346767209.git.thomas.petazzoni@free-electrons.com>
Message-ID: <77bb15266ba4c2bad35d207606a0214fef441263.1346767209.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile           |    1 -
 target/Makefile.in |    3 ---
 2 files changed, 4 deletions(-)
 delete mode 100644 target/Makefile.in

diff --git a/Makefile b/Makefile
index 791fd72..aff44a8 100644
--- a/Makefile
+++ b/Makefile
@@ -314,7 +314,6 @@ endif
 include package/*/*.mk
 
 include boot/common.mk
-include target/Makefile.in
 include linux/linux.mk
 
 TARGETS+=target-finalize
diff --git a/target/Makefile.in b/target/Makefile.in
deleted file mode 100644
index 915d625..0000000
--- a/target/Makefile.in
+++ /dev/null
@@ -1,3 +0,0 @@
-# make sure to put everything that is board-specific before the tarroot targets
-include target/generic/Makefile.in
-
-- 
1.7.9.5
