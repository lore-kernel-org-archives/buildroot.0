From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Feb 2012 19:46:58 +0100
Subject: [Buildroot] [git commit] pkg-stats: update list of packages to be
	skipped
Message-ID: <20120226202430.2A96090B91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8661ae32ad14c68f763e4311aad19b3b81177eb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/pkg-stats |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 8228274..06d9d0d 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -78,7 +78,7 @@ cnt=0
 for i in $(find package/ -name '*.mk') ; do
 
     if test \
-	$i = "package/java/java.mk" -o \
+	$i = "package/efl/efl.mk" -o \
 	$i = "package/games/games.mk" -o \
 	$i = "package/gtk2-themes/gtk2-themes.mk" -o \
 	$i = "package/multimedia/multimedia.mk" -o \
