From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Nov 2020 11:10:01 +0100
Subject: [Buildroot] [git commit] Update for 2020.11-rc3
Message-ID: <20201128095530.023C6815D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a418d0ac51e192adc54300f16b46b12a42b2b117
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 20 ++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7393f4134c..45c7ecc12a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,23 @@
+2020.11-rc3, released November 28th, 2020
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: c-ares, cage, cdrkit,
+	dovecot-pigeonhole, efl, gvfs, harfbuzz, jpeg-turbo,
+	libcamera, libkrb5, libpam-tacplus, libxkbcommon, minidlna,
+	modem-manager, monkey, musl, ncurses, numactl, openntpd,
+	openrc, postgresql, proftpd, python-flask-cors, python-pip,
+	qemu, raptor, redis, slirp, spandsp, thermald, uhd, vsftpd,
+	webkitgtk, wireless-regdb, wlroots, wpewebkit, xen, xinetd,
+	xorriso
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13296: host-libcap failed to build
+	#13331: openrc-0.42.1 compilation failure on gcc-10
+	#13336: thermald-1.9.1 compilation failure with musl 1.2.1
+	#13341: Mistake in /etc/init.d/S70vsftpd
+
 2020.11-rc2, released November 14th, 2020
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 2d911bcee8..5105cd07ff 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.11-rc2
+export BR2_VERSION := 2020.11-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1605361000
+BR2_VERSION_EPOCH = 1606558000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 774b82d733..beebbbea92 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2020.11-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2020.11-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.11-rc2.tar.gz">buildroot-2020.11-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2020.11-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.11-rc3.tar.gz">buildroot-2020.11-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2020.11-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.11-rc2.tar.bz2">buildroot-2020.11-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2020.11-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.11-rc3.tar.bz2">buildroot-2020.11-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2020.11-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 879eef9b15..f15637c3bd 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.11-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 November 2020</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.11-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.11-rc3.tar.bz2">2020.11-rc3
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
