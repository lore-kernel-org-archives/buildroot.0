Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D656CC5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 757C981338;
	Fri, 21 Aug 2026 15:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCMbA3uFhn5Q; Fri, 21 Aug 2026 15:07:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324878;
	bh=4Drvw3Utl0cSG45cVG09Ud0JotXwFpuc1btad/fpdsU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cVvsb0NmXw2jlcFxzn/6KZfTLf4uAILCCTKWLutmT8pdSAS+/zP3YrQnH//SlXx4W
	 sJEOwFmCty17a/gR4tjeLVeF9cav/Ge2F6GtMoZX1kxbcL2F1a2voIWzDyPE81rvrC
	 Qoj/lsnCnmpQ6jTYmI5ORdGtnKwV7WExeXG5gBVBLJiIMKr6Cdk1UdhDfWtM+cxti7
	 3kpUky7Myj/idCh3BX9XyKSiJKlCayy2vLI7ypX7B/e6B3vYbUgXwbavVSQ1jieCfG
	 eNWkymV8olm8FQFFieP4F53XgcAocCI0H2KPaTw2VtQbyqSqLAxHuD+1jPSOmhIX8r
	 3a5uDQKik2iKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1808981200;
	Fri, 21 Aug 2026 15:07:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EAD731CF2
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1B9B40026
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tgeQtxtZ0s7 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 310A140414
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A567E8E0EC; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5372f27b796f23459c9facecf12a60002d918079
X-Git-Newrev: d1614f91bd82fbd463b9ad72bdbf3f016ccdc119
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.A567E8E0EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libsoup: update
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d1614f91bd82fbd463b9ad72bdbf3f016ccdc119
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 16c5253138499b083f7fa7b918e3fa18ff1720d5)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libsoup/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 02e8e8b578..f566e9a508 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBSOUP
 	  and the GLib main loop, to integrate well with GNOME
 	  applications.
 
-	  https://wiki.gnome.org/Projects/libsoup
+	  https://gitlab.gnome.org/GNOME/libsoup
 
 if BR2_PACKAGE_LIBSOUP
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
