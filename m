From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:35 -0000
Subject: [Buildroot] [git commit branch/next] Kickoff 2012.08 cycle
Message-ID: <20120802195234.B992096F60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b11223fb6cd0469becf49b0986868832c076bfc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES  |    2 ++
 Makefile |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5043bc9..b526c58 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,5 @@
+2012.08, Not released yet:
+
 2012.05, Released May 30th, 2012:
 
 	Updated/fixed packages: busybox, netsnmp, pptp-linux
diff --git a/Makefile b/Makefile
index 98e1a51..9a9634d 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.05
+export BR2_VERSION:=2012.08-git
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
