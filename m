Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0057C5DF95
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 999D4812FB;
	Fri, 21 Aug 2026 15:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XnZlLQ0ZQA03; Fri, 21 Aug 2026 15:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324872;
	bh=lMOEYHPh+v62Mavo3j9g3ZVBjwarsjpRpH1bAc8EgfM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fvlYFhhmyB7MIIKu4PBmgf1LW+JrgBTIMLbvlCHxXALh1ph53l7r10jEO0azQtWeJ
	 yzHJ4/Fl4WgO0CgeKokIyFXJ/Kz4lj+dx7OueOlEJJU4dKojSbzFpPZ5XFrvIIAsKI
	 2ICfeJ8zzYBzmSwfi33f0KWgywmjZd3iDXbGolKRGREHj+bAVPHamjR7j0YCpsalPg
	 VKXaHI15ieuh9ypCoYKig82pOwqglygtYJhmLVFGMT9Ix6dMa6BPEDp5LIDVuGh/se
	 xeqmV0svo8xAjK9v+OrQnpJXfiADIfJU1S/fH7kahJmdDLvLKFcKpt5meMa6DcSzm7
	 /N+UbiEEDB3Yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A262812F2;
	Fri, 21 Aug 2026 15:07:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5C4CEA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B84B8403D9
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHgbKWCu2Z9G for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4462440026
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8AD58E0EC; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 29799095b02617ce79a56b0998285504705f21d5
X-Git-Newrev: 3db0c3ae948e1dc974c72a84743b09f96c5f0a17
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.B8AD58E0EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cantarell: update
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3db0c3ae948e1dc974c72a84743b09f96c5f0a17
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
