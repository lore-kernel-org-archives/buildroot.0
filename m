Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041C7C5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA52C81951;
	Fri, 21 Aug 2026 15:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLtU5FPUTzrk; Fri, 21 Aug 2026 15:11:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325106;
	bh=ntTqIkU/aqCDQXfmFTnWXOODQ3Pc/Z+r1WBqZzT4f5g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eny6PZoJbQYkSfh1B0oBAOMiRIL5m+gVD3UH4yHd6ojBkNMOotxv2CgwwIYEHDaCS
	 DHZmy/gbWPJ5Fc80X8ao/h3WnDMcXJahosQzKP7v0FoSb3RI9nz+YZF3tINUOXdTQ8
	 kN1Wmhys7OcCSp/MNF3TiktI3KkQsSrY4RWntA4P3ih0k1gvMRT8EbPrPCCfNUiqqO
	 iD+hHJwzjMuPZmSIdYibmCk1ZDnHZfUUBVO4ymFKV0xcN9c6o8UaZ1t90TAqpXqAXl
	 Doj7sSjXVLTDyw6CYrppMrXaHj0usM2GU1EcJuYDuI1QACK00ORGVz+pgRXI+JZITE
	 CGRgr+Jn0mx8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 999D4818DC;
	Fri, 21 Aug 2026 15:11:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DCD2EA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BF5040026
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUukOr18VAoJ for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7772F400B4
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAA7A8E127; Fri, 21 Aug 2026 15:10:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 13:54:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: e3ce1e65fdd6f8b7a9499bb15972d8a614105d42
X-Git-Newrev: f9224f7e6653be5a6e9d7ec46a05bc3d578db305
X-Patchwork-Hint: ignore
Message-Id: <20260821151016.EAA7A8E127@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libpeas: update
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f9224f7e6653be5a6e9d7ec46a05bc3d578db305
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
