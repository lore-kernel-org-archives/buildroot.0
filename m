Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA5DC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B74D7709C9;
	Mon, 19 May 2025 10:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZHI5nCPv2I5; Mon, 19 May 2025 10:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFB53709CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFB53709CB;
	Mon, 19 May 2025 10:55:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02CC1D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BE6C40D62
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fH7ePABrbZcU for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 117AD40E22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 117AD40E22
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DD54873D5; Mon, 19 May 2025 10:39:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 23:24:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d65ceed345089383b6af2d0b32c4dcab4a2998d2
X-Git-Newrev: 3ea8757fa59c0c9112b16ec1b20eaaf24c9c9c34
X-Patchwork-Hint: ignore
Message-Id: <20250519103956.0DD54873D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/website/news.html: Update
 for 2024.11.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ea8757fa59c0c9112b16ec1b20eaaf24c9c9c34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/news.html | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index a1c6078d2e..0f9d56dd83 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.11.3 released, 2024.11.x series EOL</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 April 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2024.11.4 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2024.11.3 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11.4/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/b42bf2fb-b533-43b9-bbf7-bfdaae144b54@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.11.4.tar.xz">2024.11.4 release</a>.</p>
+
+	  <p>Notice that the 2024.11.x series is now end of life. Please migrate to
+	  the 2025.02.x series instead.</p>
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
