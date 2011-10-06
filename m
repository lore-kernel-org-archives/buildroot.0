From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Oct 2011 14:49:09 +0200
Subject: [Buildroot] [git commit] pkg-stats: update script location in usage
	instructions
Message-ID: <20111006124929.7D4428E25C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc9954e6d6b67556ccb4bcbf9b1e96e24a18b7e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/pkg-stats |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 0a030c1..64aae5f 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -22,7 +22,7 @@
 #
 # Run the script from the Buildroot toplevel directory:
 #
-#  ./scripts/pkg-stats > /tmp/pkg.html
+#  ./support/scripts/pkg-stats > /tmp/pkg.html
 #
 
 echo "<head>
