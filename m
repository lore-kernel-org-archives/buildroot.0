From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 May 2013 22:23:57 +0200
Subject: [Buildroot] [git commit] Update for 2013.05-rc3
Message-ID: <20130525202729.AE64B9A533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c92a369fe6cd188e3a1f3cfa74d0179325bfff78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    9 +++++++++
 Makefile           |    2 +-
 docs/download.html |    6 +++---
 docs/news.html     |   13 +++++++++++++
 4 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index fd2764a..9de20b2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,12 @@
+2013.05-rc3, Released May 25th, 2013:
+
+	Minor fixes.
+
+	Updated/fixed packages: aircrack-ng, bellagio, boost, crda,
+	dvb-apps, flot, libatomic_ops, libeXosip2, libosip2, libxml2,
+	mongrel2, poco, portaudio, pptp-linux, tvheadend, urg, weston,
+	wireshark
+
 2013.05-rc2, Released May 15th, 2013:
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 5d2a7ae..e8647d1 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2013.05-rc2
+export BR2_VERSION:=2013.05-rc3
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
diff --git a/docs/download.html b/docs/download.html
index 9817dea..7d881f7 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -14,12 +14,12 @@ or
 <a href="/downloads/buildroot-2013.02.tar.bz2">buildroot-2013.02.tar.bz2</a>.
 
 <p>
-The latest release candidate is <b>2013.05-rc2</b>, which can be
+The latest release candidate is <b>2013.05-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2013.05-rc2.tar.gz">buildroot-2013.05-rc2.tar.gz</a>
+<a href="/downloads/buildroot-2013.05-rc3.tar.gz">buildroot-2013.05-rc3.tar.gz</a>
 or
-<a href="/downloads/buildroot-2013.05-rc2.tar.bz2">buildroot-2013.05-rc2.tar.bz2</a>.
+<a href="/downloads/buildroot-2013.05-rc3.tar.bz2">buildroot-2013.05-rc3.tar.bz2</a>.
 <p>
 
 This and earlier releases can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 848c409..93554f0 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -5,6 +5,19 @@
 <p>
 
 <ul>
+  <li><b>25 May 2013 -- 2013.05-rc3 released</b>
+
+    <p>Another week, another release candidate with more cleanups and
+    build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05_rc3">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2013.05-rc3.tar.bz2">2013.05-rc3
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>15 May 2013 -- 2013.05-rc2 released</b>
 
     <p>Another week, another release candidate with more cleanups and
