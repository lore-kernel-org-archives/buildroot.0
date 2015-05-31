From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2015 23:15:34 +0200
Subject: [Buildroot] [git commit] Update for 2015.05
Message-ID: <20150531212448.174948163C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d73615f0c30349e093ac9764c4d13b5c4b4ee91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |   10 ++++++++++
 Makefile                   |    2 +-
 docs/website/download.html |   14 +++++++-------
 docs/website/news.html     |   10 ++++++++++
 4 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index e554d57..3f5162e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,13 @@
+2015.05, Released May 31st, 2015
+
+	Minor fixes.
+
+	Updated/fixed packages: conntrack-tools, directfb, fio, flite,
+	gptfdisk, ipmiutil, iproute2, janus-gateway, keyutils, knock,
+	libelementary, libgcrypt, libgsasl, libjpeg, libstrophe,
+	lttng-libust, nbd, ncurses, nmap, php, postgresql, python,
+	python3, sconeserver, udpcast, upmpdcli
+
 2015.05-rc3, Released May 22nd, 2015
 
 	Several fixes, mainly related to static linking.
diff --git a/Makefile b/Makefile
index cf244d7..e490871 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.05-rc3
+export BR2_VERSION := 2015.05
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/website/download.html b/docs/website/download.html
index 640800e..715bec9 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -7,17 +7,17 @@
 
 <p>
 
-The latest stable release is <b>2015.02</b>, which can be downloaded
+The latest stable release is <b>2015.05</b>, which can be downloaded
 here:<p>
 
-<a href="/downloads/buildroot-2015.02.tar.gz">buildroot-2015.02.tar.gz</a>
-(<a href="/downloads/buildroot-2015.02.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2015.05.tar.gz">buildroot-2015.05.tar.gz</a>
+(<a href="/downloads/buildroot-2015.05.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2015.02.tar.bz2">buildroot-2015.02.tar.bz2</a>
-(<a href="/downloads/buildroot-2015.02.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2015.05.tar.bz2">buildroot-2015.05.tar.bz2</a>
+(<a href="/downloads/buildroot-2015.05.tar.bz2.sign">PGP signature</a>).
 
 <p>
-
+<!--
 The latest release candidate is <b>2015.05-rc3</b>, which can be
 downloaded here:<p>
 
@@ -27,7 +27,7 @@ or
 <a href="/downloads/buildroot-2015.05-rc3.tar.bz2">buildroot-2015.05-rc3.tar.bz2</a>
 (<a href="/downloads/buildroot-2015.05-rc3.tar.bz2.sign">PGP signature</a>).
 <p>
-
+-->
 This and earlier releases (and their PGP signatures) can always be downloaded from
 <a href="/downloads/">http://buildroot.net/downloads/</a>.
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 39fe693..8b3fd9a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -8,6 +8,16 @@
 <p>
 
 <ul>
+
+  <li><b>31 May 2015 -- 2015.05 released</b>
+
+    <p>The stable 2015.05 release is out - Thanks to everyone
+    contributing and testing the release candidates. See the
+    <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05">CHANGES</a>
+    file for more details,
+    and go to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2015.05.tar.bz2">2015.05 release</a>.</p>
+
  <li><b>22 May 2015 -- 2015.05-rc3 released</b>
 
     <p>Release candidate 3 is out with more cleanups and security / build fixes. See the <a
