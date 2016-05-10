From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 May 2016 12:08:41 +0200
Subject: [Buildroot] [PATCH 5/7] package/kodi-screensaver-pingpong: fix typo
	in comment, shorten comment
In-Reply-To: <1462874923-26647-1-git-send-email-bernd.kuhls@t-online.de>
References: <1462874923-26647-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1462874923-26647-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-pingpong/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-screensaver-pingpong/Config.in b/package/kodi-screensaver-pingpong/Config.in
index 4ccf4c4..b1ba8c5 100644
--- a/package/kodi-screensaver-pingpong/Config.in
+++ b/package/kodi-screensaver-pingpong/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_KODI_SCREENSAVER_PINGPONG
 
 	  https://github.com/notspiff/screensaver.pingpong
 
-comment "kodi-screensaver-greynetic needs an OpenGL backend"
+comment "pingpong needs an OpenGL backend"
 	depends on !BR2_PACKAGE_KODI_GL
-- 
2.8.1
