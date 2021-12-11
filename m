Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6353C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 18:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3674A6149F;
	Sat, 11 Dec 2021 18:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ScYJCAmhG1-1; Sat, 11 Dec 2021 18:55:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 747CE60D6A;
	Sat, 11 Dec 2021 18:55:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36B651BF3D4
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 18:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A909429FE
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 18:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hGgvR6JxKKvR for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 18:55:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 661D8429FD
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 18:55:27 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout04.t-online.de (Postfix) with SMTP id 7F2DF3696
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 19:55:24 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.123]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mw7Wk-0wmcDZ0; Sat, 11 Dec 2021 19:55:22 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:48800)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mw7Wj-0004uG-Jc
 for buildroot@buildroot.org; Sat, 11 Dec 2021 19:55:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 19:55:20 +0100
Message-Id: <20211211185521.2621478-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211211185521.2621478-1-bernd.kuhls@t-online.de>
References: <20211211185521.2621478-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1639248922-000010D9-69365117/0/0 CLEAN NORMAL
X-TOI-MSGID: 07cfb780-16cd-4fa7-af5d-50dfa26c84ae
Subject: [Buildroot] [PATCH 2/3] package/kodi-pvr-mediaportal-tvserver: bump
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

Release notes:
https://github.com/kodi-pvr/pvr.mediaportal.tvserver/releases/tag/19.0.1-Matrix

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-pvr-mediaportal-tvserver.hash                          | 2 +-
 .../kodi-pvr-mediaportal-tvserver.mk                            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index 51b3269afc..72c28d4aef 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  05cc8722b7f35c230726941ae7e3082bbc13ed4d061775696fb8bad4abb7b847  kodi-pvr-mediaportal-tvserver-19.0.0-Matrix.tar.gz
+sha256  e7947b0428fc394220138bedf1b56fce0ed7f5218d2f3e773d5fec62edbdc95e  kodi-pvr-mediaportal-tvserver-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index c526a69fed..9ddfae91e6 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 19.0.0-Matrix
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 19.0.1-Matrix
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
