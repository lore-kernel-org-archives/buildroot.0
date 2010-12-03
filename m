From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 3 Dec 2010 11:56:58 +0100
Subject: [Buildroot] [git commit master 1/1] buildroot: kickoff 2011.02
	development phase
Message-ID: <20101205211156.81DF18E11D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a8ecce0743e36540301ad6c76a14985bdf6aea49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES  |    4 ++++
 Makefile |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index da4520f..04984a6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,7 @@
+2011.02, Not yet released:
+
+	Updated/fixed packages:
+
 2010.11, Released November 30th, 2010:
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 596470f..96db291 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2010.11
+export BR2_VERSION:=2011.02-git
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
-- 
1.7.2.2
