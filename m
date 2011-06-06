From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 Jun 2011 13:47:32 +0200
Subject: [Buildroot] [git commit] kickoff 2011.08 development cycle
Message-ID: <20110606120008.ADD4585A2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0a5e7905a63f39ddba9c66db53ff1c8b8d4f19b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES  |    2 ++
 Makefile |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5607317..a10fa18 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,5 @@
+2011.08, Not released yet:
+
 2011.05, Released May 27th, 2011:
 
 	Updated/fixed packages: makedevs
diff --git a/Makefile b/Makefile
index 893921b..f3bdf3b 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.05
+export BR2_VERSION:=2011.08-git
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
-- 
1.7.3.4
