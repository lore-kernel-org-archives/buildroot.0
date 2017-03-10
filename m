From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Mar 2017 17:42:51 +0000
Subject: [Buildroot] [PATCH 1/2] lttng-babeltrace: bump version to 1.5.2
Message-ID: <20170310174252.20236-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lttng-babeltrace/lttng-babeltrace.hash | 6 +++---
 package/lttng-babeltrace/lttng-babeltrace.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.hash b/package/lttng-babeltrace/lttng-babeltrace.hash
index 8f29692..fafcd5e 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.hash
+++ b/package/lttng-babeltrace/lttng-babeltrace.hash
@@ -1,3 +1,3 @@
-# From http://www.efficios.com/files/babeltrace/babeltrace-1.5.1.tar.bz2.{md5,sha1}
-md5 3f7d29ba2821a966d24759a928a15cdf  babeltrace-1.5.1.tar.bz2
-sha1 07bffefed8ef68317f26e043ae5f71be58fdb783  babeltrace-1.5.1.tar.bz2
+# From http://www.efficios.com/files/babeltrace/babeltrace-1.5.2.tar.bz2.{md5,sha1}
+md5 1176e7f69e128112d5f29fefec39c6ce  babeltrace-1.5.2.tar.bz2
+sha1 3316e8311ebbc9e8642ed399208c1846a6f0e0c3  babeltrace-1.5.2.tar.bz2
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index abb3bba..6ac129a 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_BABELTRACE_SITE = http://www.efficios.com/files/babeltrace
-LTTNG_BABELTRACE_VERSION = 1.5.1
+LTTNG_BABELTRACE_VERSION = 1.5.2
 LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPLv2 (test code)
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
-- 
2.10.2
