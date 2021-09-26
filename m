Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D61C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 11:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CA4D61038
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 11:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CA4D61038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C928780B96;
	Sun, 26 Sep 2021 11:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id orYa4r6WfqJu; Sun, 26 Sep 2021 11:57:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BA5D80EF3;
	Sun, 26 Sep 2021 11:57:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5AF1BF354
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 11:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F205480EF3
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 11:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CnuJFmuQ2K2u for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 11:57:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D00D80B96
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 11:57:21 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout05.t-online.de (Postfix) with SMTP id 592D13C2A
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 13:57:18 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.205.79]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mUSmU-25hJCL0; Sun, 26 Sep 2021 13:57:18 +0200
Received: from [192.168.1.109] (port=47022 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mUSmT-0000iz-My
 for buildroot@buildroot.org; Sun, 26 Sep 2021 13:57:17 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 13:56:37 +0200
Message-Id: <20210926115717.1687968-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210926115717.1687968-1-bernd.kuhls@t-online.de>
References: <20210926115717.1687968-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1632657438-00001454-B4D11BA8/0/0 CLEAN NORMAL
X-TOI-MSGID: e9549d37-b452-4a45-bf93-22216eb21548
Subject: [Buildroot] [PATCH 02/42] package/kodi-audiodecoder-stsound: bump
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
 .../kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash    | 2 +-
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index ae6a5aa528..d370ca5566 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  65b452cd3bdf8b21929084ca0dc238147784defdfb25351c857fa459230e2f3f  kodi-audiodecoder-stsound-3.0.0-Matrix.tar.gz
+sha256  dc168de296dafae86a83e36f687f4dd4fd41c3d3134afbb05415f860f750e779  kodi-audiodecoder-stsound-19.0.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index 6a5bb721bc..bd432e734a 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_STSOUND_VERSION = 3.0.0-Matrix
+KODI_AUDIODECODER_STSOUND_VERSION = 19.0.0-Matrix
 KODI_AUDIODECODER_STSOUND_SITE = $(call github,xbmc,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
 KODI_AUDIODECODER_STSOUND_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_STSOUND_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
