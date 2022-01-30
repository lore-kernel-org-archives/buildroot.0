Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FC8C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 21:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE63410AF;
	Sun, 30 Jan 2022 21:56:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-nxmtbU-203; Sun, 30 Jan 2022 21:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B7DF410DE;
	Sun, 30 Jan 2022 21:56:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 327C31BF3E3
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D0A74090C
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdUVwaBJEkfK for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 21:56:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61BA7410BB
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 21:56:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0703C817B8; Sun, 30 Jan 2022 21:49:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 22:56:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdee6c9f3987189eb743f54be2e545ce84d4d3bb
X-Git-Newrev: 40deb82a0dcf3a2a67a007f0f89dcf6bbe4c9a49
X-Patchwork-Hint: ignore
Message-Id: <20220130214905.0703C817B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Giulio Benetti to
 sunxi-tools package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=40deb82a0dcf3a2a67a007f0f89dcf6bbe4c9a49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e17803f38a..a1ec9a091e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1110,6 +1110,7 @@ F:	package/python-uvloop/
 F:	package/rockchip-mali/
 F:	package/sunxi-mali-utgard/
 F:	package/sunxi-mali-utgard-driver/
+F:	package/sunxi-tools/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	toolchain/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
