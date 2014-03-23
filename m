From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Mar 2014 22:50:51 +0100
Subject: [Buildroot] [git commit] lttng-babeltrace: bump version to 1.2.1
Message-ID: <20140323221922.199269BF81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e634a4836c5a2754cf94924baee7082efa9dd49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also adjust the license details

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-babeltrace/lttng-babeltrace.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 044dac0..d54400b 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -5,10 +5,10 @@
 ################################################################################
 
 LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
-LTTNG_BABELTRACE_VERSION = 1.1.1
+LTTNG_BABELTRACE_VERSION = 1.2.1
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
-LTTNG_BABELTRACE_LICENSE = MIT; LGPLv2 for include/babeltrace/list.h; GPLv3+ for formats/ctf/metadata/ctf-parser.h
-LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt LICENSE
+LTTNG_BABELTRACE_LICENSE = MIT; LGPL2.1 for include/babeltrace/list.h; GPLv2+ for test code
+LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt glp-2.0.txt LICENSE
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 
