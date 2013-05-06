From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 23:47:58 +0200
Subject: [Buildroot] [git commit] jquery-ui-themes: add license info
Message-ID: <20130506221622.6CDDF99C79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98328fd693fabeaf48e67e51a5b4ba2924992534
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jquery-ui-themes/jquery-ui-themes.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/jquery-ui-themes/jquery-ui-themes.mk b/package/jquery-ui-themes/jquery-ui-themes.mk
index ae50ad4..089d808 100644
--- a/package/jquery-ui-themes/jquery-ui-themes.mk
+++ b/package/jquery-ui-themes/jquery-ui-themes.mk
@@ -7,6 +7,8 @@
 JQUERY_UI_THEMES_VERSION = 1.8.21
 JQUERY_UI_THEMES_SITE = http://jquery-ui.googlecode.com/files
 JQUERY_UI_THEMES_SOURCE = jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION).zip
+JQUERY_UI_THEMES_LICENSE = MIT
+JQUERY_UI_THEMES_LICENSE_FILES = MIT-LICENSE.txt
 JQUERY_UI_THEMES_DEPENDENCIES = jquery-ui
 
 define JQUERY_UI_THEMES_EXTRACT_CMDS
