From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:37:24 +0200
Subject: [Buildroot] [git commit] package/inotify-tools: bump version
Message-ID: <20160605200530.3EE067FB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec03cb19dd161b3213de5078bb3cab117581bd4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/inotify-tools/inotify-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index 3502525..e8b1498 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INOTIFY_TOOLS_VERSION = 06007d350faa8731c67e186923ab417486104719
+INOTIFY_TOOLS_VERSION = 1df9af4d6cd0f4af4b1b19254bcf056aed4ae395
 INOTIFY_TOOLS_SITE = $(call github,rvoicilas,inotify-tools,$(INOTIFY_TOOLS_VERSION))
 INOTIFY_TOOLS_LICENSE = GPL
 INOTIFY_TOOLS_LICENSE_FILES = COPYING
