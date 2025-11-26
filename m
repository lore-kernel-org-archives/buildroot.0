Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66177D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 322254145B;
	Thu, 27 Nov 2025 20:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAKfyVO6vAf7; Thu, 27 Nov 2025 20:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 678B741460
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 678B741460;
	Thu, 27 Nov 2025 20:08:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0A552A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDB6A84431
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57xWtr9pPCyW for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D5C984420
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D5C984420
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BB9185FCB; Thu, 27 Nov 2025 20:07:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:24:04 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5c690a0d2ce5f9c6d7ca1be53de30daa22cd6af5
X-Git-Newrev: c4de4c2a8feb7453f60c85ec5371a95853f52fce
X-Patchwork-Hint: ignore
Message-Id: <20251127200756.9BB9185FCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: add Bernd
 Kuhls for postgresql
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4de4c2a8feb7453f60c85ec5371a95853f52fce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 273f6f3e4b95631f1c6c38ff1a30b68a5b8117c0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e972d165d2..dd93e87826 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -477,6 +477,7 @@ F:	package/perl-uri/
 F:	package/perl-www-robotrules/
 F:	package/php/
 F:	package/pngquant/
+F:	package/postgresql/
 F:	package/pppd/
 F:	package/privoxy/
 F:	package/pure-ftpd/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
