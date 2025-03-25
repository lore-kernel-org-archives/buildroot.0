Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B711C36008
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 08:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ACA882CB7;
	Tue, 25 Mar 2025 08:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBBIhJIQCdZ1; Tue, 25 Mar 2025 08:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4522F82C04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4522F82C04;
	Tue, 25 Mar 2025 08:47:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57C24C0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 08:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4116C40B66
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 08:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsHOK7dLtZ6N for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 08:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76ED840B5A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76ED840B5A
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 08:47:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 660AC828DB; Tue, 25 Mar 2025 08:47:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Mar 2025 09:46:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38a3ddda93dd55b3e12a45a371fba35c1a03c225
X-Git-Newrev: b4d259727e16a4a3352a20c085f787c783c9f53c
X-Patchwork-Hint: ignore
Message-Id: <20250325084711.660AC828DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: Update for 2024.02.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4d259727e16a4a3352a20c085f787c783c9f53c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 9e650265ff..a1c6078d2e 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,28 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.02.12 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 March 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2024.02.12 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2024.02.11 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2024.02.12/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/87r02l4krc.fsf@dell.be.48ers.dk/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.02.12.tar.xz">2024.02.12 release</a>.</p>
+
+          <p>Notice that the 2024.02.x series will soon be end of life. Please migrate to
+	  the 2025.02.x series instead.</p>
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
