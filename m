From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 15 Mar 2017 15:40:57 +0000
Subject: [Buildroot] [PATCH] lttng-tools: bump version to 2.9.4
Message-ID: <20170315154057.38628-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lttng-tools/lttng-tools.hash | 6 +++---
 package/lttng-tools/lttng-tools.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index 4f3d283..114bd0c 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,3 +1,3 @@
-# From http://lttng.org/files/lttng-tools/lttng-tools-2.9.3.tar.bz2.{md5,sha1}
-md5 19fdcc5e9c307ef66581a2743a08a541  lttng-tools-2.9.3.tar.bz2
-sha1 78fdc9b7fd15f33ac60ea08320d679ce66e18bf7  lttng-tools-2.9.3.tar.bz2
+# From http://lttng.org/files/lttng-tools/lttng-tools-2.9.4.tar.bz2.{md5,sha1}
+md5 10f47abfa214b167580358388428770d  lttng-tools-2.9.4.tar.bz2
+sha1 ab1945fd36b30f445eb5c83f199b011d42525612  lttng-tools-2.9.4.tar.bz2
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 2df2dff..5af0ab3 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.9.3
+LTTNG_TOOLS_VERSION = 2.9.4
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+, LGPLv2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
-- 
2.10.2
