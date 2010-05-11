From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 May 2010 21:15:07 +0200
Subject: [Buildroot] [git commit master] update for 2010.05-rc2
Message-ID: <20100511191526.EFDED8F42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6d1ab151cb4a14a6ca29e692de26fefd2f453d0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 Config.in          |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   11 +++++++++++
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 17a8126..3a12845 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2010.05, Not yet released
+2010.05-rc2, Released May 11th, 2010:
 
 	Fixes all over the tree.
 
diff --git a/Config.in b/Config.in
index fc68bf9..c0151bd 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.05-rc1-git"
+	default "2010.05-rc2
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/docs/download.html b/docs/download.html
index 63a5b33..d8801cd 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2010.02.tar.bz2">buildroot-2010.02.tar.bz2</a>.
 <p>
 
-The latest release candidate is <b>2010.05-rc1</b>, which can be
+The latest release candidate is <b>2010.05-rc2</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2010.05-rc1.tar.gz">buildroot-2010.05-rc1.tar.gz</a>
+<a href="/downloads/buildroot-2010.05-rc2.tar.gz">buildroot-2010.05-rc2.tar.gz</a>
 or
-<a href="/downloads/buildroot-2010.05-rc1.tar.bz2">buildroot-2010.05-rc1.tar.bz2</a>.
+<a href="/downloads/buildroot-2010.05-rc2.tar.bz2">buildroot-2010.05-rc2.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 59373cd..bbebd60 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,17 @@
 <p>
 
 <ul>
+  <li><b>11 May 2010 -- 2010.05-rc2 released</b>
+
+    <p>Another week, another release candidate with a bunch of
+    cleanups and build fixes.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2010.05-rc2.tar.bz2">2010.05-rc2
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>3 May 2010 -- 2010.05-rc1 released</b>
 
     <p>We have a new release candidate! Lots of changes all over the
-- 
1.6.3.3
