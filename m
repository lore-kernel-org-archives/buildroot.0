Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4B2C5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 18:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A584880C4D;
	Mon, 24 Aug 2026 18:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1l_V5fmO1Bty; Mon, 24 Aug 2026 18:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787597572;
	bh=74TQU6jn7QlmEjXBsMkSZRPqJMKpyVlmtUxEDnlU1TE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R+Ww4lwne2dg1xJJqOYR9r8HoxNgIrvt/gprnJ3mb+1Rclt8WhyRrv7h+joVNXSG9
	 XQgHudTt9vzXkUnV4DZLxzCvX/ps0jd3v0J6W6uG73G0nx0WaZN1McOlgExtbdK7ZU
	 8P8i7nLCy7IwWOl4VXd1kISDrgG1j1fmfl0YsZ7MjlFSZdjqRh+dKt85uDp0DnOPTR
	 x23d7DoKuQVo35RO+4psFxN8osgYy7z1WBTTxvXUv7gWYzrTeL0kF2RHgXIiBh/n7x
	 KFFMRU2PSoAp5GeOXNHuULWRHdEjYBXrEoqWBbjUmPhn0uTnzzUwW9jocYjTT6EzPi
	 RltB5TAew9KFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1884880C44;
	Mon, 24 Aug 2026 18:52:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D239E4B8
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 18:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6F2380C44
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 18:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsvh_fUW6ny4 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 18:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3F7880C43
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 18:52:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92BC18FC81; Mon, 24 Aug 2026 18:51:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Aug 2026 20:51:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70f762ea6e45f5433268c4cbe0879de85e17f908
X-Git-Newrev: 087a15f578823206ead71b791ea4d299af96ed38
X-Patchwork-Hint: ignore
Message-Id: <20260824185154.92BC18FC81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/lts: update release wording
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/087a15f578823206ead71b791ea4d299af96ed38
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the release wording to align with the documentation.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/lts.html | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/website/lts.html b/docs/website/lts.html
index 8384d3a88b..caa9344f4a 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -80,7 +80,7 @@
             </h2>
             <p class="br-lts-item-text">
             Vulnerability fixes applied to the <code>master</code> branch will be
-            prioritized for backporting to the LTS & stable branches.
+            prioritized for backporting to stable branches.
             </p>
         </div>
     </div>
@@ -98,9 +98,9 @@
     <br/>
     To address these requirements, the release model evolves into the following.
     <br/>
-    The LTS releases are now extended for a 3-year period. An LTS release
-    is started every 2 years.
-    In between, stable releases are made every 3 months.
+    Starting with 2025.02, the first release of every odd-numbered year is a long-term
+    support (LTS) release supported for three years.
+    In between, non-LTS releases are made every 3 months.
     </p>
 
     <br/>
@@ -328,7 +328,7 @@
                 To make sure the packages of interest to the sponsors don't
                 include regressions between releases.
                 Sponsors may submit a list of packages to be tested
-                before an LTS & stable release.
+                before a bugfix release.
             </p>
         </div>
     </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
