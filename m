From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Mar 2014 20:07:10 +0100
Subject: [Buildroot] [PATCH] lttng-babeltrace: fix typo in license
	information
Message-ID: <1395688030-6266-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/c22/c229130ceab6db9d8b7f373716de9ae4b15f45eb/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-babeltrace/lttng-babeltrace.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index d54400b..84b1f60 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -8,7 +8,7 @@ LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
 LTTNG_BABELTRACE_VERSION = 1.2.1
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT; LGPL2.1 for include/babeltrace/list.h; GPLv2+ for test code
-LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt glp-2.0.txt LICENSE
+LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 
-- 
1.8.3.2
