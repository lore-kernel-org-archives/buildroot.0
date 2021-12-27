Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC7DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 17:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD553401F6;
	Mon, 27 Dec 2021 17:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-Ivhf_4GTfh; Mon, 27 Dec 2021 17:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBC634044D;
	Mon, 27 Dec 2021 17:27:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66CA51BF3E1
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 17:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 653ED409DE
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 17:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRSnQBVW7hfZ for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 17:26:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4C19409DA
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 17:26:25 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout02.t-online.de (Postfix) with SMTP id 812CF3034
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 18:26:05 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.0.156]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n1tl7-0OuqlF0; Mon, 27 Dec 2021 18:26:05 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:42670)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n1tl6-00014Z-Pw
 for buildroot@buildroot.org; Mon, 27 Dec 2021 18:26:04 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 18:25:56 +0100
Message-Id: <20211227172604.31575-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640625965-0001606D-064DC54F/0/0 CLEAN NORMAL
X-TOI-MSGID: d0d06d73-af54-4d46-be29-966e194337dc
Subject: [Buildroot] [PATCH 1/9] package/kodi-screensaver-asterwave: bump
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
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash  | 2 +-
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index 91c3d61091..95c37a8e69 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  90b60cb321db34de16a9b64068ab3b78ab81c0d44e62bda0d03535ddb4ae1ebc  kodi-screensaver-asterwave-19.0.0-Matrix.tar.gz
+sha256  e1d97cf5628dd844745d152a2b3633a22c720c35ef0e81aa61857f47a78003aa  kodi-screensaver-asterwave-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index 21def8ca4c..2ae243eba0 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = 19.0.0-Matrix
+KODI_SCREENSAVER_ASTERWAVE_VERSION = 19.0.1-Matrix
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,xbmc,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
