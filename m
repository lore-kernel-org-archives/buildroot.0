From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Nov 2018 22:56:48 +0100
Subject: [Buildroot] [git commit] Update for 2018.11-rc1
Message-ID: <20181109215458.95653822A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=419fc6abca3911ee58ff5d092aa5e912ae65db93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |  2 +-
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 992e2c5d51..703728a728 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2018.11-rc1, not yet released
+2018.11-rc1, released November 9th, 2018
 
 	Fixes all over the tree and new features.
 
diff --git a/Makefile b/Makefile
index a69af3b645..94adff3406 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.11-git
+export BR2_VERSION := 2018.11-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1536263000
+BR2_VERSION_EPOCH = 1541800000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index f09e7e03d9..59bd8bae29 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2018.08.2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2018.08-rc3</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2018.11-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.08-rc3.tar.gz">buildroot-2018.08-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.08-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.11-rc1.tar.gz">buildroot-2018.11-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.11-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.08-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.08-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.11-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.08-rc3.tar.bz2">buildroot-2018.08-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.08-rc3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.11-rc1.tar.bz2">buildroot-2018.11-rc1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.11-rc1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
