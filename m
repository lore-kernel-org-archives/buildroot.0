From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 22 Aug 2012 08:08:40 +0100
Subject: [Buildroot] [PATCH] inotify-tools: add license information
Message-ID: <1345619321-4644-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/inotify-tools/inotify-tools.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index 52a1701..7c37929 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -6,3 +6,5 @@
 INOTIFY_TOOLS_VERSION = 3.14
 INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
 $(eval $(autotools-package))
+INOTIFY_TOOLS_LICENSE = GPLv2+
+INOTIFY_TOOLS_LICENSE_FILES = COPYING
-- 
1.7.9.5
