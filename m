From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:04:33 +0100
Subject: [Buildroot] [git commit] lttng-babeltrace: bump version to 1.5.0
Message-ID: <20161202080021.6016281E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b0dac7ef5d8106ec77d128c53f480fd8721c05c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop sha256 hash. The combination of md5 and sha1 hashes is enough.

Release notes:
  https://lists.lttng.org/pipermail/lttng-dev/2016-November/026762.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
