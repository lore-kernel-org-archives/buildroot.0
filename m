Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7FBC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7012F70939;
	Mon, 19 May 2025 10:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzWAtzxbzSws; Mon, 19 May 2025 10:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9534670948
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9534670948;
	Mon, 19 May 2025 10:55:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF94193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AE9C40E3F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPTVPdrhnIMW for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C1EF4127D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C1EF4127D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A6DC8348A; Mon, 19 May 2025 10:39:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 23:38:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: af34a630d0be0581043212e423cdbb0f4224e515
X-Git-Newrev: 87d5d63983cb8fb967cebcf0c82b107efbb9506c
X-Patchwork-Hint: ignore
Message-Id: <20250519103956.2A6DC8348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/website/news.html: Update
 for 2024.02.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=87d5d63983cb8fb967cebcf0c82b107efbb9506c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/news.html | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index 0f9d56dd83..305bb86418 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -13,7 +13,29 @@
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
       <div class="timeline-heading">
-	<h4 class="timeline-title">2024.11.3 released, 2024.11.x series EOL</h4>
+	<h4 class="timeline-title">2024.02.13 released, 2024.02.x series EOL</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 April 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2024.02.13 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2024.02.12 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2024.02.13/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/4a1839ca-f072-4529-bbf7-1e47e8e9a9f2@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.02.13.tar.xz">2024.02.13 release</a>.</p>
+
+	  <p>Notice that the 2024.02.x series is now end of life. Please migrate to
+	  the 2025.02.x series instead.</p>
+      </div>
+    </div>
+  </li>
+
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.11.4 released, 2024.11.x series EOL</h4>
 	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 April 2025</small></p>
       </div>
       <div class="timeline-body">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
