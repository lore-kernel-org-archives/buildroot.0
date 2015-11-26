From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 23:06:02 +0100
Subject: [Buildroot] [git commit] Update for 2015.11-rc3
Message-ID: <20151126220630.CD9FB7FBE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=610f3fa03ddf035497f596fe5421cb0e8b5b86c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |   13 +++++++++++++
 Makefile                   |    2 +-
 docs/website/download.html |   18 +++++++++---------
 docs/website/news.html     |   23 +++++++++++++++++++++++
 4 files changed, 46 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index c4b6acd..60c7824 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,16 @@
+2015.11-rc3, Released November 26th, 2015
+
+	Fixes all over the tree.
+
+	Updated/fixed packages:
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#6872: gpsd: disabled on microblaze
+	#8321: invalid opcode error with minidlna and ffmpeg
+	#8336: Default systemd configuration fails to boot correctly in 2015-08
+	#8446: rpi-userland failed to build with glibc 2.22
+
 2015.11-rc2, Released November 19th, 2015
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 71c6836..da29444 100644
--- a/Makefile
+++ b/Makefile
@@ -41,7 +41,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.11-rc2
+export BR2_VERSION := 2015.11-rc3
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index b6b3f13..76279d6 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2015.11-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2015.11-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2015.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2015.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2015.11-rc2.tar.gz">buildroot-2015.11-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2015.11-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2015.11-rc3.tar.gz">buildroot-2015.11-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2015.11-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2015.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2015.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2015.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2015.11-rc2.tar.bz2">buildroot-2015.11-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2015.11-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2015.11-rc3.tar.bz2">buildroot-2015.11-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2015.11-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
       This and earlier releases (and their PGP signatures) can always be downloaded from
diff --git a/docs/website/news.html b/docs/website/news.html
index c616cbc..eb4ec6c 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -8,6 +8,29 @@
 
 <h2>News</h2>
 <ul class="timeline">
+
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2015.11-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 November 2015</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>Release candidate 3 is out with more cleanups and security
+	  / build fixes. See
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11-rc3">CHANGES</a>
+	  file for details.</p>
+	<p>Head to the <a href="/downloads/">downloads page</a> to
+	  pick up
+	  the <a href="/downloads/buildroot-2015.11-rc3.tar.bz2">2015.11-rc3
+	    release candidate</a>, and report any problems found to
+	  the <a href="lists.html">mailing list</a>
+	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
