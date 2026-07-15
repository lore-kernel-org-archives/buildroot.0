Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6865FC44501
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 19:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32EE760724;
	Wed, 15 Jul 2026 19:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-SrRFMWAVKm; Wed, 15 Jul 2026 19:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C0676069A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784143891;
	bh=U/A2U99MtBvcOHkZlAzoQnEEG7yEFRVf8xvr6IH87Kc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nMBLxb8US9rlHocYHsTLOaiUSPIf47b6X/5d4sfRU9hMyNfb76jGJoRqtgWcqQT17
	 zt16qYXwUCnZ4FQOLabQUWotKb29Ysbols+hJbuH2RiLYTpGp8B38TuPEt6SIh42Y3
	 Y8h9UdoWWIRRk/fYnZPYVxJma2mZampeh+w3+akMX1c+fpGlsBvgZWhpvYwgW8wwAl
	 9f1Dq7PzarB9Z7k6PT+tD0FcOJhQ7zr3w/CHL8kleLmccJ7YEG4qdabTErFwTUukGl
	 lJ6YgZveWf6ReWKHfYPVhEKwaGhk9FaUdKNGdbEC1mskiXljDqq9yvsui04ToEToLO
	 BDf3Xy1wXdMoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C0676069A;
	Wed, 15 Jul 2026 19:31:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 388AA1F6
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E73840509
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GW9uxQM-JAEh for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 19:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DB62404DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DB62404DC
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:31:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E462588984; Wed, 15 Jul 2026 19:30:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Jul 2026 21:31:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 013c6e52b8858a7573b30f1b8f835faf4286c649
X-Git-Newrev: 810dda599d3f15abe2f28fed472c37f88c516d9d
X-Patchwork-Hint: ignore
Message-Id: <20260715193053.E462588984@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update news.html and download.html for
 2025.02.16
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/810dda599d3f15abe2f28fed472c37f88c516d9d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 14 +++++++-------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 993ade9644..9240f9d714 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -101,25 +101,25 @@
           <th>2025.02.x</th>
           <td>March 2028</td>
           <td>
-            2025.02.15<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.15/CHANGES">
+            2025.02.16<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.16/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-06-16</td>
+          <td>2026-07-15</td>
           <td>
-            <a href="/downloads/buildroot-2025.02.15.tar.gz">
+            <a href="/downloads/buildroot-2025.02.16.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.15.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.16.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.02.15.tar.xz">
+            <a href="/downloads/buildroot-2025.02.16.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.15.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.16.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
       </table>
diff --git a/docs/website/news.html b/docs/website/news.html
index 0bf6d4d4e1..1929ff7f93 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.16 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 July 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.16 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.02.15 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.16/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/buildroot-2025.02.16-announce-1784143832@buildroot.org/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.16.tar.xz">2025.02.16 release</a>.</p>
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
