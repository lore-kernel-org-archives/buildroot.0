From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2020 22:38:36 +0200
Subject: [Buildroot] [git commit] Update for 2020.08
Message-ID: <20200901203633.71A94875AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2766f346195dec29b53bc09f6038193998ea3693
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 12 ++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9014ef7b02..fc51a0d0c9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,15 @@
+2020.08, released September 1st, 2020
+
+	Various fixes.
+
+	Updated/fixed packages: am33x-cm3, avahi, bluez-tools,
+	busybox, chocolate-doom, collectd, dhcp, docker-cli, domoticz,
+	gobject-introspection, graphite2, haproxy, ibm-sw-tpm2,
+	imagemagick, libeXosip2, libressl, lxc, mbedtls, menu-cache,
+	mongodb, mosquitto, nvidia-driver, paho-mqtt-c, pixz,
+	postgresql, python-django, rtty, squid, stress-ng, systemd,
+	trousers, uclibc, wireshark, wolfssl, zbar
+
 2020.08-rc3, released August 28th, 2020
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index cb1f5fb0b0..a6b99d0868 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.08-rc3
+export BR2_VERSION := 2020.08
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1598649000
+BR2_VERSION_EPOCH = 1598992000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index b1a970839f..b6a409b8c8 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,40 +42,40 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2020.05.2</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2020.08</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.05.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.08.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.05.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.08.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2020.05.2.tar.gz">buildroot-2020.05.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2020.05.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.08.tar.gz">buildroot-2020.08.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2020.08.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.05.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.08.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.05.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2020.08.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.05.2.tar.bz2">buildroot-2020.05.2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2020.05.2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2020.08.tar.bz2">buildroot-2020.08.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2020.08.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2020.08-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2020.08-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 8986bafbee..2b4a79013a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2020.08 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 September 2020</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2020.08 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.08">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2020.08.tar.bz2">2020.08 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index bbb66a5c24..53f6012f6e 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.02'
+RELEASE='2020.08'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
