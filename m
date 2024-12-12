Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753F5E77180
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42F6A84458;
	Thu, 12 Dec 2024 21:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5Tl5tjqXwWx; Thu, 12 Dec 2024 21:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44C3984A5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44C3984A5F;
	Thu, 12 Dec 2024 21:33:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 251541146
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C43684A92
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPKGRVcqkBuF for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DF9784942
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DF9784942
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C54A86ED6; Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 21:07:16 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 38ac87a6906ab0ec11acd4ae4f7d04350b192b27
X-Git-Newrev: 50a362afac9b2c2c3db691b4309c28faefef03fe
X-Patchwork-Hint: ignore
Message-Id: <20241212213337.5C54A86ED6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/dmraid: fix
 'maintenance' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=50a362afac9b2c2c3db691b4309c28faefef03fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a268afeb656109c89e06f08d23d389c658b254f7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmraid/0001-fix-compilation-under-musl.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dmraid/0001-fix-compilation-under-musl.patch b/package/dmraid/0001-fix-compilation-under-musl.patch
index a6f5c41075..3d45641b8d 100644
--- a/package/dmraid/0001-fix-compilation-under-musl.patch
+++ b/package/dmraid/0001-fix-compilation-under-musl.patch
@@ -8,7 +8,7 @@ Patch borrowed from Void Linux :
 https://github.com/voidlinux/void-packages/blob/master/srcpkgs/dmraid/patches/25_musl-libc.patch
 
 Upstream package appears dormant, no mailing list and no
-maintainence releases since Nov 2010.
+maintenance releases since Nov 2010.
 
 Upstream-Status: dormant
 Signed-off-by: Brendan Heading <brendanheading@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
