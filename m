From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 5 Oct 2011 18:57:26 -0500
Subject: [Buildroot] [PATCH] pkg-stats: update list of .mk to ignore
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DCFEA1B@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 30a21f2..0a030c1 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -80,6 +80,7 @@ for i in $(find package/ -name '*.mk') ; do
     if test \
 	$i = "package/java/java.mk" -o \
 	$i = "package/games/games.mk" -o \
+	$i = "package/gtk2-themes/gtk2-themes.mk" -o \
 	$i = "package/multimedia/multimedia.mk" -o \
 	$i = "package/customize/customize.mk" -o \
 	$i = "package/matchbox/matchbox.mk" -o \
