Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F2CC61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 20:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D2098217D;
	Mon,  9 Jun 2025 20:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kGY-36Th3DX; Mon,  9 Jun 2025 20:22:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51CD182184
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51CD182184;
	Mon,  9 Jun 2025 20:22:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 145951F2
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 20:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE8BC82184
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 20:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Xu01OKXpvvg for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 20:22:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0399E8217D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0399E8217D
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 20:22:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0D3487B42; Mon,  9 Jun 2025 20:22:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 22:21:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34611327b8585178b7ff148b57397b4557e7455a
X-Git-Newrev: fcde5363aa35220a1f201159a05de652ec6f811f
X-Patchwork-Hint: ignore
Message-Id: <20250609202218.F0D3487B42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] pdate for 2025.05
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=fcde5363aa35220a1f201159a05de652ec6f811f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 12 ++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 26 +++++++++++++-------------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index aff62f7a68..808d62df8d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,15 @@
+2025.05, released June 9th, 2025
+
+	Various fixes.
+
+	Updated/fixed packages: armadillo, busybox, dhcpcd, dovecot,
+	easyframes, exim, ghostscript, go, gst1-plugins-bad, iputils,
+	jq, libcurl, libftdi1, libglib2, lm-sensors,
+	mender-update-modules, mesa3d, mongoose, mpd, ninja, podman,
+	python-django, python-gobject, qoriq-mc-utils, qt5declarative,
+	qt5webengine, qt5webengine-chromium, qt6base, qt6tools, redis,
+	rtl8723ds, spirv-llvm-translator, unzip, yasm
+
 2025.05-rc2, released May 28th, 2025
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index f90b834ed2..a0ad100980 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.05-rc2
+export BR2_VERSION := 2025.05
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1748462400
+BR2_VERSION_EPOCH = 1749500000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 5a2af8aff2..efabe51a31 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,7 +8,7 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable / long term support release: <b>2025.02.3</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2025.02.3</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -41,41 +41,41 @@
 	  <p><a href="/downloads/buildroot-2025.02.3.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest stable release: <b>2024.11.2</b></h3>
+
+      <h3 style="text-align: center;">Latest stable release: <b>2025.05</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.11.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.11.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2024.11.2.tar.gz">buildroot-2024.11.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.11.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.05.tar.gz">buildroot-2025.05.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.05.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.11.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.05.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.11.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.05.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.11.2.tar.xz">buildroot-2024.11.2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.11.2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.05.tar.xz">buildroot-2025.05.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.05.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2025.05-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2025.05-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index dfc10020ad..0201699f21 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.05 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 June 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2025.05 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/CHANGES">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.05.tar.xz">2025.05 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 6c1cdf204a..75a9d2feb1 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2025.02'
+RELEASE='2025.05'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
