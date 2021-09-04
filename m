Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C59C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:49:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E85E560F42
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E85E560F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4303401EF;
	Sat,  4 Sep 2021 20:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vBazAzBrmlIq; Sat,  4 Sep 2021 20:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4B58401E3;
	Sat,  4 Sep 2021 20:49:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D56791BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4AE740481
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cnazsXPm6uXq for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:49:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F418404A6
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:49:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9FF34884B1; Sat,  4 Sep 2021 20:48:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 22:47:55 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 9f13e65a8482f059794ec41c382940547a84af0b
X-Git-Newrev: ed95476d0a52400661cb62f3084268ab4387eb93
X-Patchwork-Hint: ignore
Message-Id: <20210904204808.9FF34884B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] DEVELOPERS: drop Sven
 Fischer
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ed95476d0a52400661cb62f3084268ab4387eb93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Sven has privately asked to no longer receive notifications related to
this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 829ecf7d794b454a9fa9557b2420d624e3d3bb14)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 42b5becb7e..da7e23c64c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2522,9 +2522,6 @@ F:	configs/rock_pi_n10_defconfig
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
