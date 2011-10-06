From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu,  6 Oct 2011 14:37:27 +0200
Subject: [Buildroot] [PATCH] pkg-stats: update script location in usage
	instructions
Message-ID: <1317904647-21410-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
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
-- 
1.7.4.1
