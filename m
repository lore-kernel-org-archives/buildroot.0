Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74439C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15A49813A2;
	Fri, 21 Aug 2026 15:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUnZXOwWnf5z; Fri, 21 Aug 2026 15:08:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324890;
	bh=iHKuOGNMpDaFXKhKFYLy3znVpMRCt0tZHOWIho+vBaM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DCDId/BJ9XBKSs3vTGx92t/bb/VCuAm67wf6iTxHJvCUtOYdlrD6uKJXwd3FMx9Ul
	 y1c22YkTEKXqLtsb7cVcNeYfPUR1mrLJvLaGkFnymvSxk4RexauuYy3MPegyLpQ47o
	 Fh0hGMyyHzgR1PZEXoZ0PukNKbP6iOsoZhzfEBLBTzXj44OH/lId10StLaMs9lQMAO
	 o2YmvlroY5gBQsx/GKGEJZPE9j7ui552UHQOD3yIFX28reZFveCcD9DTXTP8dUNrbN
	 dHdL4x8w4ROPlpdEla5Ole0yXEkPw8a1isCRjfz8dsyhMjBqH09Fbtkq8bgM1CG+sq
	 qOFzdDDzo9rig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C420C81198;
	Fri, 21 Aug 2026 15:08:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EB0A2D26
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E396F4004E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3r-wIGIouck for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FB5140411
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 942BC8E0EC; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ce99719fb3c2b764b44d9e70f539c73cda483495
X-Git-Newrev: 81229fe25ca69042933eb90a9ff23bcc8a32bdb3
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.942BC8E0EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libpeas: update
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/81229fe25ca69042933eb90a9ff23bcc8a32bdb3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 55cb1e8eeab72d9c4bd17c24de3c13aa97c43e97)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libpeas/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpeas/Config.in b/package/libpeas/Config.in
index 33fae14d4c..a9ab94369b 100644
--- a/package/libpeas/Config.in
+++ b/package/libpeas/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_LIBPEAS
 	      Python and Lua
 	    - Simplicity of the API
 
-	  https://wiki.gnome.org/Projects/Libpeas
+	  https://gitlab.gnome.org/GNOME/libpeas
 
 if BR2_PACKAGE_LIBPEAS
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
