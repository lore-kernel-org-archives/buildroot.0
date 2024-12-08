Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5A8E77180
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 20:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75AC060610;
	Sun,  8 Dec 2024 20:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ghba1n83aCKu; Sun,  8 Dec 2024 20:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 727B6606A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 727B6606A2;
	Sun,  8 Dec 2024 20:14:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0764EED7
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 20:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9798403B3
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 20:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DB1GSDddkjp for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 20:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8412403BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8412403BE
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 20:13:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B47CB82189; Sun,  8 Dec 2024 20:13:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Dec 2024 21:12:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8111f065312c1f0b16aaae3c38238d27c6ade80
X-Git-Newrev: eb24a208f774a2f4eab59a327899ad7b0519a853
X-Patchwork-Hint: ignore
Message-Id: <20241208201354.B47CB82189@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: Update for 2024.08.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb24a208f774a2f4eab59a327899ad7b0519a853
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index bf48b626a0..ac014041b2 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.08.3 released, 2024.08.x series EOL</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 December 2024</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2024.08.3 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2024.08.2 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.3/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/874j3e17ek.fsf@dell.be.48ers.dk/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.08.3.tar.xz">2024.08.3 release</a>.</p>
+
+	  <p>Notice that the 2024.08.x series is now end of life. Please migrate to
+	  the 2024.11.x series instead.</p>
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
