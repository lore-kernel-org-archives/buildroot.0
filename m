From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 17:43:36 +0200
Subject: [Buildroot] [git commit] jquery-ui: bump version
Message-ID: <20130506221622.02F8599ABA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c85f2cb0843f569c16f8628dc401dcf84f5d175f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jquery-ui/jquery-ui.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
index 3fd9e43..9e19f13 100644
--- a/package/jquery-ui/jquery-ui.mk
+++ b/package/jquery-ui/jquery-ui.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-JQUERY_UI_VERSION = 1.8.21
-JQUERY_UI_SITE = http://jquery-ui.googlecode.com/files
+JQUERY_UI_VERSION = 1.10.3
+JQUERY_UI_SITE = http://jqueryui.com/resources/download
 JQUERY_UI_SOURCE = jquery-ui-$(JQUERY_UI_VERSION).zip
 
 define JQUERY_UI_EXTRACT_CMDS
