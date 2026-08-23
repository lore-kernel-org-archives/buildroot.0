Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557F7C5DF8C
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 21:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14873605FD;
	Sun, 23 Aug 2026 21:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60CKt18uVArz; Sun, 23 Aug 2026 21:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787519195;
	bh=xFy8g9GWI9j0aQLPsggbmKbp55ta7i+RPuprOHrqvzA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Hl1yOi0k5oe0BV3LZrfDASf/1ztKrxfaHKBeLWiU4LwR0tl+9T9V7JwnOxKU7IgTl
	 OFcKzycQkGRvu4UGo0RgjOoZ5V+71hK7KxatZL2SVbZ6zala7u6OPhhEMl2eDwqm9K
	 IpcoUZ3zVcfmwYf6J8yZ5xkkZlNxosUUfGtSpudeTzEjy/rJnm8FF9+AgEUpIeh3Qu
	 MubzNhe7Plg37Z27+T1/yVYatRGCGG9XFjUqzB2Ol1ZCqOQ/pFsFcrI/yQ6/vIaMXo
	 Js3CE0SFbN4p54NXsHu+4Epr1kx+DoXtSLf8eduXwusfv/wmCxveakunV+p9RaD8Gr
	 KuAy0YZOwfYMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 561DB60608;
	Sun, 23 Aug 2026 21:06:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FE513DA
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 056E440634
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xUne5bVTWYy for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 21:06:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EAAE4055B
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:06:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A14218EBFE; Sun, 23 Aug 2026 21:05:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 23:05:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 157342931ba3ffcd46e153f9fa81af078320c749
X-Git-Newrev: 312dd92bcdd35ad2d98c3679762a8e500566bb49
X-Patchwork-Hint: ignore
Message-Id: <20260823210538.A14218EBFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update news.html and download.html for
 2026.05.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/312dd92bcdd35ad2d98c3679762a8e500566bb49
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 16 ++++++++--------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 4642865441..9ed1ef6590 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -44,28 +44,28 @@
         </tr>
         <tr>
           <th>Stable</th>
-          <th>2026.05.1.x</th>
+          <th>2026.05.x</th>
           <td>September 2026</td>
           <td>
-            2026.05.1<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.1/CHANGES">
+            2026.05.2<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.2/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-07-15</td>
+          <td>2026-08-23</td>
           <td>
-            <a href="/downloads/buildroot-2026.05.1.tar.gz">
+            <a href="/downloads/buildroot-2026.05.2.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05.1.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05.2.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.05.1.tar.xz">
+            <a href="/downloads/buildroot-2026.05.2.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05.1.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05.2.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index 135874c1b1..efb1d0693d 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.05.2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 August 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2026.05.2 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2026.05.1 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.2/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/buildroot-2026.05.2-announce-1787518882@buildroot.org/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.05.2.tar.xz">2026.05.2 release</a>.</p>
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
