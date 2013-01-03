From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 Jan 2013 21:43:39 +0100
Subject: [Buildroot] [git commit branch/2012.11.x] Update for 2012.11.1
Message-ID: <20130103204416.D68629A5DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1264adda0ec0ec5edaff5e372b97972cee6ae33c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/2012.11.x

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES  |   10 ++++++++++
 Makefile |    2 +-
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2c357eb..0287cff 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,13 @@
+2012.11.1, Released January 3rd, 2013:
+
+	Toolchain: Fixed non-largefile builds on recent Ubuntu
+	versions.
+
+	Arch: fix missing x86/generic handling, Build for Xtensa with
+	longcalls option.
+
+	Updated/fixed packages: dosfstools, qt
+
 2012.11, Released December 2nd, 2012:
 
 	Git shallow clone fix for older git version.
diff --git a/Makefile b/Makefile
index 9d9985f..692dbba 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2012.11
+export BR2_VERSION:=2012.11.1
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
