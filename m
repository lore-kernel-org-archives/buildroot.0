From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Tue, 22 Oct 2019 10:48:04 -0400
Subject: [Buildroot] [PATCH 2/3] package/lttng-tools: bump version to 2.11.0
In-Reply-To: <20191022144805.591535-1-eeppeliteloop@gmail.com>
References: <20191022144805.591535-1-eeppeliteloop@gmail.com>
Message-ID: <20191022144805.591535-2-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/lttng-tools/lttng-tools.hash | 4 ++--
 package/lttng-tools/lttng-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index bc6695c88e..f5f9fdbbdc 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-tools/lttng-tools-2.10.8.tar.bz2.sha256
-sha256 664a1145f9fd7a574da18aa3dfbbe97983985a471ca2992d6b272f1cebe6b30d  lttng-tools-2.10.8.tar.bz2
+# From https://lttng.org/files/lttng-tools/lttng-tools-2.11.0.tar.bz2.sha256
+sha256 dce493c82db673c96049b5fad155a760fa449fab3d92467a69fcb0ddaf3f0fbc  lttng-tools-2.11.0.tar.bz2
 # Locally computed
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
 sha256 051be1f11b508ef7bb839994f6b58be19a827c56bd9bddfe36d77d3d4be55abe  lgpl-2.1.txt
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 9bffcf6888..f85f6bcbce 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.10.8
+LTTNG_TOOLS_VERSION = 2.11.0
 LTTNG_TOOLS_SITE = https://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES
-- 
2.23.0
