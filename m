From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Jun 2010 11:27:29 +0200
Subject: [Buildroot] [git commit master 1/1] package: remove games/Config.in
Message-ID: <20100623092834.C8D1481886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7d07f3c1ab285b4e8b085ede814d51e84978378f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unused since the package menu restructuring.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/games/Config.in |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)
 delete mode 100644 package/games/Config.in

diff --git a/package/games/Config.in b/package/games/Config.in
deleted file mode 100644
index ed799ab..0000000
--- a/package/games/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-menu "Games"
-source "package/games/ace_of_penguins/Config.in"
-source "package/games/doom-wad/Config.in"
-source "package/games/gnuchess/Config.in"
-source "package/games/lxdoom/Config.in"
-source "package/games/magiccube4d/Config.in"
-source "package/games/prboom/Config.in"
-source "package/games/rubix/Config.in"
-endmenu
-- 
1.7.1
