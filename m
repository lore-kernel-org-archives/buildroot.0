From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Oct 2011 07:20:51 +0200
Subject: [Buildroot] [git commit] pkg-stats: update list of .mk to ignore
Message-ID: <20111006064504.75B438E256@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b706e4d0e46a047d84554fe03bf4c2f2c5d1cf66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/pkg-stats |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
