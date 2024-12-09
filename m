Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A1BC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD6742F29;
	Fri, 28 Feb 2025 16:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRq_CYh3NUuO; Fri, 28 Feb 2025 16:36:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7D884F212
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7D884F212;
	Fri, 28 Feb 2025 16:36:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13FD168
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 614DE4249C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6KS7sJPPMXt for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 768BF419AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 768BF419AD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CD08844AB; Fri, 28 Feb 2025 16:29:34 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Dec 2024 23:33:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fa1a6177dd092f2bc614d8f491ff6890952233eb
X-Git-Newrev: a268afeb656109c89e06f08d23d389c658b254f7
X-Patchwork-Hint: ignore
Message-Id: <20250228162934.6CD08844AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dmraid: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=a268afeb656109c89e06f08d23d389c658b254f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
