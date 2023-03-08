Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ECAC64EC4
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 21:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC49C81404;
	Wed,  8 Mar 2023 21:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC49C81404
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CnDACSc0fLpO; Wed,  8 Mar 2023 21:54:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C2581F0A;
	Wed,  8 Mar 2023 21:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0C2581F0A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53D0C1BF287
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 21:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DED741873
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 21:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DED741873
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FUAVItWWhZry for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 21:54:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB39E41875
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 21:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB39E41875
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C845C86B0A; Wed,  8 Mar 2023 21:54:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Mar 2023 22:53:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94962a5af8ddc3221e286e688a9cc69ab25d627f
X-Git-Newrev: 50d3883fba99eb5651e5059b5840529a25111ba1
X-Patchwork-Hint: ignore
Message-Id: <20230308215411.C845C86B0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.02-rc3
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

commit: https://git.buildroot.net/buildroot/commit/?id=50d3883fba99eb5651e5059b5840529a25111ba1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 11 +++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index a3de4ba1d7..49cf96a853 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,14 @@
+2023.02-rc3, released March 8th, 2023
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: apr, bash, docker-engine, exfat,
+	exfat-utils, f2fs-tools, gensio, gr-osmosdr, libcurl, libglfw,
+	libolm, libpcap, libpjsip, linux, mender, mpv,
+	multipath-tools, opus, paho-mqtt-c, proftpd, pugixml,
+	pulseaudio, qemu, quazip, quickjs, rtl8189es, rtl8821cu,
+	uacme, uqmi, wpebackend-fdo,
+
 2023.02-rc2, released February 27th, 2023
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 8edc90ac50..3972941328 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.02-rc2
+export BR2_VERSION := 2023.02-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1677516000
+BR2_VERSION_EPOCH = 1678312000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index fa9276a86c..144dae5197 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2023.02-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2023.02-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.02-rc2.tar.gz">buildroot-2023.02-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.02-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.02-rc3.tar.gz">buildroot-2023.02-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.02-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.02-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.02-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.02-rc2.tar.xz">buildroot-2023.02-rc2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.02-rc2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.02-rc3.tar.xz">buildroot-2023.02-rc3.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.02-rc3.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 7486002581..fcd67f3924 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.02-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 March 2023</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2023.02-rc3 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.02-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2023.02-rc3.tar.xz">2023.02-rc3
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
