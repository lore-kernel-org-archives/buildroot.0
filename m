Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A7CC4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 16:04:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C6B661216
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 16:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C6B661216
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5658C600C4;
	Sun, 15 Aug 2021 16:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvSKegHl2Tpp; Sun, 15 Aug 2021 16:04:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0875605A9;
	Sun, 15 Aug 2021 16:03:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0C3B1BF3F0
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 16:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC37E40228
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 16:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6_UE1KOgkOa for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 16:03:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2D93400AF
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 16:03:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2E9BA8CA81; Sun, 15 Aug 2021 16:03:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 18:03:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc894fca1cd9ba835bb49bf87899d2459e938c00
X-Git-Newrev: 829ecf7d794b454a9fa9557b2420d624e3d3bb14
X-Patchwork-Hint: ignore
Message-Id: <20210815160318.2E9BA8CA81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop Sven Fischer
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=829ecf7d794b454a9fa9557b2420d624e3d3bb14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sven has privately asked to no longer receive notifications related to
this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index bb39abefab..af97de02de 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2567,9 +2567,6 @@ F:	configs/rock_pi_n10_defconfig
 F:	configs/rockpro64_defconfig
 F:	package/arm-gnu-a-toolchain/
 
-N:	Sven Fischer <sven@leiderfischer.de>
-F:	package/qt5/qt5remoteobjects/
-
 N:	Sven Haardiek <sven.haardiek@iotec-gmbh.de>
 F:	package/lcdproc/
 F:	package/python-influxdb/
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
