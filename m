Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF17C5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5361F81A65;
	Fri, 21 Aug 2026 15:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXJ8T2bhfBqS; Fri, 21 Aug 2026 15:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325111;
	bh=3R9ooAay3y18dXJEg6p6CL9uh1rnlJVTjxv8YvWDfNw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I6kwUZNQ2RP6RRzYWafXmcHhhUm+GpneGA18819OuMSSzutcEIWJA8S0kXFfCQnrE
	 oICsNjYbWLsv0yle0EIFgqjVt74CmvN6pnqEhEFIZmO3eP4LG8k1SyN6lUtwvreto5
	 tu545zryhNI/25K2tDZi/LPxgxwrMNV3zYzdaNh9tBsOoRcHzIsLhRd9/irImmlD06
	 5dL0OSWnu5pt/v9WJnp11cde/IFgax5oKadvPB0kCHN3a9Qz1k3b1zjqjqIrQilhwl
	 auBDfePQFTroe+iYByC+p31ZN++EX3M+xH1bCcEFCgj6Dex1kOFndB9eT5CwczEVYF
	 icdyqQG6kQvEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 632BF81A29;
	Fri, 21 Aug 2026 15:11:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53806EA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3563E40C08
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQJZNQZTXPIy for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9185040BD1
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 107C08E132; Fri, 21 Aug 2026 15:10:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 13:55:13 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: eab5b0f66ad86f588666c5f1da6f14af23d015b1
X-Git-Newrev: ce62b98fdb142169e710e95f8633aeac87ce7a7e
X-Patchwork-Hint: ignore
Message-Id: <20260821151017.107C08E132@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libsoup: update
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce62b98fdb142169e710e95f8633aeac87ce7a7e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
