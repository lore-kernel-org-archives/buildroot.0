From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Nov 2010 11:29:30 +0100
Subject: [Buildroot] [git commit master 1/1] Update for 2010.11-rc2
Message-ID: <20101125102954.133298DCD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=09af8387fd99e0b52f6e43c764d8b827ebc98c66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    5 +++--
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8218e3d..07509a9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,8 +1,9 @@
-2010.11, Not yet released:
+2010.11-rc2, Released November 25th, 2010:
 
 	Fixes all over the tree.
 
-	Add support for LEON Sparc architecture variants.
+	Add support for LEON Sparc architecture variants. Fix make
+	source/external-deps for host packages.
 
 	Updated/fixed packages: bash, bind, busybox, dialog, gpsd,
 	libglib2, libcurl, libmad, lrzsz, midori, module-init-tools,
diff --git a/Makefile b/Makefile
index 22ae1d0..6752aa6 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2010.11-rc1
+export BR2_VERSION:=2010.11-rc2
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index ae1e2fb..fb74390 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2010.08.tar.bz2">buildroot-2010.08.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2010.11-rc1</b>, which can be
+The latest release candidate is <b>2010.11-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2010.11-rc1.tar.gz">buildroot-2010.11-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2010.11-rc2.tar.gz">buildroot-2010.11-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2010.11-rc1.tar.bz2">buildroot-2010.11-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2010.11-rc2.tar.bz2">buildroot-2010.11-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
-- 
1.7.2.2
