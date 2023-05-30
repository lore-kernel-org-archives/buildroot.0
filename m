Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFC1C7EE24
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 17:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 646B081EE0;
	Tue, 30 May 2023 17:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 646B081EE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzBKMAu2HdSz; Tue, 30 May 2023 17:22:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84AEA81EB5;
	Tue, 30 May 2023 17:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84AEA81EB5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CCC61BF5DA
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 17:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 765EE81EB5
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 17:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 765EE81EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QT1kkE81lcsb for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 17:22:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6DE381E9F
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6DE381E9F
 for <buildroot@buildroot.org>; Tue, 30 May 2023 17:22:53 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout09.t-online.de (Postfix) with SMTP id 6DBB52098A
 for <buildroot@buildroot.org>; Tue, 30 May 2023 19:22:50 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd81.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q433V-1NIjdR0; Tue, 30 May 2023 19:22:45 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:41708)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q433V-0001C6-04
 for buildroot@buildroot.org; Tue, 30 May 2023 19:22:45 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 19:22:44 +0200
Message-Id: <20230530172244.1182485-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1685467365-D97F8DA8-7FEB4DB7/0/0 CLEAN NORMAL
X-TOI-MSGID: 470e7104-23ed-4d6c-bbbe-ef3c88371b8d
Subject: [Buildroot] [PATCH/next 1/1] package/kodi-inputstream-adaptive:
 bump version to 20.3.9-Nexus
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
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 63f34d7460..b81c5a3c67 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  db972656dc42ce1e443b8aed8d410feb5093603b9c2beb3875eb6fafa3c9f3a9  kodi-inputstream-adaptive-20.3.8-Nexus.tar.gz
+sha256  02bc1048115c4affd0bf3f6cbb6ea15b06b1830831ba1892668334b99f7097a7  kodi-inputstream-adaptive-20.3.9-Nexus.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index ea150f1201..1fa2b026e2 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.8-Nexus
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.9-Nexus
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
