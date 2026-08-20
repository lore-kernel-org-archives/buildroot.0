Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E0EC5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00FC681AEA;
	Fri, 21 Aug 2026 15:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpG2ZDJxFyGK; Fri, 21 Aug 2026 15:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325113;
	bh=FCKEpfFONL7/HYWVLiHCCjRWuOd+apNBZt9S3n3vgXQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B81mlr++VycWfTlgCVJWCDWs+nhN5m48hlogHL0kKSHf+/llcMYhDirRlHMJYNbFH
	 l0qBDgqoJ5O+/0tO8RmIyx52n05W+UkL4iHHxbSBIEfnwg4fg7/QDMRjOCIrlLYpqm
	 pseg+2PjpKM3A5mhmFyToreE4NRe5KQHQ4UnZbAh0SGf+Fb1PF9CtXri4XBLBrT1VK
	 lsOY2PMacaRwkX55g6lYKPFOHRokfUQiF22DrHZeEo0Sh4/zM1FEdLHKMKLUHlyBsV
	 3QGF6eeUMs5AqAEvt3kNYmUC11iT2Hdkntiottf2heUbqzgFmozE/2t90cl9JD41sa
	 LYOmAVmLdq1nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 184BB81A73;
	Fri, 21 Aug 2026 15:11:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 604B41F4B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 523F26063E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQ7UMyTv1p58 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFCD960666
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E3988E132; Fri, 21 Aug 2026 15:10:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 13:55:32 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 8594183fb5a356f2f5605eb169f9abbdd8acc6fe
X-Git-Newrev: 5ba2541ddd5614b0d1777320f69908f6435e0b81
X-Patchwork-Hint: ignore
Message-Id: <20260821151017.2E3988E132@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/cantarell: update
 project URL
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ba2541ddd5614b0d1777320f69908f6435e0b81
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project website instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9a7cd39c5d8ec804711a9485f9c360317060e2b8)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/cantarell/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cantarell/Config.in b/package/cantarell/Config.in
index 78af96d595..2dfec0889c 100644
--- a/package/cantarell/Config.in
+++ b/package/cantarell/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_CANTARELL
 	  The Cantarell font family is a contemporary Humanist
 	  sans serif designed for on-screen reading.
 
-	  https://wiki.gnome.org/Projects/CantarellFonts
+	  https://cantarell.gnome.org/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
