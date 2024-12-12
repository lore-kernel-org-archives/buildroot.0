Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12272E77180
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2B2380DE7;
	Thu, 12 Dec 2024 21:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XApn729ZBL_J; Thu, 12 Dec 2024 21:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6D298443C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6D298443C;
	Thu, 12 Dec 2024 21:33:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22250115A
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF13C80C86
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMVPIN4u4tvB for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25C3E80C48
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25C3E80C48
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21EA786E71; Thu, 12 Dec 2024 21:32:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 22:29:23 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: a28bf703a22f15d7e634d88cb3f6d7d6b9576421
X-Git-Newrev: ed34ff164b4b64cc5636ef810644742ce3d48854
X-Patchwork-Hint: ignore
Message-Id: <20241212213225.21EA786E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/pkg-carco.mk: fix
 'unknown' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed34ff164b4b64cc5636ef810644742ce3d48854
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 86a5b45755fbd1b238426e045982d5e56ad6b9a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index d94a19024e..47a6353f25 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -206,7 +206,7 @@ endif
 
 # Due to vendoring, it is pretty likely that not all licenses are
 # listed in <pkg>_LICENSE. If the license is unset, it is "unknown"
-# so adding unknowns to some unknown is still some other unkown,
+# so adding unknowns to some unknown is still some other unknown,
 # so don't append the blurb in that case.
 ifneq ($$($(2)_LICENSE),)
 $(2)_LICENSE += , vendored dependencies licenses probably not listed
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
