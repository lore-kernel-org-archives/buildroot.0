Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEA6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 17:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C644C40636;
	Mon, 27 Dec 2021 17:26:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oixCQNgansBD; Mon, 27 Dec 2021 17:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0D0B4055D;
	Mon, 27 Dec 2021 17:26:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C33E1BF3E1
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 17:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9095C405E5
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 17:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7dRS_EZjjEkX for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 17:26:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D66B4044D
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 17:26:08 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout08.t-online.de (Postfix) with SMTP id AC1991D7C
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 18:26:05 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.0.156]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n1tl7-0OuqlI0; Mon, 27 Dec 2021 18:26:05 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:42670)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n1tl7-00014Z-8Z
 for buildroot@buildroot.org; Mon, 27 Dec 2021 18:26:05 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 18:26:03 +0100
Message-Id: <20211227172604.31575-8-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211227172604.31575-1-bernd.kuhls@t-online.de>
References: <20211227172604.31575-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640625965-0001606D-ED658A57/0/0 CLEAN NORMAL
X-TOI-MSGID: d6f26210-d5fb-4cf7-a90c-ab1b9ed2f616
Subject: [Buildroot] [PATCH 8/9] package/kodi-visualisation-spectrum: bump
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
 .../kodi-visualisation-spectrum.hash                            | 2 +-
 .../kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index d770b40092..26cb7e3c77 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  32b130c26581c224e9b43672ccb5c947f2f4982e6d2ab12e389b41a9ceeb0e3f  kodi-visualisation-spectrum-19.0.0-Matrix.tar.gz
+sha256  37cea1b82e4b70ab60494b6fe31a5dfd56d7e4feff16347d661f5d14c2f28724  kodi-visualisation-spectrum-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index ca01ea270c..09aefd63fa 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = 19.0.0-Matrix
+KODI_VISUALISATION_SPECTRUM_VERSION = 19.0.1-Matrix
 KODI_VISUALISATION_SPECTRUM_SITE = $(call github,xbmc,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
