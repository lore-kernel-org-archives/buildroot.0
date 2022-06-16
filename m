Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C18C43334
	for <buildroot@archiver.kernel.org>; Thu, 16 Jun 2022 17:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EBFA404CD;
	Thu, 16 Jun 2022 17:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PpigThzLY_9l; Thu, 16 Jun 2022 17:47:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C305400E3;
	Thu, 16 Jun 2022 17:47:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E6221BF425
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 17:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B2F0409F4
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 17:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1rVbFuYUGxl for <buildroot@lists.busybox.net>;
 Thu, 16 Jun 2022 17:47:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F85A40A02
 for <buildroot@buildroot.org>; Thu, 16 Jun 2022 17:47:52 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout06.t-online.de (Postfix) with SMTP id 742DC207C0
 for <buildroot@buildroot.org>; Thu, 16 Jun 2022 19:47:50 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.197.87]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o1tav-2kKhHt0; Thu, 16 Jun 2022 19:47:49 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:41670)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o1tau-00028H-Ud
 for buildroot@buildroot.org; Thu, 16 Jun 2022 19:47:49 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 16 Jun 2022 19:47:47 +0200
Message-Id: <20220616174748.24361-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1655401669-01439E5E-3C25E762/0/0 CLEAN NORMAL
X-TOI-MSGID: d9c3fd29-be75-472a-8318-ab71b00c4f47
Subject: [Buildroot] [PATCH 1/2] package/kodi-inputstream-adaptive: bump
 version to 19.0.6-Matrix
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 0336fa0e0a..65fa014603 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  43064b79462052ae68b342d82af733361ce38c5461acd3e1fa1c87ef8c24201a  kodi-inputstream-adaptive-19.0.5-Matrix.tar.gz
+sha256  aa4a58bf763ae6b502160d4fb8377c8df5bbec25620128887bac3b6f95917d7c  kodi-inputstream-adaptive-19.0.6-Matrix.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 5a6061fbcd..cd8e59f5bc 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 19.0.5-Matrix
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 19.0.6-Matrix
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
