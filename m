Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816FFC433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 08:44:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C6D0611C1
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 08:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C6D0611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1158E825B9;
	Sat,  6 Nov 2021 08:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MH8JxZSBwU34; Sat,  6 Nov 2021 08:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70B8382521;
	Sat,  6 Nov 2021 08:44:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE8041BF3EB
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 08:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE0106073D
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 08:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MaR4OcqYbcGh for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 08:43:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 237CC60593
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 08:43:48 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout10.t-online.de (Postfix) with SMTP id 00D3E15663
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 09:43:17 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.204.142]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mjHIC-39fOe90; Sat, 6 Nov 2021 09:43:16 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:40868)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mjHIC-0001t6-7J
 for buildroot@buildroot.org; Sat, 06 Nov 2021 09:43:16 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 09:43:08 +0100
Message-Id: <20211106084316.7915-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636188196-00001454-E8681FE2/0/0 CLEAN NORMAL
X-TOI-MSGID: 4b48ce76-b610-45ad-a4e8-d88669243ffc
Subject: [Buildroot] [PATCH 1/9] package/kodi-audiodecoder-modplug: bump
 version to 19.0.1-Matrix
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
 .../kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash    | 2 +-
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index f3736c192c..7bab017241 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ff3cb9816a30530d522f6a9a23eb49eb5301fb7880f402de6fc1dea31d3469f6  kodi-audiodecoder-modplug-19.0.0-Matrix.tar.gz
+sha256  4c422cacf456ab9eda5e2836d2789c3756bfbae03265a01647dd8f935261d9ec  kodi-audiodecoder-modplug-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index ce5619e8c7..9b2cf98dbc 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = 19.0.0-Matrix
+KODI_AUDIODECODER_MODPLUG_VERSION = 19.0.1-Matrix
 KODI_AUDIODECODER_MODPLUG_SITE = $(call github,xbmc,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
