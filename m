From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 16:49:50 +0100
Subject: [Buildroot] [git commit] lttng-babeltrace: bump version to 1.5.1
Message-ID: <20170109155019.1D8F281D71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5c2d063278d876b0b5555f06e1e2e8e1b57bbcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-babeltrace/lttng-babeltrace.hash | 6 +++---
 package/lttng-babeltrace/lttng-babeltrace.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.hash b/package/lttng-babeltrace/lttng-babeltrace.hash
index 7f91b8b..8f29692 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.hash
+++ b/package/lttng-babeltrace/lttng-babeltrace.hash
@@ -1,3 +1,3 @@
-# From http://www.efficios.com/files/babeltrace/babeltrace-1.5.0.tar.bz2.{md5,sha1}
-md5 43696383e44d1b85173db7cbd0335f06  babeltrace-1.5.0.tar.bz2
-sha1 13f106951c418632a2155ebe3cea51fa4929e748  babeltrace-1.5.0.tar.bz2
+# From http://www.efficios.com/files/babeltrace/babeltrace-1.5.1.tar.bz2.{md5,sha1}
+md5 3f7d29ba2821a966d24759a928a15cdf  babeltrace-1.5.1.tar.bz2
+sha1 07bffefed8ef68317f26e043ae5f71be58fdb783  babeltrace-1.5.1.tar.bz2
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index fb5cb65..abb3bba 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_BABELTRACE_SITE = http://www.efficios.com/files/babeltrace
-LTTNG_BABELTRACE_VERSION = 1.5.0
+LTTNG_BABELTRACE_VERSION = 1.5.1
 LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPLv2 (test code)
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
