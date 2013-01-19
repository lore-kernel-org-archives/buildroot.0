From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 19 Jan 2013 12:03:48 +0100
Subject: [Buildroot] [PATCH 4/4] lttng-babeltrace: bump to version 1.0.2
In-Reply-To: <cover.1358593210.git.s.martin49@gmail.com>
References: <cover.1358593210.git.s.martin49@gmail.com>
Message-ID: <0660c79ae34b8e93da0f9835fd0b4d575e285701.1358593210.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/lttng-babeltrace/lttng-babeltrace.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 60b8a93..82376a3 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -1,5 +1,5 @@
 LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
-LTTNG_BABELTRACE_VERSION = 1.0.0
+LTTNG_BABELTRACE_VERSION = 1.0.2
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
-- 
1.8.1.1
