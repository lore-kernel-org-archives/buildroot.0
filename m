Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20E7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 21:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64284611CB;
	Thu, 29 Sep 2022 21:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64284611CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BjAaNf-kn4eU; Thu, 29 Sep 2022 21:22:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD9C611C7;
	Thu, 29 Sep 2022 21:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FD9C611C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DBD01BF3D1
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B966640A01
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B966640A01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EjUnKXa2RApT for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 21:20:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F7F040018
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 21:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F7F040018
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CBA586577; Thu, 29 Sep 2022 21:20:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 22:21:19 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: b7a154911d164409df1908bc28bcdd4af4feb125
X-Git-Newrev: 51bd15d841e90770939d20a4246095acd553a833
X-Patchwork-Hint: ignore
Message-Id: <20220929212027.6CBA586577@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] DEVELOPERS: add Joachim
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

commit: https://git.buildroot.net/buildroot/commit/?id=51bd15d841e90770939d20a4246095acd553a833
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 48810c229695ef3eae02dab5b5a8d37d5eae41c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 72bb621dfc..ff5e4c0412 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1418,15 +1418,21 @@ N:	Joachim Wiberg <troglobit@gmail.com>
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
