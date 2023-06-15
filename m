Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3985EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 16:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE92B84086;
	Thu, 15 Jun 2023 16:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE92B84086
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MqjnOI3Wpifm; Thu, 15 Jun 2023 16:22:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 354598402F;
	Thu, 15 Jun 2023 16:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 354598402F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 985191BF23B
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 16:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 720EE61465
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 16:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 720EE61465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WIbSucoE7hEQ for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 16:22:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 731E16145F
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 731E16145F
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 16:22:12 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout06.t-online.de (Postfix) with SMTP id AB48928448;
 Thu, 15 Jun 2023 18:20:53 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.188.179]) by fwd89.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q9piP-1XQFF30; Thu, 15 Jun 2023 18:20:53 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:58196)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q9piP-0001gy-0X;
 Thu, 15 Jun 2023 18:20:53 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 18:20:49 +0200
Message-Id: <20230615162049.72408-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686846053-FA7EF283-1A483AFB/0/0 CLEAN NORMAL
X-TOI-MSGID: bda31b41-52a5-4629-9f72-77748545ac87
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: Update email address for Bernd
 Kuhls
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7aa5980df7..78b5abbb21 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -311,7 +311,7 @@ F:	package/taskd/
 N:	Benjamin Kamath <kamath.ben@gmail.com>
 F:	package/lapack/
 
-N:	Bernd Kuhls <bernd.kuhls@t-online.de>
+N:	Bernd Kuhls <bernd@kuhls.net>
 F:	package/alsa-lib/
 F:	package/alsa-utils/
 F:	package/apache/
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
