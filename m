From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Jul 2010 21:30:15 +0200
Subject: [Buildroot] [git commit master 1/1] games: put doom related options
	together
Message-ID: <20100718200735.8356282BA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e7b7148dfb455cd3dbaf73227aaa4bf13fcc2992
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index eba21da..fe96939 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -75,11 +75,11 @@ endmenu
 
 menu "Games"
 source "package/games/ace_of_penguins/Config.in"
-source "package/games/doom-wad/Config.in"
 source "package/games/gnuchess/Config.in"
-source "package/games/lxdoom/Config.in"
 source "package/games/magiccube4d/Config.in"
+source "package/games/lxdoom/Config.in"
 source "package/games/prboom/Config.in"
+source "package/games/doom-wad/Config.in"
 source "package/games/rubix/Config.in"
 endmenu
 
-- 
1.7.1
