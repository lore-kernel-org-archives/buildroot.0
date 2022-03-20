Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A027C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 12:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBB1560BDA;
	Sun, 20 Mar 2022 12:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EhN1RyLwXyIy; Sun, 20 Mar 2022 12:18:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04C0F60AB5;
	Sun, 20 Mar 2022 12:18:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4A0C1BF591
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 12:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 939954035C
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 12:18:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jV3mGxjEtU-U for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 12:18:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBEB740353
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 12:18:40 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout05.t-online.de (Postfix) with SMTP id A6FD723C45
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 13:18:37 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.211]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nVuW5-3XXLrl0; Sun, 20 Mar 2022 13:18:37 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56742)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nVuW4-0006zk-Mr
 for buildroot@buildroot.org; Sun, 20 Mar 2022 13:18:36 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 13:18:36 +0100
Message-Id: <20220320121836.3682323-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647778717-00009E39-E10415CB/0/0 CLEAN NORMAL
X-TOI-MSGID: e0738061-1982-4503-962d-5d84a171b9ab
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-waipu: bump version to
 19.2.0-Matrix
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
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 9411453bf0..d40a068cb5 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ab4995ed32910ced6004da800ca05fe5bf2d1882277e835eb64343806cfe217d  kodi-pvr-waipu-19.1.1-Matrix.tar.gz
+sha256  4c5ad45ba869c8064a0d64d7fc5c0a2e0c9f47f51184823872d6cd888ab7b2a0  kodi-pvr-waipu-19.2.0-Matrix.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index ffe9e31e5a..61c5bd67ae 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 19.1.1-Matrix
+KODI_PVR_WAIPU_VERSION = 19.2.0-Matrix
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
