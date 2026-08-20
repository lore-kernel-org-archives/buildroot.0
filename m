Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DB6C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0266881703;
	Fri, 21 Aug 2026 15:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHlWQnq9v_y7; Fri, 21 Aug 2026 15:11:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325093;
	bh=6T67zOMaixnGqLXH8SY2fzEBCrx7vhm9Kx1lvqSA3t8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=doWpzjnYiS9cGc6Se7pyvVkvtAaAjq/XWJfssgZ37oKh8D8OTOfZ5uRgLdS87C4X4
	 lsp+yAHAdIVCs9eeGCR7DSmOUwlhOAVRvojB9VcheWN5i6iQZy6UhsKQSwdHF/8N45
	 qYLA8mmTsSMfqWtfaksACIfve2LHhbGNDxJuaERuFDCMTyqY9HE/lxkx19aNAlMdWc
	 i+/6RItsBfZxPZb6c+X/kY0+VgOT2HH6ztdSrrRZ0wVMQVY3jqWspVGXZ2nhOkZmQi
	 XIu6GB9XUpawSAZ2cVbHlzKKCIP/2i5XAhl1tipPUz60+oXk/+NVG1b1XdQknU3wXE
	 UR+N6XgcSSD1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE6D7816F1;
	Fri, 21 Aug 2026 15:11:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1A4C29B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABA1C40BF5
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljTXrNnVazTS for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1368240B29
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A1138DBE4; Fri, 21 Aug 2026 15:10:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 11:43:59 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 3ec5adfa6eef2e8aa850d75d6874a5c03cd85b30
X-Git-Newrev: 3e9c7084c7b933f5c98a2a146451002cd9970a26
X-Patchwork-Hint: ignore
Message-Id: <20260821151016.7A1138DBE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/dracut: update
 URLs
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3e9c7084c7b933f5c98a2a146451002cd9970a26
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

The Github repository has been renamed from dracut-ng to dracut. The
wiki still exists, but the actual documentation has been moved to
dracut-ng.github.io.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ec8c6e44874e4eefaf8b6f7c92464cec6db8c6ef)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/dracut/Config.in.host | 2 +-
 package/dracut/dracut.mk      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
index 88dec969c3..af68728457 100644
--- a/package/dracut/Config.in.host
+++ b/package/dracut/Config.in.host
@@ -8,4 +8,4 @@ config BR2_PACKAGE_HOST_DRACUT
 	  dracut-ng is a drop-in replacement for the legacy
 	  dracut project.
 
-	  https://github.com/dracut-ng/dracut-ng/wiki
+	  https://dracut-ng.github.io/dracut/
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 0bd24d49f4..0bf755319e 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DRACUT_VERSION = 112
-DRACUT_SITE = $(call github,dracut-ng,dracut-ng,$(DRACUT_VERSION))
+DRACUT_SITE = $(call github,dracut-ng,dracut,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
 DRACUT_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
