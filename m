Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEEBC3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 21:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39B0F60A97;
	Mon,  2 Jan 2023 21:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39B0F60A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmG_YThSCG5X; Mon,  2 Jan 2023 21:29:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8991360BDE;
	Mon,  2 Jan 2023 21:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8991360BDE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 115771BF2C3
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 21:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E13D981391
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 21:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E13D981391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H_qLcVrppmAZ for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 21:29:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFE2381382
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFE2381382
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 21:29:33 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout07.t-online.de (Postfix) with SMTP id 0575111A0
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 22:29:31 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pCSN4-2MaAO90; Mon, 2 Jan 2023 22:29:27 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:60774)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pCSN4-0001JV-21
 for buildroot@buildroot.org; Mon, 02 Jan 2023 22:29:26 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon,  2 Jan 2023 22:29:26 +0100
Message-Id: <20230102212926.32133-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672694967-FB45E742-9D34F34A/0/0 CLEAN NORMAL
X-TOI-MSGID: cb4fc812-6740-4bc7-9419-c4ae06ae66ea
Subject: [Buildroot] [PATCH 1/1] package/vdr: bump version to 2.6.3
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

Changelog: https://github.com/vdr-projects/vdr/blob/master/HISTORY

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vdr/vdr.hash | 2 +-
 package/vdr/vdr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
index 2216e317fe..1b7ced0b77 100644
--- a/package/vdr/vdr.hash
+++ b/package/vdr/vdr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dfb252a0466e95071ca16707914d14c7e5c2e45020e4dc530ea85b7b3c3ea17e  vdr-2.6.1.tar.gz
+sha256  70352c7558d627202c02e80d88c83d25d9df4c5e49a010f7d1d9ae631bd54ad0  vdr-2.6.3.tar.gz
 sha256  ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index 61acb9971f..a44e1ff512 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VDR_VERSION = 2.6.1
+VDR_VERSION = 2.6.3
 VDR_SITE = $(call github,vdr-projects,vdr,$(VDR_VERSION))
 VDR_LICENSE = GPL-2.0+
 VDR_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
