Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69912C77B78
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 16:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1B9B6153E;
	Wed,  3 May 2023 16:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1B9B6153E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fkwoeU3D7Edx; Wed,  3 May 2023 16:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D942161544;
	Wed,  3 May 2023 16:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D942161544
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BE6D1BF3FF
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 16:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06498819F3
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 16:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06498819F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INzu4ay_yV-Y for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 16:45:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D595A818CA
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D595A818CA
 for <buildroot@buildroot.org>; Wed,  3 May 2023 16:45:17 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout10.t-online.de (Postfix) with SMTP id 30F521970D
 for <buildroot@buildroot.org>; Wed,  3 May 2023 18:45:00 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.11.39]) by fwd71.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1puFbA-1po2xl0; Wed, 3 May 2023 18:45:00 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:51960)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1puFb9-0002ho-2c
 for buildroot@buildroot.org; Wed, 03 May 2023 18:44:59 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 18:44:52 +0200
Message-Id: <20230503164458.747478-5-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503164458.747478-1-bernd.kuhls@t-online.de>
References: <20230503164458.747478-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683132300-8F7FDC12-EFC91B47/0/0 CLEAN NORMAL
X-TOI-MSGID: 76e26287-f43e-4a47-9e92-2358606730de
Subject: [Buildroot] [PATCH 05/11] package/kodi-inputstream-adaptive: bump
 version to Nexus
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

Added dependency to bento4 needed after upstream commit
https://github.com/xbmc/inputstream.adaptive/commit/70625e76702186c73ddb43440f44262c48e14755

License file renamed
https://github.com/xbmc/inputstream.adaptive/commit/b555973d98e15bb40022dd1ab704d8d42efd7686
and updated upstream
https://github.com/xbmc/inputstream.adaptive/commit/4b62e9e3257526e0359e0b797902ba9119633c16

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-inputstream-adaptive/Config.in                 | 1 +
 .../kodi-inputstream-adaptive.hash                          | 4 ++--
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
index f0a24b7043..3efe3aa114 100644
--- a/package/kodi-inputstream-adaptive/Config.in
+++ b/package/kodi-inputstream-adaptive/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE
 	# wvdecrypter/cdm/build/build_config.h
 	depends on BR2_aarch64 || BR2_arm || BR2_i386 || BR2_mipsel \
 		|| BR2_mips64el || BR2_x86_64
+	select BR2_PACKAGE_BENTO4
 	select BR2_PACKAGE_EXPAT
 	help
 	  Kodi inputstream addon for several manifest types
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index a36095c38c..18df044c62 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b208313fd50442cabd339a16a3beec8cfa41c1b6bf19617ffeb269144c5f65fe  kodi-inputstream-adaptive-19.0.7-Matrix.tar.gz
-sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
+sha256  907915228335eeb9217e6f069cbb210fffce01095a6326908015cd89165a0328  kodi-inputstream-adaptive-20.3.6-Nexus.tar.gz
+sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 9da87e0e38..1f3e86bb27 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 19.0.7-Matrix
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.6-Nexus
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
-KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
-KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = expat kodi
+KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.md
+KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = bento4 expat kodi
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
