From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 May 2017 10:28:45 +0200
Subject: [Buildroot] [git commit] Update for 2017.05-rc3
Message-ID: <20170530083020.4ACD982A1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91a418c373ac8566c4c778dcb2aa7ecfc506ee56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 25 +++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 22 ++++++++++++++++++++++
 4 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8448145..3206fa2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,28 @@
+2017.05-rc3, Released May 30th, 2017
+
+	Fixes all over the tree.
+
+	ARC toolchain bumped to 2017.03
+
+	Runtime testing improvements and cleanups.
+
+	Updated/fixed packages: acpica, armadillo, audiofile, c-icap,
+	cppcms, dhcp, docker-engine, dropbear, elfutils, erlang,
+	fbgrab, ffmpeg, flashrom, ftop, gnutls, google-breakpad,
+	keepalived, kodi, libcdio, libepoxy, libev, libminiupnpc,
+	libqmi, libtasn1, libv4l, mariadb, mono, mosh, mosquitto,
+	mxml, ntp, opencv, openpowerlink, oracle-mysql, popt,
+	pulseview, python-enum34, rabbitmq-c, redis, samba4, stella,
+	xen
+
+	Removed packages: firejail, ola
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9871: fbgrab 1.3 won't build with BR2_REPRODUCIBLE set
+	#9876: aarch64 support with gcc 4.8 toolchain
+	#9896: host-gcc-initial error downloading because incorrect URL
+
 2017.05-rc2, Released May 17th, 2017
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index a3ad402..03989d4 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.05-rc2
+export BR2_VERSION := 2017.05-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1495000000
+BR2_VERSION_EPOCH = 1496130000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index b5a9c39..64c9edb 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2017.05-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2017.05-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.05-rc2.tar.gz">buildroot-2017.05-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2017.05-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.05-rc3.tar.gz">buildroot-2017.05-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2017.05-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2017.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.05-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2017.05-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2017.05-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2017.05-rc2.tar.bz2">buildroot-2017.05-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2017.05-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2017.05-rc3.tar.bz2">buildroot-2017.05-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2017.05-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index b9489e7..a0f25ff 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2017.05-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 May 2017</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>Release candidate 3 is out with more cleanups and security
+	  / build fixes. See
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.05-rc3">CHANGES</a>
+	  file for details.</p>
+	<p>Head to the <a href="/downloads/">downloads page</a> to
+	  pick up
+	  the <a href="/downloads/buildroot-2017.05-rc3.tar.bz2">2017.05-rc3
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
