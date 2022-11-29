Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A445C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D4D41D8D;
	Mon, 20 Feb 2023 21:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25D4D41D8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVKJTZ_b2Ysv; Mon, 20 Feb 2023 21:26:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F83542FE4;
	Mon, 20 Feb 2023 21:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F83542FE4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D7791BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0573415A1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0573415A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RaYRW5Wcxdr5 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF74C41595
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF74C41595
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE87486494; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 29 Nov 2022 22:58:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 121184d746bc1a21385e9f20728664b257b52682
X-Git-Newrev: 059c61a18f6a1fb8f0580c0475983fe37fa69e44
X-Patchwork-Hint: ignore
Message-Id: <20230220205153.CE87486494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: add Giulio Benetti
 to rtl8192eu package
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

commit: https://git.buildroot.net/buildroot/commit/?id=059c61a18f6a1fb8f0580c0475983fe37fa69e44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 569d58407a..bfebf8163c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1151,6 +1151,7 @@ F:	package/qt5/
 F:	package/rockchip-mali/
 F:	package/rtl8188eu/
 F:	package/rtl8189es/
+F:	package/rtl8192eu/
 F:	package/rtl8723bu/
 F:	package/rtl8723ds/
 F:	package/rtl8812au-aircrack-ng/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
