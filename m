From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Dec 2012 23:17:47 +0100
Subject: [Buildroot] [PATCH 4/4] lttng-babeltrace: bump to 1.0.0
In-Reply-To: <cover.1356905589.git.s.martin49@gmail.com>
References: <cover.1356905589.git.s.martin49@gmail.com>
Message-ID: <192d7031d43a55c00114dbb0bc54b697e4baf02e.1356905589.git.s.martin49@gmail.com>
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
index dd701df..60b8a93 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -1,5 +1,5 @@
 LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
-LTTNG_BABELTRACE_VERSION = 1.0.0-rc6
+LTTNG_BABELTRACE_VERSION = 1.0.0
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
-- 
1.8.0.3
