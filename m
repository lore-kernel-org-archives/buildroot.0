From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Nov 2010 10:24:59 +0100
Subject: [Buildroot] [git commit master 1/1] Update for 2010.11-rc1
Message-ID: <20101108093744.6F3548DC0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ea252b0e040453223858a0eda385e895e4d65b93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    4 ++--
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4727c4a..bc3e944 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
-2010.11, Not yet released:
+2010.11-rc1, Released November 8th, 2010:
 
-	Fixes all over the tree.
+	Fixes all over the tree and new features.
 
 	Kconfig infrastructure rebased against 2.6.36-rc1, bringing
 	misc fixes + nconfig and savedefconfig targets.
diff --git a/Makefile b/Makefile
index 1469e7b..e569a94 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2010.11-git
+export BR2_VERSION:=2010.11-rc1
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
diff --git a/docs/download.html b/docs/download.html
index 75abc92..ae1e2fb 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -13,15 +13,15 @@ here:<p>
 or
 <a href="/downloads/buildroot-2010.08.tar.bz2">buildroot-2010.08.tar.bz2</a>.
 <p>
-<!--
-The latest release candidate is <b>2010.08-rc2</b>, which can be
+
+The latest release candidate is <b>2010.11-rc1</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2010.08-rc2.tar.gz">buildroot-2010.08-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2010.11-rc1.tar.gz">buildroot-2010.11-rc1.tar.gz</a>
 or
-<a href="/downloads/buildroot-2010.08-rc2.tar.bz2">buildroot-2010.08-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2010.11-rc1.tar.bz2">buildroot-2010.11-rc1.tar.bz2</a>.
 <p>
--->
+
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
-- 
1.7.1
