From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Aug 2009 17:21:52 +0200
Subject: [Buildroot] [git commit master] buildroot: fix remaining references
	to SDL_net instead of sdl_net
Message-ID: <20090829152229.2140E7773D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8ed829a179176bcfc0f74d46e19a74ad2cf2d8ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/games/prboom/prboom.mk |    2 +-
 scripts/buildall.sh            |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/games/prboom/prboom.mk b/package/games/prboom/prboom.mk
index 02d018f..65f48cb 100644
--- a/package/games/prboom/prboom.mk
+++ b/package/games/prboom/prboom.mk
@@ -5,7 +5,7 @@
 #############################################################
 PRBOOM_VERSION:=2.4.7
 
-PRBOOM_DEPENDENCIES = sdl SDL_net sdl_mixer
+PRBOOM_DEPENDENCIES = sdl sdl_net sdl_mixer
 
 $(eval $(call AUTOTARGETS,package/games,prboom))
 
diff --git a/scripts/buildall.sh b/scripts/buildall.sh
index 1d415a4..3dcd0de 100755
--- a/scripts/buildall.sh
+++ b/scripts/buildall.sh
@@ -264,7 +264,7 @@ EXE	mk	sawman				OK
 EXE	mk	sdl				OK	
 EXE	mk	sdl_image			OK	
 EXE	mk	sdl_mixer			OK	
-EXE	mk	SDL_net				OK	
+EXE	mk	sdl_net				OK	
 EXE	mk	sdl_ttf				OK	
 EXE	mk	tiff				OK	
 comment	busybox graphic applications
-- 
1.6.3.3
