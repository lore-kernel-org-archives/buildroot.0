From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  8 Mar 2014 15:38:30 +0100
Subject: [Buildroot] [PATCH v2 5/6] lttng-babeltrace: bump version to 1.2.1
In-Reply-To: <1394289511-10524-1-git-send-email-s.martin49@gmail.com>
References: <1394289511-10524-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1394289511-10524-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also adjust the license details

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- rebase
- bump version (1.2.0 -> 1.2.1)
---
 package/lttng-babeltrace/lttng-babeltrace.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
 
-- 
1.9.0
