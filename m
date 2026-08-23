Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B89C5DF8C
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 20:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98F9D80B03;
	Sun, 23 Aug 2026 20:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnB1y61kU1I0; Sun, 23 Aug 2026 20:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787518779;
	bh=bhwDh51TVNvyjiglbq3Xa7t5Pco91K8sw9tSkmYhimE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UTXvd5NngwhgPiKqsLfvC1ezKvujEtVF4r35KlCl/OXdeUdY0uouQBBkKy7TdBikw
	 wA3hPR2qE+7/qPDMEJIMgTlfNUNQo7l7j1KeEoPpQUBRtDzb9iH8JbLiwoAIKe6L+V
	 843h0JQfDtdZPTlq4nLbZaplhdxRfAx7EtZr7k4w2DLI29IWOJPgoqvCICwKvhEyDq
	 fSs+wb7MRHVjfTQ0d8QG26O5GjaO5w9A29cLRlvVII/IS989debinqp9hUCbc6PSrW
	 DDFt51sslrhuevXpLEWx1johEVemLGnBbdRVog0k4ZaGepfgmMHq0q3bahWC+5KdXH
	 WH0Cj26mShvTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C324780B19;
	Sun, 23 Aug 2026 20:59:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B9CF2FD
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E687A80B1B
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UeXXrVQH9Gjs for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 20:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D2B780B03
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:59:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86D508F01E; Sun, 23 Aug 2026 20:58:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 22:59:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df9e3f9b30e1343a3642a6421600bdda1eea848d
X-Git-Newrev: 46679da1df040b847e8aed7715a2532e4dcb4d7f
X-Patchwork-Hint: ignore
Message-Id: <20260823205842.86D508F01E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update news.html and download.html for
 2025.02.17
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46679da1df040b847e8aed7715a2532e4dcb4d7f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 14 +++++++-------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index a9a4086f14..4642865441 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -73,25 +73,25 @@
           <th>2025.02.x</th>
           <td>March 2028</td>
           <td>
-            2025.02.16<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.16/CHANGES">
+            2025.02.17<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.17/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-07-15</td>
+          <td>2026-08-23</td>
           <td>
-            <a href="/downloads/buildroot-2025.02.16.tar.gz">
+            <a href="/downloads/buildroot-2025.02.17.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.16.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.17.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.02.16.tar.xz">
+            <a href="/downloads/buildroot-2025.02.17.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.16.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.17.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
       </table>
diff --git a/docs/website/news.html b/docs/website/news.html
index 1fd87815eb..135874c1b1 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.17 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 August 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.17 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.02.16 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.17/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/buildroot-2025.02.17-announce-1787518716@buildroot.org/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.17.tar.xz">2025.02.17 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
