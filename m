From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 22 Apr 2015 16:30:06 +0200
Subject: [Buildroot] [PATCH v2] ltris: fix typos
Message-ID: <1429713006-22772-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/ltris/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ltris/Config.in b/package/ltris/Config.in
index bf5240d..d13531b 100644
--- a/package/ltris/Config.in
+++ b/package/ltris/Config.in
@@ -4,9 +4,9 @@ config BR2_PACKAGE_LTRIS
 	select BR2_PACKAGE_SDL
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
-	  LTris as a tetris clone, using SDL. It optionally requires
+	  LTris is a tetris clone, using SDL. It optionally requires
 	  SDL_mixer for audio support.  A display with minimum 640x480
-	  resolution and a keyboard are recommanded.
+	  resolution and a keyboard are recommended.
 
 	  http://lgames.sourceforge.net/index.php?project=LTris
 
-- 
1.9.1
