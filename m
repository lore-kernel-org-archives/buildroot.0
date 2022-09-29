Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7519C433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 21:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61687611E6;
	Thu, 29 Sep 2022 21:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61687611E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cAsacVv6P6bL; Thu, 29 Sep 2022 21:25:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D587611F7;
	Thu, 29 Sep 2022 21:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D587611F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6083E1BF3D1
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83E0B84031
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83E0B84031
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ixMXVCOss0QN for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 21:21:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFA3584023
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 21:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFA3584023
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A001386616; Thu, 29 Sep 2022 21:21:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 22:21:15 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 7abd214867cbd348ef8a6ec1ea5c41b51d9c2f7c
X-Git-Newrev: 2c030725571eb83ef7fb9daca1558c2c4ba60f05
X-Patchwork-Hint: ignore
Message-Id: <20220929212136.A001386616@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] DEVELOPERS: add Joachim
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c030725571eb83ef7fb9daca1558c2c4ba60f05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 48810c229695ef3eae02dab5b5a8d37d5eae41c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a83f7640c7..9b6822acb7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1473,15 +1473,21 @@ N:	Joachim Wiberg <troglobit@gmail.com>
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
