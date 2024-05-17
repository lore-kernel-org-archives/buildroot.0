Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B147C25B7A
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 15:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A1E6823AB;
	Fri, 17 May 2024 15:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwxrCGVfxk2K; Fri, 17 May 2024 15:39:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6876881E4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6876881E4D;
	Fri, 17 May 2024 15:39:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E129E1BF2FA
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 15:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB46B823AB
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 15:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gfp8XryN5Aw2 for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 15:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 225148238E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 225148238E
 for <buildroot@buildroot.org>; Fri, 17 May 2024 15:39:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E3CE8746B; Fri, 17 May 2024 15:39:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 17:38:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25991c843c3fc3fd1a93a49511960f4eada3d38c
X-Git-Newrev: 51fe7536c0089bac5e3a7091852036a0024be534
X-Patchwork-Hint: ignore
Message-Id: <20240517153946.0E3CE8746B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quota: Update DEVELOPERS address
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=51fe7536c0089bac5e3a7091852036a0024be534
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a9deddb343..52c9b84a9d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1518,7 +1518,7 @@ F:	package/zip/
 N:	Jared Bents <jared.bents@rockwellcollins.com>
 F:	package/libvirt/
 
-N:	Jarkko Sakkinen <jarkko.sakkinen@intel.com>
+N:	Jarkko Sakkinen <jarkko@kernel.org>
 F:	package/quota/
 
 N:	Jason Pruitt <jrspruitt@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
