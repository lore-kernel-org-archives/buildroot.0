Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9144C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 07:51:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59B696103B
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 07:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59B696103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CA474039F;
	Sun, 17 Oct 2021 07:51:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBjqZcUGlbWu; Sun, 17 Oct 2021 07:51:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D15040315;
	Sun, 17 Oct 2021 07:51:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D86C71BF2F8
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 07:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4DCD607D3
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 07:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id elJEFrptMDcY for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 07:51:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 789C860671
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 07:51:24 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout03.t-online.de (Postfix) with SMTP id 4DF177F9E
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 09:51:18 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.200.124]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mc0ww-3XgyZt0; Sun, 17 Oct 2021 09:51:18 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:60926)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mc0wv-000281-Kx
 for buildroot@buildroot.org; Sun, 17 Oct 2021 09:51:17 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 09:51:17 +0200
Message-Id: <20211017075117.28951-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1634457078-00001454-85AAC85E/0/0 CLEAN NORMAL
X-TOI-MSGID: ffd02dae-44a3-4202-9ceb-a80b6df0319b
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-nextpvr: bump version to
 19.0.1-Matrix
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

Changelog:
https://github.com/kodi-pvr/pvr.nextpvr/blob/Matrix/pvr.nextpvr/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 7935b72d99..53f25735c5 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  977131a4135aff8686c6a1b779d6637900630ba6483b3e46f0e221c8d01b8d6c  kodi-pvr-nextpvr-19.0.0-Matrix.tar.gz
+sha256  64b47658c0027a98465755cf422241f3d15810113a0fa9d0b819fb7da6670f8c  kodi-pvr-nextpvr-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index e524818f5a..36a053dbd5 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 19.0.0-Matrix
+KODI_PVR_NEXTPVR_VERSION = 19.0.1-Matrix
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
