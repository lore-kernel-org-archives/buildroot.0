From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Sep 2011 22:16:03 +0200
Subject: [Buildroot] [git commit] kickoff 2011.11 development cycle
Message-ID: <20110905201638.944428D3F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5427c506bd652e0d0a6c59d14791018195c59525
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES  |    2 ++
 Makefile |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 99cd79b..288d575 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,5 @@
+2011.11, Not released yet:
+
 2011.08, Released August 31th, 2011:
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 9ed46fc..8779d3f 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.08
+export BR2_VERSION:=2011.11-git
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
-- 
1.7.3.4
