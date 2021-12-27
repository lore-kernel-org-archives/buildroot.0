Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF6BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 17:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49ACD60E27;
	Mon, 27 Dec 2021 17:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-3ALEIyMK5c; Mon, 27 Dec 2021 17:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B018760D71;
	Mon, 27 Dec 2021 17:26:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDC3F1BF3E1
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 17:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE403409DA
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 17:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlT3SYYNqspV for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 17:26:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15CC5409D3
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 17:26:11 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout01.t-online.de (Postfix) with SMTP id 13229EBF
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 18:26:07 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.0.156]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n1tl7-3YNb9t0; Mon, 27 Dec 2021 18:26:05 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:42670)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n1tl6-00014Z-S4
 for buildroot@buildroot.org; Mon, 27 Dec 2021 18:26:04 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 18:25:57 +0100
Message-Id: <20211227172604.31575-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211227172604.31575-1-bernd.kuhls@t-online.de>
References: <20211227172604.31575-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640625965-000116DC-CB68FB60/0/0 CLEAN NORMAL
X-TOI-MSGID: 06a2d8fd-de45-44a3-8f35-10172d3af3fe
Subject: [Buildroot] [PATCH 2/9] package/kodi-screensaver-cpblobs: bump
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
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index ed0dae2c56..80dfbad357 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  947ce3bd4edd86da3e01e92ea2da804ca27ffef2fe2492dbf8b5fc8299c52890  kodi-screensaver-cpblobs-19.0.0-Matrix.tar.gz
+sha256  f281efde421cfe9d5f251520853e43e8b1ee128de216af760fcafb80861f504b  kodi-screensaver-cpblobs-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index 6f462e7d27..9ca6718c92 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CPBLOBS_VERSION = 19.0.0-Matrix
+KODI_SCREENSAVER_CPBLOBS_VERSION = 19.0.1-Matrix
 KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,xbmc,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPL-2.0
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
