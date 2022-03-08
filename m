Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4ECC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 16:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A40A41547;
	Tue,  8 Mar 2022 16:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhT8sZ_tXM39; Tue,  8 Mar 2022 16:40:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1FBA408A0;
	Tue,  8 Mar 2022 16:40:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B43C1BF344
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 16:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 284F48413E
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 16:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KuRZ62KWvAK5 for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 16:40:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6615D84133
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 16:40:37 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout01.t-online.de (Postfix) with SMTP id A0B45683D
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 17:40:34 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.199.122]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nRct0-3Cx9t30; Tue, 8 Mar 2022 17:40:34 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:41730)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nRct0-0004YM-4C
 for buildroot@buildroot.org; Tue, 08 Mar 2022 17:40:34 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue,  8 Mar 2022 17:40:34 +0100
Message-Id: <20220308164034.85212-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1646757634-0000B7AB-C1647BC8/0/0 CLEAN NORMAL
X-TOI-MSGID: 99223cc3-8fa0-49ca-8ecf-3c07e72cef78
Subject: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-hdhomerun: bump
 version to 19.1.0-Matrix
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
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash | 2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index 4c866b59d8..f177eabd53 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6a5e5135b176d9aeba35e16fb6ce48ce7323c53960457597e25c2962b126cca2  kodi-pvr-hdhomerun-19.0.2-Matrix.tar.gz
+sha256  cfd2695f38b0c0e3c7e7490e17476c2b82e2bbf18f0993d8041c7f15f6640cdd  kodi-pvr-hdhomerun-19.1.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index 5c6829cee3..a4a448c51e 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HDHOMERUN_VERSION = 19.0.2-Matrix
+KODI_PVR_HDHOMERUN_VERSION = 19.1.0-Matrix
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
