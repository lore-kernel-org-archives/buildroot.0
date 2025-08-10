Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B0CC87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 14:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BE0C40B5E;
	Sun, 10 Aug 2025 14:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruY0zNeaNmAy; Sun, 10 Aug 2025 14:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E08D40CAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E08D40CAD;
	Sun, 10 Aug 2025 14:08:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 621DB138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48B3782208
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHuFDUrBgn_1 for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 14:08:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A37F80F75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A37F80F75
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74DA2870D3; Sun, 10 Aug 2025 14:08:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 16:06:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99df6586c5a86516b784a28da5388139592888fd
X-Git-Newrev: b7f7bd44f9c32a3ab49dae453256d04d7e66a630
X-Patchwork-Hint: ignore
Message-Id: <20250810140828.74DA2870D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Update email address of Thomas
 Huth
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7f7bd44f9c32a3ab49dae453256d04d7e66a630
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since tuxfamily.org is slowly fading away, update my mail address
to something that is more future-proof.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 12a41597af..a28f3e8d57 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3238,7 +3238,7 @@ N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
 F:	package/libsoup3/
 
-N:	Thomas Huth <huth@tuxfamily.org>
+N:	Thomas Huth <th.huth+br@posteo.eu>
 F:	package/ascii-invaders/
 F:	package/kvm-unit-tests/
 F:	package/xorcurses/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
