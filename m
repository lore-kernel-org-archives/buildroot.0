Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7E1ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 19:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F7CA81B6D;
	Mon, 19 Sep 2022 19:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F7CA81B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RawdORoy5xI; Mon, 19 Sep 2022 19:37:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88C4381B17;
	Mon, 19 Sep 2022 19:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88C4381B17
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C84931BF59A
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 19:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B165A40125
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 19:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B165A40125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BSw5pDj5T_MQ for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 19:37:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0E3B40124
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 19:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0E3B40124
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDCBF85A57; Mon, 19 Sep 2022 19:37:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 Sep 2022 21:36:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a03d17172a53d4039f3ebd023dbbbf954c41244
X-Git-Newrev: 48810c229695ef3eae02dab5b5a8d37d5eae41c2
X-Patchwork-Hint: ignore
Message-Id: <20220919193740.DDCBF85A57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Joachim to projects he's
 the upstream maintainer
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

commit: https://git.buildroot.net/buildroot/commit/?id=48810c229695ef3eae02dab5b5a8d37d5eae41c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e8626341e..14b91fca8d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1481,15 +1481,21 @@ N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
 F:	package/inadyn/
+F:	package/libconfuse/
 F:	package/libite/
+F:	package/libnet/
 F:	package/libteam/
 F:	package/libuev/
 F:	package/mg/
+F:	package/mini-snmpd/
 F:	package/mrouted/
 F:	package/netcalc/
+F:	package/pimd/
+F:	package/redir/
 F:	package/smcroute/
 F:	package/ssdp-responder/
 F:	package/sysklogd/
+F:	package/uredir/
 F:	package/watchdogd/
 
 N:	Jochen Baltes <jochen.baltes@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
