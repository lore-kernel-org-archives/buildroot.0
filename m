From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 22 Aug 2012 22:03:38 +0200
Subject: [Buildroot] [PATCH] inotify-tools: fix license
Message-ID: <1345665819-12251-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No specific GPL version is declared, so it defaults to "any version
ever published", as clause 9 of the GPLv2 states.

Fixes a05a1cc16b9b3.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/inotify-tools/inotify-tools.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index b53efad..deb8a8c 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -5,7 +5,7 @@
 #############################################################
 INOTIFY_TOOLS_VERSION = 3.14
 INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
-INOTIFY_TOOLS_LICENSE = GPLv2+
+INOTIFY_TOOLS_LICENSE = GPL
 INOTIFY_TOOLS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.9.5
