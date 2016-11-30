From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Nov 2016 17:04:44 +0000
Subject: [Buildroot] [PATCH next 3/4] lttng-babeltrace: bump version to 1.5.0
In-Reply-To: <20161130170445.55222-1-Vincent.Riera@imgtec.com>
References: <20161130170445.55222-1-Vincent.Riera@imgtec.com>
Message-ID: <20161130170445.55222-3-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop sha256 hash. The combination of md5 and sha1 hashes is enough.

Release notes:
  https://lists.lttng.org/pipermail/lttng-dev/2016-November/026762.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lttng-babeltrace/lttng-babeltrace.hash | 9 +++------
 package/lttng-babeltrace/lttng-babeltrace.mk   | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.hash b/package/lttng-babeltrace/lttng-babeltrace.hash
index bca0bdb..7f91b8b 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.hash
+++ b/package/lttng-babeltrace/lttng-babeltrace.hash
@@ -1,6 +1,3 @@
-# From http://www.efficios.com/files/babeltrace/babeltrace-1.4.0.tar.bz2.{md5,sha1}
-md5     fa99064048af5c9c6ff00e489ac809c2  babeltrace-1.4.0.tar.bz2
-sha1    3b162480ee883625e8581bf163817f78a4b6487b  babeltrace-1.4.0.tar.bz2
-
-# Locally generated
-sha256  9469eeb22617cd12668683b04c27003e5337e9ac66ade914988df3642fc0d0e4  babeltrace-1.4.0.tar.bz2
+# From http://www.efficios.com/files/babeltrace/babeltrace-1.5.0.tar.bz2.{md5,sha1}
+md5 43696383e44d1b85173db7cbd0335f06  babeltrace-1.5.0.tar.bz2
+sha1 13f106951c418632a2155ebe3cea51fa4929e748  babeltrace-1.5.0.tar.bz2
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 59327db..7d4b520 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_BABELTRACE_SITE = http://www.efficios.com/files/babeltrace
-LTTNG_BABELTRACE_VERSION = 1.4.0
+LTTNG_BABELTRACE_VERSION = 1.5.0
 LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPLv2 (test code)
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
-- 
2.10.1
