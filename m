From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:11:03 +0200
Subject: [Buildroot] [git commit] ltris: fix typos
Message-ID: <20150422201109.6C1FA81D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd7354c7a7476466653b142cfa091393da6a19ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltris/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
 
