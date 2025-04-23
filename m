Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C529C369D3
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 07:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E57DC829FE;
	Wed, 23 Apr 2025 07:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2ypUvZErJWt; Wed, 23 Apr 2025 07:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A3A282A28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A3A282A28;
	Wed, 23 Apr 2025 07:06:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 729E719F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 07:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 582FF610C1
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 07:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4d79E3OF6Lsu for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 07:06:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D6F560857
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D6F560857
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 07:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D264861D6; Wed, 23 Apr 2025 07:06:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Apr 2025 08:59:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2f5f519ece82257e760e1470f3b0674cedd77a8
X-Git-Newrev: b459253bbfc7d93e9fface5668b00e676f13e51c
X-Patchwork-Hint: ignore
Message-Id: <20250423070608.6D264861D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: correct left/right
 for 2024.02.13 entry
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

commit: https://git.buildroot.net/buildroot/commit/?id=b459253bbfc7d93e9fface5668b00e676f13e51c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 2024.02.13 entry should use the timeline-inverted class to get rendered
at the right side of the screen.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index e9efd8ba07..78c033ddb7 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -28,7 +28,7 @@
     </div>
   </li>
 
-  <li>
+  <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
       <div class="timeline-heading">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
