From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 May 2016 12:08:39 +0200
Subject: [Buildroot] [PATCH 3/7] package/kodi-screensaver-crystalmorph:
	shorten comment
In-Reply-To: <1462874923-26647-1-git-send-email-bernd.kuhls@t-online.de>
References: <1462874923-26647-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1462874923-26647-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-crystalmorph/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-screensaver-crystalmorph/Config.in b/package/kodi-screensaver-crystalmorph/Config.in
index ad29a90..88edbf0 100644
--- a/package/kodi-screensaver-crystalmorph/Config.in
+++ b/package/kodi-screensaver-crystalmorph/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_CRYSTALMORPH
 
 	  https://github.com/notspiff/screensaver.crystalmorph
 
-comment "kodi-screensaver-crystalmorph needs an OpenGL backend"
+comment "crystalmorph needs an OpenGL backend"
 	depends on !BR2_PACKAGE_KODI_GL
-- 
2.8.1
