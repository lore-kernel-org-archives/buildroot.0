Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEBCC433FE
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 14:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F21A60D95;
	Mon, 10 Jan 2022 14:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxtIfWixGH_0; Mon, 10 Jan 2022 14:12:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C2DE60C0C;
	Mon, 10 Jan 2022 14:12:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4F6E1BF3C3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93B8660C08
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bTAlxB9zZ_Tz for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 14:12:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0684A60C0C
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:12:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1F28D82A2E; Mon, 10 Jan 2022 14:06:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 15:09:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26e886ac9088c284553afbd08128b332e5f5096c
X-Git-Newrev: 922fdcd47d092e9d2f7000afcb7997a2a2ed2111
X-Patchwork-Hint: ignore
Message-Id: <20220110140611.1F28D82A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add entry for avrdude to Yegor
 Yefremov
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

commit: https://git.buildroot.net/buildroot/commit/?id=922fdcd47d092e9d2f7000afcb7997a2a2ed2111
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cd0b54b041..7a9f0f7370 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2968,6 +2968,7 @@ F:	configs/beaglebone_defconfig
 F:	configs/beaglebone_qt5_defconfig
 F:	package/acl/
 F:	package/attr/
+F:	package/avrdude/
 F:	package/boost/
 F:	package/bootstrap/
 F:	package/cannelloni/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
