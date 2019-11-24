From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 11:15:16 +0100
Subject: [Buildroot] [git commit] Update for 2019.11-rc3
Message-ID: <20191124101231.AEC698FB81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc1c7e5961f7b22ddaad16479b5fb11d8e761086
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 10 ++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 60126c9a10..d00e72d5fd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,13 @@
+2019.11-rc3, released November 24th, 2019
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: asterisk, clamav, domoticz, faifa,
+	gerbera, kmod, kvm-unit-tests, libupnp18, linux-serial-test,
+	lsof, ltp-testsuite, lxc, mesa3d, mesa3d-headers, perl, php,
+	postgresql, qemu, rauc, redis, rpcbind, spice, spice-protocol,
+	systemd, tftpd, waylandpp, webkitgtk, zip
+
 2019.11-rc2, released November 16th, 2019
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index a415ad6ab8..3ac55fafcb 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.11-rc2
+export BR2_VERSION := 2019.11-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1573941000
+BR2_VERSION_EPOCH = 1574590000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index fea38db76b..efeea3f7e2 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2019.11-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2019.11-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.11-rc2.tar.gz">buildroot-2019.11-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2019.11-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.11-rc3.tar.gz">buildroot-2019.11-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2019.11-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2019.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2019.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2019.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2019.11-rc2.tar.bz2">buildroot-2019.11-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2019.11-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2019.11-rc3.tar.bz2">buildroot-2019.11-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2019.11-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 1bb9d2676a..e77075a41c 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -10,6 +10,28 @@
 <ul class="timeline">
 
   <li class="timeline-inverted">
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2019.11-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 November 2019</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2019.11-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2019.11-rc3.tar.bz2">2019.11-rc3
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
+  <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
       <div class="timeline-heading">
