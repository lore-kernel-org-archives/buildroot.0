From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Dec 2016 22:24:06 +0100
Subject: [Buildroot] [git commit] Update for 2016.11.1
Message-ID: <20161229212447.0B4E481E38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67f23a77c2260809b94f169fde33ff718ae940c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 19 +++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 3 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index d7eef3b..d6df438 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,37 +8,37 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable release: <b>2016.11</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2016.11.1</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.11.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.11.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2016.11.tar.gz">buildroot-2016.11.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2016.11.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.11.1.tar.gz">buildroot-2016.11.1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2016.11.1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2016.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.11.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2016.11.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2016.11.1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2016.11.tar.bz2">buildroot-2016.11.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2016.11.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2016.11.1.tar.bz2">buildroot-2016.11.1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2016.11.1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 <!--
diff --git a/docs/website/news.html b/docs/website/news.html
index 1e789ff..577e132 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2016.11.1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 December 2016</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2016.11.1 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2016.11 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2016.11.1">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2016-December/180622.html">announcement<a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2016.11.1.tar.bz2">2016.11.1 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 66d9505..ee653de 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2016.11'
+RELEASE='2016.11.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
