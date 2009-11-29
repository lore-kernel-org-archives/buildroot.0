From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Nov 2009 23:26:54 +0100
Subject: [Buildroot] [git commit master] update for 2009.11-rc2
Message-ID: <20091129222851.0D0E3777EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=31bd97417baee79546a0487ad1e4d98251a1e31a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    4 +++-
 Config.in          |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   12 ++++++++++++
 4 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 30eaac9..7a5535a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,6 @@
-2009.11, Not released yet:
+2009.11-rc2, Released November 29th, 2009:
+
+	Additional fixes and cleanups.
 
 	Updated/fixed packages: busybox, dbus, fltk, gvfs, ltrace
 
diff --git a/Config.in b/Config.in
index 0a5a7b9..b4ed729 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2009.11-rc1"
+	default "2009.11-rc2"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/docs/download.html b/docs/download.html
index a7f72ee..e497659 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -13,15 +13,15 @@ here:<p>
 or
 <a href="/downloads/buildroot-2009.08.tar.bz2">buildroot-2009.08.tar.bz2</a>.
 <p>
-<!--
-The latest release candidate is <b>2009.08-rc3</b>, which can be
+
+The latest release candidate is <b>2009.11-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2009.08-rc3.tar.gz">buildroot-2009.08-rc3.tar.gz</a>
+<a href="/downloads/buildroot-2009.11-rc2.tar.gz">buildroot-2009.11-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2009.08-rc3.tar.bz2">buildroot-2009.08-rc3.tar.bz2</a>.
+<a href="/downloads/buildroot-2009.11-rc2.tar.bz2">buildroot-2009.11-rc2.tar.bz2</a>.
 <p>
--->
+
 This and earlier releases can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/news.html b/docs/news.html
index ed69884..3376bee 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,18 @@
 <p>
 
 <ul>
+  <li><b>29 November 2009 -- 2009.11-rc2 released</b>
+
+    <p>RC2 is out with more cleanups and bugfixes, see the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.11_rc2">CHANGES</a>
+    file for details.
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2009.11-rc2.tar.bz2">2009.11-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>23 November 2009 -- 2009.11-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
-- 
1.6.3.3
