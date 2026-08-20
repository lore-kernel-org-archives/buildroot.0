Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C341C5DF95
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31A9281244;
	Fri, 21 Aug 2026 15:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZoFEGgNKC_dO; Fri, 21 Aug 2026 15:11:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325103;
	bh=fLjGumvNwqiQHT5HDSIlVTV1MqTBOXFwWj3B4Kk4oeQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jwN2gz2/LLYR5Sbj77oz2nOTEN8NJC6ywsHOfrYXZu7hyPUb4lgsUMMRh+v+lzeBa
	 Bxe4YvQDAl+1C9mcNtytI82XOMO1gVDulX7fdb2SCBJn/00Hl3Cv4OAEugD35xJ6oe
	 lLYURhduBOztYhHR3rHtanYa+/zwXSN7dX6NfCrniKPXhXaPQG1BlfBJGx6r8bVL8J
	 45cPBj6ku15zV5tepViytlSLWn1X4/ntWbRMf/A88OJLL5UYKWhfl6B31ZKfEm4Owe
	 qyozP5P39DYdlYvgWrgLyxxoosn3OKncc91+qRr02PBLHc3WZwfQp0845Ync+3Q8Wj
	 aORynTI9/GBRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EC3E817FD;
	Fri, 21 Aug 2026 15:11:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1983E2017
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 086DB400DC
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQMMEc1l-zTk for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A35940026
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD63B8E13B; Fri, 21 Aug 2026 15:10:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 13:54:36 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: f8255ba5a3a77c3bc593bd4a78a0e68e374c4493
X-Git-Newrev: e3ce1e65fdd6f8b7a9499bb15972d8a614105d42
X-Patchwork-Hint: ignore
Message-Id: <20260821151016.DD63B8E13B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libgudev: update
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3ce1e65fdd6f8b7a9499bb15972d8a614105d42
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d7f835a4cb96c8e1f084ad0950e28df6bf11bce5)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libgudev/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgudev/Config.in b/package/libgudev/Config.in
index 21606ac4cc..46fe0bad97 100644
--- a/package/libgudev/Config.in
+++ b/package/libgudev/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LIBGUDEV
 	  It's now a project on its own. Required for building some
 	  programs that use udev, when using systemd.
 
-	  https://wiki.gnome.org/Projects/libgudev
+	  https://gitlab.gnome.org/GNOME/libgudev
 
 comment "libgudev needs udev /dev handling and a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
