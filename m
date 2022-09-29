Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0FAC433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 21:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C364C8402C;
	Thu, 29 Sep 2022 21:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C364C8402C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljD0OOX7yfQ6; Thu, 29 Sep 2022 21:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F36CB84023;
	Thu, 29 Sep 2022 21:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F36CB84023
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4D641C11A0
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1898611C2
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1898611C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MqN9cl-B3caC for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 21:21:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE7B7611C1
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 21:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE7B7611C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE31086616; Thu, 29 Sep 2022 21:21:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 22:21:23 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: cb419c8b3cf2b09db4bfc0dfcaae4f89590dfcd5
X-Git-Newrev: e5a3443bb43b38af127f834792c04412a72a813b
X-Patchwork-Hint: ignore
Message-Id: <20220929212134.CE31086616@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: add Joachim
 to projects he's the upstream maintainer
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5a3443bb43b38af127f834792c04412a72a813b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 48810c229695ef3eae02dab5b5a8d37d5eae41c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 24fb9e9d82..d1aa871e1a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1412,15 +1412,21 @@ N:	Joachim Wiberg <troglobit@gmail.com>
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
