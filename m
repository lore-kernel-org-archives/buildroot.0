From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 11 Feb 2012 17:41:09 +0100
Subject: [Buildroot] [PATCH] pkg-stats: update list of packages to be skipped
Message-ID: <1328978469-27669-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
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
-- 
1.7.5.4
