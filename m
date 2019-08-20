From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 14:39:52 +0200
Subject: [Buildroot] [git commit] Update for 2019.08-rc2
Message-ID: <20190820123902.11228815A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3221f1abf146ce730fbd0cc7d6ef0e5424da074
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 24 ++++++++++++------------
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 44 insertions(+), 23 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4f95012c44..ef8f0af55d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2019.08-rc2, not yet released
+2019.08-rc2, released August 20th, 2019
 
 	Fixes all over the tree.
 
@@ -6,17 +6,17 @@
 
 	Updated/fixed packages: apache, autofs, batctl, batman-adv,
 	bind, collectd, cwiid, dahdi-linux, dahdi-tools, daq,
-	dehydrated, dhcp, dtc, efl, enlightenment, evtest, gnutls, go,
-	gst-plugins-bad, gst-plugins-base, gst1-plugins-bad,
-	gst1-plugins-base, gst1-rtsp-server, gtkmm3, gupnp, harfbuzz,
-	imagemagick, lftp, libbsd, libcpprestsdk, libdnet, libfm,
-	libgit2, libgtk2, libgtk3, libpri, librsvg, libss7, libssh2,
-	libwpe, lua-cqueues, metacity, micropython, mpd, mpg123, musl,
-	mpv, openblas, openbox, opencv, pango, pcmanfm, piglit,
-	pigpio, pinentry, postgresql, qemu, qt5base, qt5enginio,
-	qt5multimedia, qt5serialbus, quazip, rrdtool, rygel, samba4,
-	stellarium, tcpreplay, ti-gfx, vte, wampcc,
-	wilink-bt-firmware, wireless-regdb, wpebackend-fdo,
+	dehydrated, dhcp, dtc, efl, enlightenment, evtest, giflib,
+	gnutls, go, gst-plugins-bad, gst-plugins-base,
+	gst1-plugins-bad, gst1-plugins-base, gst1-rtsp-server, gtkmm3,
+	gupnp, harfbuzz, imagemagick, lftp, libbsd, libcpprestsdk,
+	libdnet, libfm, libgit2, libgtk2, libgtk3, libpri, librsvg,
+	libss7, libssh2, libwpe, lua-cqueues, metacity, micropython,
+	mpd, mpg123, musl, mpv, openblas, openbox, opencv, pango,
+	pcmanfm, piglit, pigpio, pinentry, postgresql, qemu, qt5base,
+	qt5enginio, qt5multimedia, qt5serialbus, quagga, quazip,
+	rrdtool, rygel, samba4, stellarium, tcpreplay, ti-gfx, vte,
+	wampcc, wilink-bt-firmware, wireless-regdb, wpebackend-fdo,
 	xscreensaver
 
 	Removed packages: libamcodec, odroid-mali, odroid-scripts
diff --git a/Makefile b/Makefile
index 406efd1ab6..0be0fe6cc3 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.08-rc1
+export BR2_VERSION := 2019.08-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1565334000
+BR2_VERSION_EPOCH = 1566304000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index ef3583eebe..05114eadbd 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2019.08-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2019.08-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.08-rc1.tar.gz">buildroot-2019.08-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2019.08-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.08-rc2.tar.gz">buildroot-2019.08-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2019.08-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.08-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.08-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.08-rc1.tar.bz2">buildroot-2019.08-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2019.08-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.08-rc2.tar.bz2">buildroot-2019.08-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2019.08-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 88819e1d99..ec3ee6b6d8 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.08-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 August 2019</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.08-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.08-rc2.tar.bz2">2019.08-rc2
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
