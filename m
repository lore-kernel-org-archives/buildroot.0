From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu,  6 Nov 2014 09:07:19 +0100
Subject: [Buildroot] [PATCH 1/2] lttng-babeltrace: Bump version
Message-ID: <1415261240-31014-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/lttng-babeltrace/lttng-babeltrace.hash | 10 +++++-----
 package/lttng-babeltrace/lttng-babeltrace.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.hash b/package/lttng-babeltrace/lttng-babeltrace.hash
index 51e3a2c..a9f45b2 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.hash
+++ b/package/lttng-babeltrace/lttng-babeltrace.hash
@@ -1,7 +1,7 @@
-# From http://lttng.org/files/babeltrace/babeltrace-1.2.3.tar.bz2.md5
-md5     c35b480304ba34aacbfb3934182cdd21  babeltrace-1.2.3.tar.bz2
-# From http://lttng.org/files/babeltrace/babeltrace-1.2.3.tar.bz2.sha1
-sha1    55d3ad8fb5df4ff025e063a0993be1667bfc6554  babeltrace-1.2.3.tar.bz2
+# From http://lttng.org/files/babeltrace/babeltrace-1.2.4.tar.bz2.md5
+md5     20a806fa7570e69a91707855a98f3ca6 babeltrace-1.2.4.tar.bz2
+# From http://lttng.org/files/babeltrace/babeltrace-1.2.4.tar.bz2.sha1
+sha1    c72a80e8fd905cb1ae3b0cf88885517faafe0fa1  babeltrace-1.2.4.tar.bz2
 # Locally generated
-sha256  796fa6978102244d9c64d474baeac4e4292a0186660a53cf58f20d47226987ac  babeltrace-1.2.3.tar.bz2
+sha256  666e3a1ad2dc7d5703059963056e7800f0eab59c8eeb6be2efe4f3acc5209eb1  babeltrace-1.2.4.tar.bz2
 
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 1fd2f8b..dacb15a 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_BABELTRACE_SITE = http://lttng.org/files/babeltrace
-LTTNG_BABELTRACE_VERSION = 1.2.3
+LTTNG_BABELTRACE_VERSION = 1.2.4
 LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT; LGPLv2.1 for include/babeltrace/list.h; GPLv2 for test code
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
-- 
2.1.1
