Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF124C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 22:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5721F60EAF;
	Tue, 12 Apr 2022 22:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjbhYwlp3VXc; Tue, 12 Apr 2022 22:13:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A22260EE4;
	Tue, 12 Apr 2022 22:13:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BCD21BF3E9
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 22:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BD2C80D5A
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 22:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vNNTxuhSiboZ for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 22:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A3E883EF7
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 22:13:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0AD1583BD5; Tue, 12 Apr 2022 22:03:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 00:13:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11b6b65d509c24e41af5ce0da941556fb10354fc
X-Git-Newrev: 1b718adee4bea908a5d810e74e6e3a83379d2ee4
X-Patchwork-Hint: ignore
Message-Id: <20220412220344.0AD1583BD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: update for 2022.02.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b718adee4bea908a5d810e74e6e3a83379d2ee4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |  2 +-
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 19 +++++++++++++++++++
 3 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index 12df66916c..1658db4cce 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,7 +21,7 @@
 	gst1-devtools, gst1-libav, gst1-plugins-bad,
 	gst1-plugins-base, gst1-plugins-good, gst1-plugins-ugly,
 	gst1-python, gst1-rtsp-server, gst1-vaapi, gstreamer1,
-	gstreamer1-editing-services, haproxym htop, intel-gmmlib,
+	gstreamer1-editing-services, haproxy, htop, intel-gmmlib,
 	ipmiutil, iwd, jack1, jack2, lftp, libabseil-cpp, libbluray,
 	libcamera-apps, libcoap, libcurl, libest, libgee, libglib2,
 	libgtk3, libiec61850, libkrb5, libminiupnpc, libodb,
diff --git a/docs/website/download.html b/docs/website/download.html
index 18a9254cbf..7cbf882f96 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,37 +8,37 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable / long term support release: <b>2022.02</b></h3>
+      <h3 style="text-align: center;">Latest stable / long term support release: <b>2022.02.1</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2022.02.tar.gz">buildroot-2022.02.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.02.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.02.1.tar.gz">buildroot-2022.02.1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.02.1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.02.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02.1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.02.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02.1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.02.tar.xz">buildroot-2022.02.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.02.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.02.1.tar.xz">buildroot-2022.02.1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.02.1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 <!--
diff --git a/docs/website/news.html b/docs/website/news.html
index 8f9f7d7fb3..1e39c4d910 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2022.02.1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 April 2022</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2022.02.1 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2022.02 release. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.02.1">CHANGES</a>
+	  file for more details, read the
+	  <a href="http://lists.busybox.net/pipermail/buildroot/2022-April/640712.html">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2022.02.1.tar.xz">2022.02.1 release</a>.</p>
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
