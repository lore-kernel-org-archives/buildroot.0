Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F39CC5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C557817BA;
	Fri, 21 Aug 2026 15:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtNz4H8IjDk0; Fri, 21 Aug 2026 15:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325100;
	bh=8dQCpEBFBexJz6HVtpa2osKKaZgETlqy9B4vUeefTvc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rfe+DT47uOt6Y9iN1tqjsOrrhtwtaSfE6NviFLxoNEAq+AXPc7FgfSW+PocNU2D0V
	 lkP9OepTsETcla/CH9AsZDbnP5vnJ5Yrauq4GU0wJWScooKGdBkSDLLQHw4OfNp6Ln
	 UZdmBMmHF24FRR0Yp30XOIpH0vaNgwO80RRa0j+WmvtpuGDl8iY6elbq6Ra3ptQbao
	 EaR5i+JIEu5hxJWBGIa1RpdqIaR9+xKXp92u+qhlIGGysMg+vw9nzu/TQuI6j89JL3
	 x86FXKDjQXGwNeuSQaw+SpmdSMJYzmCCKNN75uQaEhOitLrNxpNukUDz17vkN+RY+6
	 V7FQU1JJKC+ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E13748179A;
	Fri, 21 Aug 2026 15:11:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04566EA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEB1740B29
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abUVZR9FQjJ7 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FBF540A15
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6C538E13B; Fri, 21 Aug 2026 15:10:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 13:54:18 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 30f11a287ebab2a21df0f3f38dd6e5c049e61e8b
X-Git-Newrev: 177f5fbb29106b7611e389a030f9bcb5030e36a6
X-Patchwork-Hint: ignore
Message-Id: <20260821151016.B6C538E13B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/gvfs: update
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/177f5fbb29106b7611e389a030f9bcb5030e36a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 15c4abfa524d236e3b2b65fdabdd7ff0050baaf2)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/gvfs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 720b8e6c20..0fd9535bd0 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_GVFS
 	  all applications using the gio API. It also supports exposing
 	  the gvfs mounts to non-gio applications using fuse.
 
-	  https://wiki.gnome.org/Projects/gvfs
+	  https://gitlab.gnome.org/GNOME/gvfs
 
 comment "gvfs needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
