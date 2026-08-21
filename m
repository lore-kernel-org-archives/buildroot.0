Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1257C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8940480F40;
	Fri, 21 Aug 2026 15:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72wnIzotWzLi; Fri, 21 Aug 2026 15:08:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324892;
	bh=D1id2BFeflZ/itv7nFdLu0gOabEZU63JyXWDaHMWxnE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sd1rxwJjHMGw7qyqLlkC1ErMLDkdagDyUOUmeiPc4k8zmjKYx/jwSyhxrBHekWc8h
	 kFM6wmiY7R6XEsoaxdrKPcX1vv9J7uml0z+4ZDsE1lHKUkyYiSWPgvR0Eg1mcb61PO
	 SLK/MWRcgVmLJPfy5/wQ2iKaEKmhAF29TIOMB+exQ65bDUkR0F3VOEP6CX0f/ANwKh
	 b8Ozbk8RJ/F8Z6rbp9EEVgsKSqI63BTOK6lEqJvwfXliq9s+f5v4L9Isu9kawerKsb
	 4VQE6nGAJJtwpntYmMp6SPWbgngn2EN/2eSspI+B2dbukx52IC/AqlHEpeQDwAvFvW
	 MD8Q0ax4LQjSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF486813AB;
	Fri, 21 Aug 2026 15:08:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10B6E1CF2
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E96F0400B4
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-tDMQG13ure for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF394403FF
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F5988E0EC; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f8857ef48b109940f6432b8a42b9d9a0802bbda2
X-Git-Newrev: b89e79e44cc2f3ced2cdaca182a5362f6a08cdc0
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.6F5988E0EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/at-spi2-core:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b89e79e44cc2f3ced2cdaca182a5362f6a08cdc0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
