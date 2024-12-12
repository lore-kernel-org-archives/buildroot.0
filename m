Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41A8E7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BECC70374;
	Thu, 12 Dec 2024 21:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c33Yv91bQR_c; Thu, 12 Dec 2024 21:33:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BAFD70382
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BAFD70382;
	Thu, 12 Dec 2024 21:33:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 055321146
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46A6341EA6
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9dkG0TrRHYF for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 691D441981
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 691D441981
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5304F86ED4; Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 21:07:15 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e39cad09150e06ca4513c06567fafed5da31d776
X-Git-Newrev: 38ac87a6906ab0ec11acd4ae4f7d04350b192b27
X-Patchwork-Hint: ignore
Message-Id: <20241212213337.5304F86ED4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/autoconf: fix
 'uncommitted' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=38ac87a6906ab0ec11acd4ae4f7d04350b192b27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fa1a6177dd092f2bc614d8f491ff6890952233eb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/autoconf/0001-dont-add-dirty-to-version.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/autoconf/0001-dont-add-dirty-to-version.patch b/package/autoconf/0001-dont-add-dirty-to-version.patch
index 8df2276865..a1a50d2838 100644
--- a/package/autoconf/0001-dont-add-dirty-to-version.patch
+++ b/package/autoconf/0001-dont-add-dirty-to-version.patch
@@ -1,7 +1,7 @@
 autoconf: don't append -dirty to version
 
 Don't append -dirty to autoconf version number if the buildroot git tree
-has uncommited changes.
+has uncommitted changes.
 
 This script is meant for the autoconf developers, but it also activates
 if you build autoconf in a subdirectory of a git tree (E.G. like how it's
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
