Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A39CD98D2
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 21:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D01FD6F551;
	Tue, 16 Jun 2026 21:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bSusCJrusct; Tue, 16 Jun 2026 21:10:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 807F66F55F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781644255;
	bh=XMztfD3ZkeeoohvPt34nczTMzXWCzpK0DRBQaH77V+U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WtzysTZaczze7qq9YCtnCU0XeXmccOdf1o2JnhMZp3AnnigSyF3oahjknc5dOoakj
	 3/eLOEkf3QZdAAxJzORqE3lNb/2Qo4UltMufhX9FUsbWgs+4nTYDNb4wEC1aqImG9M
	 Ew+wsGf6uBGic+lJzs4yQfiYlSLeV/ZttqyE+StabDsaUaM7LVR9hhzp/hIq+pPx6N
	 zlVwY6hYpSMbaSBw49zgwaHfjshpPhXq61cNAQBhGgset/Y4dczM1eFyD2nsEtOiV9
	 K6wYx7OItsTs5ebV8j+gOIgfTM/EHtCvJAz82jd1demNyRQZKGIVlER7hDVeamB5DS
	 du/WBB5M68utA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 807F66F55F;
	Tue, 16 Jun 2026 21:10:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D148347
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EAF542CC5
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUZSOGLMiKzh for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 21:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80CA342B20
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80CA342B20
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:10:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1590580F43; Tue, 16 Jun 2026 21:10:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 23:09:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cd9188c3e1309b178863b5239e08ee2564911cd
X-Git-Newrev: ced5db1f775bcc87f377837ec2b4ff9ad98da0e9
X-Patchwork-Hint: ignore
Message-Id: <20260616211032.1590580F43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update news.html and download.html for
 2026.02.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ced5db1f775bcc87f377837ec2b4ff9ad98da0e9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 26 ++++++++++++++++++++++++++
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/docs/website/download.html b/docs/website/download.html
index e2762f01af..8066793ce1 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -70,6 +70,32 @@
             <a href="/downloads/buildroot-2026.05.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
+        <tr>
+          <th>Old stable (EOL)</th>
+          <th>2026.02.x</th>
+          <td>June 2026</td>
+          <td>
+            2026.02.3<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.3/CHANGES">
+              Changelog
+            </a>
+          </td>
+          <td>2026-06-16</td>
+          <td>
+            <a href="/downloads/buildroot-2026.02.3.tar.gz">
+              <img src="images/zip.png" width="24" alt="">
+              .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-2026.02.3.tar.gz.sign">[PGP sig]</a>
+          </td>
+          <td>
+            <a href="/downloads/buildroot-2026.02.3.tar.xz">
+              <img src="images/package.png" width="24" alt="">
+              .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-2026.02.3.tar.xz.sign">[PGP sig]</a>
+          </td>
+        </tr>
         <tr>
           <th>Long-term support</th>
           <th>2025.02.x</th>
diff --git a/docs/website/news.html b/docs/website/news.html
index e7cb6b893b..25535bee1c 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.02.3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 June 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2026.02.3 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2026.02.2 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.3/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/buildroot-2026.02.3-announce-1781643865@buildroot.org/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.02.3.tar.xz">2026.02.3 release</a>.</p>
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
