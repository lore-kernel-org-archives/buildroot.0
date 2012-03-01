From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Mar 2012 14:03:39 +0100
Subject: [Buildroot] [git commit] kickoff 2012.05 development cycle
Message-ID: <20120301130637.1F1BC90BF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c3a337387570911d13e86eadbbc2f846d36fd54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES  |    2 ++
 Makefile |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9c1db25..6f58d52 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,5 @@
+2012.05, Not released yet:
+
 2012.02, Released February 29th, 2012:
 
 	Updated/fixed packages: libecore
diff --git a/Makefile b/Makefile
index c9f0eab..02405dd 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.02
+export BR2_VERSION:=2012.05-git
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
