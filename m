From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 May 2018 23:00:18 +0200
Subject: [Buildroot] [git commit] Update for 2018.05-rc1
Message-ID: <20180509211029.270F48C953@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b19e24b9f76cd46aef63dfad7cd483a8464551d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile                   |  4 ++--
 docs/website/download.html | 21 +++++++++++----------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index c024c65f78..5fc435a225 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.05-git
+export BR2_VERSION := 2018.05-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1520198000
+BR2_VERSION_EPOCH = 1525899000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 1b957dd161..4ac00a27be 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,42 @@
 	  <p><a href="/downloads/buildroot-2017.11.2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
+-->
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2018.02-rc3</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2018.05-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.02-rc3.tar.gz">buildroot-2018.02-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2018.02-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.05-rc1.tar.gz">buildroot-2018.05-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2018.05-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2018.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2018.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2018.05-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2018.02-rc3.tar.bz2">buildroot-2018.02-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2018.02-rc3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2018.05-rc1.tar.bz2">buildroot-2018.05-rc1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2018.05-rc1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
