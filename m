From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Mar 2011 14:13:56 +0100
Subject: [Buildroot] [git commit master 1/1] kickoff 2011.05 development
	cycle
Message-ID: <20110301154332.C7E9E8C99E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=da5e5a5aa23a727ffc7cd3a2eb8cd268ef2f8d06
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES  |    2 ++
 Makefile |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9ee4cd6..e9d9a2e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,5 @@
+2011.05, Not released yet:
+
 2011.02, Released February 28th, 2011:
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 8046763..7ae3787 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.02
+export BR2_VERSION:=2011.05-git
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
-- 
1.7.3.4
