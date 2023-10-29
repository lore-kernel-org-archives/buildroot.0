Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43C8C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 21:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DBD54F1AD;
	Sun, 29 Oct 2023 21:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DBD54F1AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aizRyI0eLQ36; Sun, 29 Oct 2023 21:04:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2FA34F1AB;
	Sun, 29 Oct 2023 21:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2FA34F1AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E3E01BF36E
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 21:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26D884F1AB
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 21:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26D884F1AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NuzIQRhcmXSH for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 21:04:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B1F64F1AA
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 21:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B1F64F1AA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BB268613A; Sun, 29 Oct 2023 21:04:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 22:03:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 750392e95e480d0b6f9facb266187b5cd9bb3eb2
X-Git-Newrev: a9d2040b064d8cb0623c7cc75f1036a2f3bf9ee5
X-Patchwork-Hint: ignore
Message-Id: <20231029210413.4BB268613A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPPERS: fix licheepi entries
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a9d2040b064d8cb0623c7cc75f1036a2f3bf9ee5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 57015e245e..6a501f45e9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2159,8 +2159,8 @@ F:	package/openrc/
 F:	package/skeleton-init-openrc/
 
 N:	Michel Stempin <michel.stempin@wanadoo.fr>
-F:	board/licheepi/
-F:	configs/licheepi_zero_defconfig
+F:	board/sipeed/licheepi_zero/
+F:	configs/sipeed_licheepi_zero_defconfig
 
 N:	Mike Frampton <mikeframpo@gmail.com>
 F:	package/qcom-db410c-firmware/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
