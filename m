From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 23:37:23 +0200
Subject: [Buildroot] [git commit] Update for 2016.05-rc3
Message-ID: <20160526213807.2436081D71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4365df190e2308ec9fccb3ab30f9da41c9c834b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 21 +++++++++++++++++++++
 Makefile                   |  2 +-
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index cac7b2d..7fd84ea 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,24 @@
+2016.05-rc3, Released May 26th, 2016
+
+	Fixes all over the tree.
+
+	Tweaks for SSP handling for external toolchains.
+
+	Updated/fixed packages: aircrack-ng, bluez5_utils, connman,
+	cups, erlang-p1-stringprep, expat, ffmpeg, flann, flannel, go,
+	gst1-libav, hidapi, hplip, iptraf-ng, jamvm, kodi,
+	kodi-screensaver-matrixtrails, libcurl, libepoxy, libgpgme,
+	libsemanage, libxslt, liquid-dsp, ltris, lxc, mesa3d, midori,
+	mpg123, mtr, openpgm, openpowerlink, oprofile, php,
+	postgresql, putty, python-service-identity, python-treq,
+	qlibc, qt5serialbus, ruby, stress-ng, strongswan, time, tinc,
+	ustr, valgrind, webkitgtk, libxml2, xorriso,
+	xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#8936: Aircrack-ng - Alot of missing dependencies
+
 2016.05-rc2, Released May 17th, 2016
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index fb88b0e..7532382 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.05-rc2
+export BR2_VERSION := 2016.05-rc3
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index e5c5e58..10fb457 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2016.05-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2016.05-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.05-rc2.tar.gz">buildroot-2016.05-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2016.05-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.05-rc3.tar.gz">buildroot-2016.05-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2016.05-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.05-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.05-rc2.tar.bz2">buildroot-2016.05-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2016.05-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.05-rc3.tar.bz2">buildroot-2016.05-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2016.05-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 2bb99d8..8387ea6 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2016.05-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 May 2016</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>Release candidate 3 is out with more cleanups and security
+	  / build fixes. See
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.05-rc3">CHANGES</a>
+	  file for details.</p>
+	<p>Head to the <a href="/downloads/">downloads page</a> to
+	  pick up
+	  the <a href="/downloads/buildroot-2016.05-rc3.tar.bz2">2016.05-rc3
+	    release candidate</a>, and report any problems found to
+	  the <a href="support.html">mailing list</a>
+	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
