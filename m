Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B832BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 19:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ACA660EBD;
	Sun, 12 Dec 2021 19:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 57zaaYkGWBk2; Sun, 12 Dec 2021 19:17:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8775460EAE;
	Sun, 12 Dec 2021 19:17:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5966A1BF300
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 19:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 401B942986
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 19:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCrA0Qv3MbJg for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 19:17:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E3AF42981
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 19:17:09 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout05.t-online.de (Postfix) with SMTP id C4360188B7
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 20:17:06 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.188.64]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mwULK-0htm5J0; Sun, 12 Dec 2021 20:17:06 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:46268)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mwULK-0001uU-12
 for buildroot@buildroot.org; Sun, 12 Dec 2021 20:17:06 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 20:17:06 +0100
Message-Id: <20211212191706.6408-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1639336626-00001454-74F0D99B/0/0 CLEAN NORMAL
X-TOI-MSGID: bd83d1e9-299f-4184-9463-d1b4c121072a
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-plutotv: bump version to
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
https://github.com/kodi-pvr/pvr.plutotv/blob/Matrix/pvr.plutotv/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
index 3ad0d4e875..6f115bb8f8 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0b85c5c9583239bcecccccc2c43fc6d604bf5a4e4304238c8635410823ab8ae3  kodi-pvr-plutotv-19.0.0-Matrix.tar.gz
+sha256  1707cd9c61e6874f7e3ea75e1136ea0ccdf8be67a2a41ee09feab746a36f4d14  kodi-pvr-plutotv-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index 15c7135880..f2d1879b6e 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 19.0.0-Matrix
+KODI_PVR_PLUTOTV_VERSION = 19.0.1-Matrix
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
