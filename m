Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC55EC77B7A
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 14:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D275F60C16;
	Sun, 11 Jun 2023 14:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D275F60C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xv4OZ14luQRq; Sun, 11 Jun 2023 14:56:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2579D60E34;
	Sun, 11 Jun 2023 14:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2579D60E34
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7874E1BF3E8
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 528DC82C04
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 528DC82C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7ka3VRqKD_6 for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 14:56:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C9882BE5
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2C9882BE5
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 14:56:24 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout12.t-online.de (Postfix) with SMTP id C836D13CC1
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 16:56:22 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd73.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8MUQ-07Owcr0; Sun, 11 Jun 2023 16:56:22 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:34716)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8MUP-0001vD-3B
 for buildroot@buildroot.org; Sun, 11 Jun 2023 16:56:22 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 16:56:17 +0200
Message-Id: <20230611145617.758070-13-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611145617.758070-1-bernd.kuhls@t-online.de>
References: <20230611145617.758070-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686495382-E0A3F2C5-235008E3/0/0 CLEAN NORMAL
X-TOI-MSGID: 5a7e694f-241e-44ff-b175-17ddb36cd019
Subject: [Buildroot] [PATCH 12/12] DEVELOPERS: remove Bernd Kuhls from
 package/x11r7/
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove packages which are no longer runtime-tested here.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3041efe738..407ff8e81b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -482,7 +482,6 @@ F:	package/vnstat/
 F:	package/wget/
 F:	package/wireless-regdb/
 F:	package/wireless_tools/
-F:	package/x11r7/
 F:	package/x264/
 F:	package/x265/
 F:	package/xmrig/
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
