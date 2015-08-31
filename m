From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2015 23:06:58 +0200
Subject: [Buildroot] [git commit] Update for 2015.08
Message-ID: <20150831210731.90FC87FE04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20a36cd877a270b20fd8652d1e9dd93c99a5cb55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |    2 +-
 Makefile                   |    2 +-
 docs/website/download.html |   14 +++++++-------
 docs/website/news.html     |    9 +++++++++
 4 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3454d6b..89df9a4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2015.08, Not yet released
+2015.08, Released August 31st, 2015
 
 	Minor fixes.
 
diff --git a/Makefile b/Makefile
index 07fd69b..2254a8f 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.08-rc2
+export BR2_VERSION := 2015.08
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 935699e..ef87b1c 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -7,15 +7,15 @@
 
 <p>
 
-The latest stable release is <b>2015.05</b>, which can be downloaded
+The latest stable release is <b>2015.08</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2015.05.tar.gz">buildroot-2015.05.tar.gz</a>
-(<a href="/downloads/buildroot-2015.05.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2015.08.tar.gz">buildroot-2015.08.tar.gz</a>
+(<a href="/downloads/buildroot-2015.08.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2015.05.tar.bz2">buildroot-2015.05.tar.bz2</a>
-(<a href="/downloads/buildroot-2015.05.tar.bz2.sign">PGP signature</a>).
-
+<a href="/downloads/buildroot-2015.08.tar.bz2">buildroot-2015.08.tar.bz2</a>
+(<a href="/downloads/buildroot-2015.08.tar.bz2.sign">PGP signature</a>).
+<!--
 <p>
 The latest release candidate is <b>2015.08-rc2</b>, which can be
 downloaded here:<p>
@@ -26,7 +26,7 @@ or
 <a href="/downloads/buildroot-2015.08-rc2.tar.bz2">buildroot-2015.08-rc1.tar.bz2</a>
 (<a href="/downloads/buildroot-2015.08-rc2.tar.bz2.sign">PGP signature</a>).
 <p>
-
+-->
 This and earlier releases (and their PGP signatures) can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/website/news.html b/docs/website/news.html
index dd489b2..12ba416 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -8,6 +8,15 @@
 <p>
 
 <ul>
+  <li><b>31 August 2015 -- 2015.08 released</b>
+
+    <p>The stable 2015.08 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08">CHANGES</a>
+    file for more details,
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2015.08.tar.bz2">2015.08 release</a>.</p>
+
   <li><b>24 August 2015 -- 2015.08-rc2 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
