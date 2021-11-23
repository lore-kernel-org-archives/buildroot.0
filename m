Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE29C433EF
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 07:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9638402E1;
	Tue, 23 Nov 2021 07:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pOc13wBZsoSP; Tue, 23 Nov 2021 07:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0257540247;
	Tue, 23 Nov 2021 07:15:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FCE01BF573
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 07:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FD176063B
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 07:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JCFDATUz_NPG for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 07:14:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88B8860622
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 07:14:59 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout06.t-online.de (Postfix) with SMTP id 7B51513DA
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 08:14:08 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.176.215]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mpQ0E-2GGrnF0; Tue, 23 Nov 2021 08:14:06 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:47772)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mpQ0D-0004P7-QY
 for buildroot@buildroot.org; Tue, 23 Nov 2021 08:14:05 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 23 Nov 2021 08:14:03 +0100
Message-Id: <20211123071405.9376-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211123071405.9376-1-bernd.kuhls@t-online.de>
References: <20211123071405.9376-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1637651646-00001454-3F90BE52/0/0 CLEAN NORMAL
X-TOI-MSGID: c3f01ed1-945c-4409-b2f1-0470a51da7c8
Subject: [Buildroot] [PATCH/next 2/4] package/kodi-audioencoder-lame: bump
 version to 19.1.1-Matrix
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
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index 080bef06d2..f39b1f7a82 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  054593ea6572cd1e6ea771758bd759c630f47abef1ad2eeb332d453fc6c03e0b  kodi-audioencoder-lame-19.1.0-Matrix.tar.gz
+sha256  eb75e1cb069e977887003d3f11cc73a1ecf885c7fb9c03950cd5c918dc64820a  kodi-audioencoder-lame-19.1.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index d2c2750022..9048d4d730 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 19.1.0-Matrix
+KODI_AUDIOENCODER_LAME_VERSION = 19.1.1-Matrix
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
