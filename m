Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8545C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 17:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C02D419F1;
	Wed, 23 Mar 2022 17:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1U05c8BS1SF; Wed, 23 Mar 2022 17:01:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCBF541B8C;
	Wed, 23 Mar 2022 17:01:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD97D1BF4DA
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 17:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C89A4173D
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 17:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6gECToVrqJ-w for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 17:01:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C14A2405A6
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 17:01:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4D09485212; Wed, 23 Mar 2022 16:52:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 18:01:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7228dadd3719876c623cb95e611c6ec9ebf9346
X-Git-Newrev: ae1deebb9e78b5338f5f30fe4765e3eb9e5be3d7
X-Patchwork-Hint: ignore
Message-Id: <20220323165239.4D09485212@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update email address
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae1deebb9e78b5338f5f30fe4765e3eb9e5be3d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates my email address in the DEVELOPERS file.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 942bb8fe9c..58ed4f81cd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2089,7 +2089,7 @@ F:	package/libevdev/
 F:	package/pkg-qmake.mk
 F:	package/qt5/qt5opcua/
 
-N:	Neal Frager <neal.frager@xilinx.com>
+N:	Neal Frager <neal.frager@amd.com>
 F:	board/zynqmp/
 F:	configs/zynqmp_zcu102_defconfig
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
