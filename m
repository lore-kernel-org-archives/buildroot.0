Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10147C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F57A40201;
	Wed, 27 Jul 2022 10:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F57A40201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MmyUS2DiyE6N; Wed, 27 Jul 2022 10:24:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BCE04016E;
	Wed, 27 Jul 2022 10:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BCE04016E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57E6A1BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 403BC60B52
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 403BC60B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qPv4GZ6rupbN for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:23:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F35DA60AFE
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F35DA60AFE
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:23:57 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout01.t-online.de (Postfix) with SMTP id 1DA394001
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 12:23:55 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oGeCo-4WrG3l0; Wed, 27 Jul 2022 12:23:55 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:32830)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oGeCo-0005JD-2C
 for buildroot@buildroot.org; Wed, 27 Jul 2022 12:23:54 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:23:54 +0200
Message-Id: <20220727102354.382804-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658917435-0144F70D-4EF904BD/0/0 CLEAN NORMAL
X-TOI-MSGID: e0cc61c7-7cec-407d-b7be-d7e6e501619a
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: drop myself from Pulseaudio
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

I am not using this package anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 56c5d69450..684c71fd19 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -437,7 +437,6 @@ F:	package/php/
 F:	package/pixman/
 F:	package/pngquant/
 F:	package/pound/
-F:	package/pulseaudio/
 F:	package/pure-ftpd/
 F:	package/python-couchdb/
 F:	package/python-cssutils/
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
