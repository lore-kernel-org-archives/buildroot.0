Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9A7C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AA4D817F2;
	Fri, 21 Aug 2026 15:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0AO7vLOzekN; Fri, 21 Aug 2026 15:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325101;
	bh=pXjNTGxGF1zPm7J0vwIQULHMGBKheyL3AoH94Pk3PM0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mNhzfAEtwJr+rNDm6V9rGBXGWA/sNoqFEhbvgNN+uw75oVhK/tkAHwE3pHJxzAsVa
	 K8hoGtazDtT02zS+JUZ1CWTBrVUHv4hxYSaaUqgabMX3IisnpShDy3AKeA1l8k8KJN
	 29AVzQowfWTt4xywmQAXEI4hudpU55g/fnVqFgtCoo3/Xy6Ac4m+NcEFY59N6/eqZd
	 TDEYUrq4MufZ+Z9+yWa1lCYOsPf2Io4v78mX3j1yw1dEfBDcgIy0xiJB1nQ/rJ9ln8
	 9fNLmGzUzi24jkV7T9xRZXi5QCCqIh2a+ftF9Ag2G+hW+v0SjTo1beMHx/YKvevU6L
	 woFq6xzenQ6Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92A618176A;
	Fri, 21 Aug 2026 15:11:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3201F4B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E33FE400AB
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOm5ROSElvBq for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 521614004E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A728C8E147; Fri, 21 Aug 2026 15:10:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 13:54:10 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 1817abc750da72bd3d24ecaf3edf187e7a80b704
X-Git-Newrev: 30f11a287ebab2a21df0f3f38dd6e5c049e61e8b
X-Patchwork-Hint: ignore
Message-Id: <20260821151016.A728C8E147@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/at-spi2-core:
 update project URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30f11a287ebab2a21df0f3f38dd6e5c049e61e8b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8f0f84a40029a0ae67a6f5d3b861cbcddfcbaf7c)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/at-spi2-core/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/at-spi2-core/Config.in b/package/at-spi2-core/Config.in
index 2a1b21d375..915815393a 100644
--- a/package/at-spi2-core/Config.in
+++ b/package/at-spi2-core/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_AT_SPI2_CORE
 	  GNOME platform and a library against which applications
 	  can be linked.
 
-	  https://wiki.gnome.org/Accessibility
+	  https://gitlab.gnome.org/GNOME/at-spi2-core
 
 comment "at-spi2-core needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
