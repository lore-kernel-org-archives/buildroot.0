Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F142C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A6E2825C7;
	Tue, 21 Feb 2023 08:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A6E2825C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ovvOn1rp5Yf5; Tue, 21 Feb 2023 08:19:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6412382695;
	Tue, 21 Feb 2023 08:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6412382695
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 904D51BF956
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A191611A9
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A191611A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aQ1LF-XSUtJv for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:19:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAD1661186
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAD1661186
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A514C86509; Tue, 21 Feb 2023 08:19:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 09:19:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9e09ac2c02d1ff8d3872ebc72e915e9baa7fbd0d
X-Git-Newrev: 1d7dd1b79145a34f861d30d09750f6e988e10fd5
X-Patchwork-Hint: ignore
Message-Id: <20230221081921.A514C86509@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: add Giulio Benetti
 to board imx6ullevk for both mainline and NXP(Freescale) versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d7dd1b79145a34f861d30d09750f6e988e10fd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index caa73698f9..599cfe6886 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1136,10 +1136,13 @@ F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	board/bananapi/bananapi-m2-ultra/
+F:	board/freescale/imx6ullevk/
 F:	board/olimex/a*
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
 F:	configs/bananapi_m2_ultra_defconfig
+F:	configs/freescale_imx6ullevk_defconfig
+F:	configs/imx6ullevk_defconfig
 F:	configs/olimex_a*
 F:	package/at/
 F:	package/binutils/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
