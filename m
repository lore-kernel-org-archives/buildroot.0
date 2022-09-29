Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFA2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 21:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B90A41C4D;
	Thu, 29 Sep 2022 21:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B90A41C4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CF1SwYRyzqDF; Thu, 29 Sep 2022 21:20:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4507C41C3C;
	Thu, 29 Sep 2022 21:20:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4507C41C3C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 194C11C11A5
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E82FA40C18
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E82FA40C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WyOT0RgEjP3N for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 21:20:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A10794011A
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 21:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A10794011A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D36B86573; Thu, 29 Sep 2022 21:20:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 22:35:05 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: de3122cf6f73135e317ac0f2e8256fcf88e3dfbf
X-Git-Newrev: 49505c445c52cf2e3777ee5ab82951a7acc9428d
X-Patchwork-Hint: ignore
Message-Id: <20220929212027.8D36B86573@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] DEVELOPERS: add Giulio
 Benetti to rtl8189es, rtl8723bu/ds, rtl8812au-aircrack-ng, wilc-driver
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

commit: https://git.buildroot.net/buildroot/commit/?id=49505c445c52cf2e3777ee5ab82951a7acc9428d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4dc0b17fdac6c777ffa65be42b4180f3a9bfe15a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ff5e4c0412..5db03bc73e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1102,11 +1102,15 @@ F:	package/minicom/
 F:	package/nfs-utils/
 F:	package/python-uvloop/
 F:	package/rockchip-mali/
+F:	package/rtl8189es/
+F:	package/rtl8723bu/
+F:	package/rtl8812au-aircrack-ng/
 F:	package/sunxi-mali-utgard/
 F:	package/sunxi-mali-utgard-driver/
 F:	package/sunxi-tools/
 F:	package/trace-cmd/
 F:	package/udisks/
+F:	package/wilc-driver/
 F:	toolchain/
 
 N:	Graeme Smecher <gsmecher@threespeedlogic.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
