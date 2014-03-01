From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  2 Mar 2014 00:39:52 +0100
Subject: [Buildroot] [PATCH 5/6] lttng-babeltrace: bump version to 1.2.0
In-Reply-To: <1393717193-19774-1-git-send-email-s.martin49@gmail.com>
References: <1393717193-19774-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1393717193-19774-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also adjust the license details

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/lttng-babeltrace/lttng-babeltrace.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 044dac0..f72abd7 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -5,10 +5,10 @@
 ################################################################################
 
 LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
-LTTNG_BABELTRACE_VERSION = 1.1.1
+LTTNG_BABELTRACE_VERSION = 1.2.0
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
-LTTNG_BABELTRACE_LICENSE = MIT; LGPLv2 for include/babeltrace/list.h; GPLv3+ for formats/ctf/metadata/ctf-parser.h
-LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt LICENSE
+LTTNG_BABELTRACE_LICENSE = MIT; LGPL2.1 for include/babeltrace/list.h; GPLv2+ for test code
+LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt glp-2.0.txt LICENSE
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 
-- 
1.9.0
