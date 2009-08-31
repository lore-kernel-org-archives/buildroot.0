From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 31 Aug 2009 10:23:48 +0200
Subject: [Buildroot] [git commit master] buildroot: update for 2009.08
Message-ID: <20090831082818.2861177740@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f0eb8b58e440a75911621e2da49f4126e36f25bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    7 ++++++-
 Config.in          |    2 +-
 docs/download.html |   13 ++++++-------
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9175724..d6dd84e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,9 @@
-2009.08, Not yet released:
+2009.08, Released August 31th, 2009:
+
+	Additional fixes and cleanups.
+
+	Updated/fixed packages: ctorrent, saveconfig/getconfig,
+	sdl_net, util-linux.
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/Config.in b/Config.in
index f8974a0..06cc899 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2009.08-rc3"
+	default "2009.08"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/docs/download.html b/docs/download.html
index 4c7e5d5..a7f72ee 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -6,14 +6,14 @@
 
 <p>
 
-The latest stable release is <b>2009.05</b>, which can be downloaded
+The latest stable release is <b>2009.08</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2009.05.tar.gz">buildroot-2009.05.tar.gz</a>
+<a href="/downloads/buildroot-2009.08.tar.gz">buildroot-2009.08.tar.gz</a>
 or
-<a href="/downloads/buildroot-2009.05.tar.bz2">buildroot-2009.05.tar.bz2</a>.
+<a href="/downloads/buildroot-2009.08.tar.bz2">buildroot-2009.08.tar.bz2</a>.
 <p>
-
+<!--
 The latest release candidate is <b>2009.08-rc3</b>, which can be
 downloaded here:<p>
 
@@ -21,8 +21,8 @@ downloaded here:<p>
 or
 <a href="/downloads/buildroot-2009.08-rc3.tar.bz2">buildroot-2009.08-rc3.tar.bz2</a>.
 <p>
-
-This and earlier releases can always be dowloaded from
+-->
+This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
 <p>
@@ -43,4 +43,3 @@ follow development, but cannot or do not wish to use Git.
 </ul>
 
 <!--#include file="footer.html" -->
-
-- 
1.6.3.3
