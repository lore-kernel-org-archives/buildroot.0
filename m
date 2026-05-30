Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A871CD4F54
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8997C850AF;
	Sat, 30 May 2026 08:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqLozVcEJZMb; Sat, 30 May 2026 08:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5517F85115
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780128164;
	bh=MfhgUe7u4SLzn9VWD4KHI5lSuNdeUmPf2D41XdyIsNQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E1g/dQXF/VmPPzbpas+y4lDcZZCrcwwPV9ThTJM+rFbrS9Kla1YErFoJG303JMmZZ
	 FSUbb99xNUzUlKz6XpA7Fp1xdrzboG7F99d83cERtpVFZ+4759M/IXarrUAXs/mg84
	 dr5sbHd3unmE6PbCV8vkjfEUkFscu+EY3EdpSxnCvQys22FplFwd9XWEQK1nGw/bqN
	 KwG/1AvVtJ28nvbQZKZ9PtP342WbnrKSFwun03HYuj+w3T/HJIo7bDbjNBugy03ZXI
	 CqvyP/dOpoMScfksc+jxNWh0RkNcfyzjvyF9jltDZR5JdTjVkI0lCXEtRmzSeecmBQ
	 rSENPRUcLrMJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5517F85115;
	Sat, 30 May 2026 08:02:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85F59F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74D2642CB0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81A4gpCtRB2D for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A05942C62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A05942C62
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:02:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 983CB837D5; Sat, 30 May 2026 08:02:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:01:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdd94cac1b737df4303cfffe24247e5b905979c0
X-Git-Newrev: 758e5cdbddddcc41149e78626e12b834d288fa29
X-Patchwork-Hint: ignore
Message-Id: <20260530080228.983CB837D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop John Faith, email bounces
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/758e5cdbddddcc41149e78626e12b834d288fa29
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 657b06d7df..855ec491c9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1710,10 +1710,6 @@ F:	package/nginx-dav-ext/
 N:	John Stile <johns@msli.com>
 F:	package/dhcpcd/
 
-N:	John Faith <jfaith@impinj.com>
-F:	package/python-inflection/
-F:	package/sdbusplus/
-
 N:	Jon Ringle <jringle@gridpoint.com>
 F:	package/mbpoll/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
