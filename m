Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA54FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 11:58:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 572726103B
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 11:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 572726103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32A8E81A81;
	Sun, 26 Sep 2021 11:58:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJ7LXWextx2s; Sun, 26 Sep 2021 11:58:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CAD681A73;
	Sun, 26 Sep 2021 11:58:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FD541BF354
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 11:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F8C580F1D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 11:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILEXrUOyPXYG for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 11:57:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74C6780F06
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 11:57:23 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout11.t-online.de (Postfix) with SMTP id 4751D2580
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 13:57:21 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.205.79]) by fwd78.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mUSmW-1yLO6r0; Sun, 26 Sep 2021 13:57:20 +0200
Received: from [192.168.1.109] (port=47022 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mUSmW-0000iz-DE
 for buildroot@buildroot.org; Sun, 26 Sep 2021 13:57:20 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 13:56:50 +0200
Message-Id: <20210926115717.1687968-15-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210926115717.1687968-1-bernd.kuhls@t-online.de>
References: <20210926115717.1687968-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1632657440-0000146A-FC556BD3/0/0 CLEAN NORMAL
X-TOI-MSGID: 876acde8-2963-4bdc-9cf1-74dbc90f3d82
Subject: [Buildroot] [PATCH 15/42] package/kodi-screensaver-asteroids: bump
 version to 19.0.0-Matrix
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
 .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash  | 2 +-
 .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index a8886d2733..e5702b2243 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b60d0123dd2ad2326a03b2a66a3cdba3ac17f0a109c4ecedc3216699ca28cae2  kodi-screensaver-asteroids-2.6.0-Matrix.tar.gz
+sha256  cbe9f12e650cf81800f609ebab614e47e9366fbc8905e51d445646a75bc5a000  kodi-screensaver-asteroids-19.0.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index add0ca5b9b..bbeb02e512 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = 2.6.0-Matrix
+KODI_SCREENSAVER_ASTEROIDS_VERSION = 19.0.0-Matrix
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,xbmc,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
