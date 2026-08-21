Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4E7C5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B934A811C7;
	Fri, 21 Aug 2026 15:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxmhVq5wenF5; Fri, 21 Aug 2026 15:08:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324884;
	bh=hVd6BElN0XJux3Ga8uKbFI3WfB4dJFBceHnadR4J2II=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Hfm97Q/yj6vECgKyTh93kGRkt6p/gkOaTocfCv6BUdG05MOe62Ge1XEmho4rgGZh6
	 p8Hh31UuEpiKcC5YU9RaKHcx/bSb6ou0ajTpvJ3LEJO1Go+iHGyGzjABHvCHjb+sLH
	 JT3rH8KuwfDBWHcbIPdEgoGgCFzLP8Mp5s2CA0upAw2P94jazm8CUGjzR+UfG3WdDc
	 HuYr7ay/hPMaBmZ+2lwJegb0pdFMkfLcUOOHiGGoLcCNhnMl82tmHjPg3jmLjRWgDp
	 HmgGJnJSHPquWGQW7b0V+HjImS+Uk7VfSZE2A59IOCxRevbb9csOj9ow2W6QlF0sdE
	 FDndtZVWVozBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00F8F8134F;
	Fri, 21 Aug 2026 15:08:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0301A201A
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB244403D9
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXHC8WtuSc8b for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EFD34004E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C12688E127; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3db0c3ae948e1dc974c72a84743b09f96c5f0a17
X-Git-Newrev: 9812a9f41074577c5c8c6f95c81cc69568181347
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.C12688E127@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rygel: update
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9812a9f41074577c5c8c6f95c81cc69568181347
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
