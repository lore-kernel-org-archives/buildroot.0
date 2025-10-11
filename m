Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9359ECCD184
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EEBC405F0;
	Sat, 11 Oct 2025 21:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEySMszbthP1; Sat, 11 Oct 2025 21:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54864405FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54864405FB;
	Sat, 11 Oct 2025 21:47:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36858195
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D355405FD
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPvsgTWo3rnH for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 21:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 300C8405F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 300C8405F0
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:47:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2126787063; Sat, 11 Oct 2025 21:47:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Oct 2025 23:46:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dba52585ab91e2f00350aad6c52c6e8b325aa9e7
X-Git-Newrev: e5501d7b1a98c1e760f7569472d01491b21ffefa
X-Patchwork-Hint: ignore
Message-Id: <20251011214721.2126787063@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/{download,
 news}.html: update for 2025.02.7, 2025.05.3 and 2025.08.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e5501d7b1a98c1e760f7569472d01491b21ffefa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 36 ++++++++++++++--------------
 docs/website/news.html     | 58 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 18 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 614a763951..5bb7cf6987 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -49,50 +49,50 @@
           <th>2025.08.x</th>
           <td>December 2025</td>
           <td>
-            2025.08<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08/CHANGES">
+            2025.08.1<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.1/CHANGES">
               Changelog
             </a>
           </td>
           <td>2025-09-07</td>
           <td>
-            <a href="/downloads/buildroot-2025.08.tar.gz">
+            <a href="/downloads/buildroot-2025.08.1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.08.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.08.1.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.08.tar.xz">
+            <a href="/downloads/buildroot-2025.08.1.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.08.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.08.1.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
           <th>Stable</th>
           <th>2025.05.x</th>
           <td>September 2025</td>
           <td>
-            2025.05.2<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05.2/CHANGES">
+            2025.05.3<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05.3/CHANGES">
               Changelog
             </a>
           </td>
           <td>2025-09-09</td>
           <td>
-            <a href="/downloads/buildroot-2025.05.2.tar.gz">
+            <a href="/downloads/buildroot-2025.05.3.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.05.2.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.05.3.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.05.2.tar.xz">
+            <a href="/downloads/buildroot-2025.05.3.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.05.2.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.05.3.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
@@ -100,25 +100,25 @@
           <th>2025.02.x</th>
           <td>March 2028</td>
           <td>
-            2025.02.6<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.6/CHANGES">
+            2025.02.7<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.7/CHANGES">
               Changelog
             </a>
           </td>
           <td>2025-09-09</td>
           <td>
-            <a href="/downloads/buildroot-2025.02.6.tar.gz">
+            <a href="/downloads/buildroot-2025.02.7.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.6.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.7.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.02.6.tar.xz">
+            <a href="/downloads/buildroot-2025.02.7.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.6.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.7.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
       </table>
diff --git a/docs/website/news.html b/docs/website/news.html
index 7276e15eca..dd290c33fc 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,64 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.7 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 October 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.7 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.02.6 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.7/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/45aef3ee-9f95-4250-b2b0-dc291fad861b@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.7.tar.xz">2025.02.7 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.05.3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 October 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.05.3 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.05.2 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05.3/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/7bed9b2e-a9d3-476b-84d6-61134e2f726f@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.05.3.tar.xz">2025.05.3 release</a>.
+	  This is the last release of the 2025.05 stable series.</p>
+      </div>
+    </div>
+  </li>
+
+  <li class="timeline">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.08.1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 October 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.08.1 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.08 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.1/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/891a8699-17da-4e43-a300-2a82c61e04c8@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.08.1.tar.xz">2025.08.1 release</a>.</p>
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
