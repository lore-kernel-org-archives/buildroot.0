From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  2 Oct 2014 12:11:02 +0200
Subject: [Buildroot] [PATCH 2/3] lttng-babeltrace: fix license information
In-Reply-To: <1412244663-23868-1-git-send-email-luca@lucaceresoli.net>
References: <1412244663-23868-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1412244663-23868-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/lttng-babeltrace/lttng-babeltrace.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 838f5f6..8183510 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -7,7 +7,7 @@
 LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace
 LTTNG_BABELTRACE_VERSION = 1.2.2
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
-LTTNG_BABELTRACE_LICENSE = MIT; LGPL2.1 for include/babeltrace/list.h; GPLv2+ for test code
+LTTNG_BABELTRACE_LICENSE = MIT; LGPLv2.1 for include/babeltrace/list.h; GPLv2 for test code
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
-- 
1.9.1
