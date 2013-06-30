From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Jun 2013 17:01:09 +0200
Subject: [Buildroot] [PATCH 8/8] lttng-tools: define license
In-Reply-To: <1372604469-24361-1-git-send-email-s.martin49@gmail.com>
References: <1372604469-24361-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1372604469-24361-8-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/lttng-tools/lttng-tools.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 992ecad..2e9f936 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -7,6 +7,9 @@
 LTTNG_TOOLS_VERSION = 2.2.0
 LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools/
 LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
+LTTNG_TOOLS_LICENSE = GPLv2; LGPLv2.1 for include/lttng/* and src/lib/lttng-ctl/*
+# gpl-2.0.txt and lgpl-2.1.txt files are missing from the sources
+LTTNG_TOOLS_LICENSE_FILES = LICENSE
 
 # The host-lttng-babeltrace technically isn't a required build
 # dependency. However, having the babeltrace utilities built for the
-- 
1.8.3.1
