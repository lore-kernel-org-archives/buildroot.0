From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Sep 2009 16:44:06 +0200
Subject: [Buildroot] [git commit master] gtk2-themes: fix typo
Message-ID: <20090901145034.7737877753@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=129c2d1e1df6ac895fbb93f7d2a9649657e209f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gtk2-themes/Config.in |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/gtk2-themes/Config.in b/package/gtk2-themes/Config.in
index 034b911..351b602 100644
--- a/package/gtk2-themes/Config.in
+++ b/package/gtk2-themes/Config.in
@@ -2,7 +2,6 @@ menu "GTK Themes"
 depends on BR2_PACKAGE_LIBGTK2
 
 config BR2_PACKAGE_GTK2_THEME_HICOLOR
-	bool "hicolor (defaut theme)"
-	depends on BR2_PACKAGE_LIBGTK2
+	bool "hicolor (default theme)"
 
 endmenu
-- 
1.6.3.3
