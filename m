From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Sep 2013 13:21:15 +0200
Subject: [Buildroot] [git commit branch/2013.08.x] Update for 2013.08.1
Message-ID: <20130917112852.7989A9B7A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad2600ce216f3df4c2cf0ff097c0bceb1ef149b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/2013.08.x

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES  |    9 +++++++++
 Makefile |    2 +-
 2 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index f1b01a3..754f379 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,12 @@
+2013.08.1, Released September 17th, 2013:
+
+	Handle the removed GCC and development files on target options
+	through Config.in.legacy.
+
+	Rootfs /lib symlink handling fixed (triggered by make external-deps)
+
+	Updated/fixed packages: elf2flt, ti-gfx
+
 2013.08, Released August 31th, 2013:
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index 819a597..70749ef 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.08
+export BR2_VERSION:=2013.08.1
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
