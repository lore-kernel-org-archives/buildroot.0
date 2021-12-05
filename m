Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B533C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 20:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00B34404CA;
	Sun,  5 Dec 2021 20:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4r5MRUeXn0NY; Sun,  5 Dec 2021 20:00:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39463404AD;
	Sun,  5 Dec 2021 20:00:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C33E71BF383
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 20:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE71C4039A
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 20:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eiELHk4_PkzW for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 20:00:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DC144037F
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 20:00:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 108C5807F3; Sun,  5 Dec 2021 19:55:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 20:59:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60f912e569a9d983a25ec4c8573d7a5a0ce62876
X-Git-Newrev: e6e12337f1874a5a53b42badf3d7fdd258d86a38
X-Patchwork-Hint: ignore
Message-Id: <20211205195526.108C5807F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e6e12337f1874a5a53b42badf3d7fdd258d86a38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 22 ++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 54 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 125a9e05bd..698d5d72a6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,25 @@
+2021.11, released December 5th, 2021
+
+	Various fixes.
+
+	Defconfigs: Grinn chiliboard/liteboard, PC x86-64 bios: Fix
+	build
+
+	Updated/fixed packages: apr, coreutils, diffutils, e2fsprogs,
+	exfat, freeswitch, gnupg, grub2, gstreamer1, guile, heimdal,
+	hiawatha, hplip, icu, janus-gateway,
+	kodi-screensaver-asterwave, kodi-screensaver-cpblobs,
+	kodi-screensaver-matrixtrails, libatomic_ops, libbson, libffi,
+	libgdiplus, libgee, libhtp, libite, libnspr, libnss,
+	libunwind, lynx, mender-grubenv, mkpasswd, motion, mxml,
+	netdata, qemu, samba4, speex, stress-ng, tinydtls, unixodbc,
+	unrar, util-linux, util-linux-libs, watchdogd, wireshark
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14351: needs to mount sysfs before mount -a
+	#14411: 2021.11-rc2: Samba doesn't compile
+
 2021.11-rc3, released November 30th, 2021
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 7b067ac275..74ef7dc598 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.11-rc3
+export BR2_VERSION := 2021.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1638292000
+BR2_VERSION_EPOCH = 1638734000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 97af89672e..be7bb3622e 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,40 +42,40 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2021.08.2</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2021.11</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.08.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.08.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2021.08.2.tar.gz">buildroot-2021.08.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.08.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.11.tar.gz">buildroot-2021.11.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.11.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.08.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.08.2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.08.2.tar.bz2">buildroot-2021.08.2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.08.2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.11.tar.xz">buildroot-2021.11.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.11.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2021.11-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2021.11-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 66ce88c557..783a2dddd0 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.11 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 December 2021</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2021.11 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.11">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.11.tar.xz">2021.11 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 54ee9c8fbe..2bcb59c08b 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.08.2'
+RELEASE='2021.11'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
