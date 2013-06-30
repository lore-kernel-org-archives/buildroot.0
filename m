From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Jun 2013 17:01:06 +0200
Subject: [Buildroot] [PATCH 5/8] lttng-babeltrace: define license
In-Reply-To: <1372604469-24361-1-git-send-email-s.martin49@gmail.com>
References: <1372604469-24361-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1372604469-24361-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/lttng-babeltrace/lttng-babeltrace.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 96d3a31..044dac0 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -7,6 +7,8 @@
 LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
 LTTNG_BABELTRACE_VERSION = 1.1.1
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
+LTTNG_BABELTRACE_LICENSE = MIT; LGPLv2 for include/babeltrace/list.h; GPLv3+ for formats/ctf/metadata/ctf-parser.h
+LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt LICENSE
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 
-- 
1.8.3.1
