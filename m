Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDACAC5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65F8281B04;
	Fri, 21 Aug 2026 15:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9NyK1qRE_FG; Fri, 21 Aug 2026 15:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325117;
	bh=Gps4RJztoz72kjQrBreUeoMsoMXGTd4FEPYO6LhaR/4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jx2si5EIekttFPUrvjhjnSKb95EmQ4Qv81sQi2LInn5DpadRFp+qb01GhbkUPpwRz
	 IkA4gjBEh4SqKMjyw8OKcAvj28YIh6sy3EwMCkGgGGP4PXHDojYBZLBhg7Q4eQzbRp
	 l6psXmnANKAc3Jiy0pQRdS0/Qo7qXw5QZFawH0R0vR+hh3q8TL2wYiAdXTR/davXIi
	 cJr2EXnBEWen0nt5nrHHnP3mxKh8Qqxq9d4ks2jQdwP9TRnE36EXi7IXwMW2i/EKzM
	 o45FZlbpyLlyMiOgKH1B2lUVQ6LVt6AHj7SKea1DokCodnaiaGXOBvsmKug/KP7Sal
	 7KxCKwUNzXcqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 841D181BB0;
	Fri, 21 Aug 2026 15:11:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83F7A1F4B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8184C81138
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNodfNWKoH2Z for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBFE981134
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3ECF18DE49; Fri, 21 Aug 2026 15:10:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 13:55:41 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 5ba2541ddd5614b0d1777320f69908f6435e0b81
X-Git-Newrev: 6f5e5881005d53439b9b19bece0555294916f8c4
X-Patchwork-Hint: ignore
Message-Id: <20260821151017.3ECF18DE49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/rygel: update
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f5e5881005d53439b9b19bece0555294916f8c4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project website instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 949063f92b3b492e731f856cd513fb9251c60ddf)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/rygel/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rygel/Config.in b/package/rygel/Config.in
index a3c2bd29da..1a5c1493ea 100644
--- a/package/rygel/Config.in
+++ b/package/rygel/Config.in
@@ -34,7 +34,7 @@ config BR2_PACKAGE_RYGEL
 	  Most Rygel functionality is implemented through a plug-in
 	  mechanism.
 
-	  https://wiki.gnome.org/Projects/Rygel
+	  https://rygel-project.org/
 
 if BR2_PACKAGE_RYGEL
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
