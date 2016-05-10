From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 May 2016 12:08:37 +0200
Subject: [Buildroot] [PATCH 1/7] package/kodi-screensaver-asteroids: shorten
	comment
Message-ID: <1462874923-26647-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-asteroids/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-screensaver-asteroids/Config.in b/package/kodi-screensaver-asteroids/Config.in
index d5d92c6..5d84ee5 100644
--- a/package/kodi-screensaver-asteroids/Config.in
+++ b/package/kodi-screensaver-asteroids/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_ASTEROIDS
 
 	  https://github.com/notspiff/screensaver.asteroids
 
-comment "kodi-screensaver-asteroids needs an OpenGL backend"
+comment "asteroids needs an OpenGL backend"
 	depends on !BR2_PACKAGE_KODI_GL
-- 
2.8.1
