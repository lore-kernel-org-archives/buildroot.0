Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CCEC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 11:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EA0A82660;
	Sun,  7 May 2023 11:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EA0A82660
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ecQzGokrWUTQ; Sun,  7 May 2023 11:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C57A78202F;
	Sun,  7 May 2023 11:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C57A78202F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9E921BF301
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 11:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFBEB8205A
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 11:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFBEB8205A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TB_p34fA0eXN for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 11:42:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91BAB82034
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91BAB82034
 for <buildroot@buildroot.org>; Sun,  7 May 2023 11:42:42 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout01.t-online.de (Postfix) with SMTP id D4E563767E
 for <buildroot@buildroot.org>; Sun,  7 May 2023 13:42:24 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd81.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvcmW-3Z8cWP0; Sun, 7 May 2023 13:42:24 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:60270)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvcmW-0003uR-17
 for buildroot@buildroot.org; Sun, 07 May 2023 13:42:24 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 13:42:23 +0200
Message-Id: <20230507114224.3774853-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507114224.3774853-1-bernd.kuhls@t-online.de>
References: <20230507114224.3774853-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683459744-F0F94C73-4594EA66/0/0 CLEAN NORMAL
X-TOI-MSGID: 6433aed0-9919-4286-89dc-490bc14e43a1
Subject: [Buildroot] [PATCH 2/3] package/kodi-inputstream-adaptive: bump
 version to 20.3.7-Nexus
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

Depends on bento4 version bump included in this patch series:
https://github.com/xbmc/inputstream.adaptive/commit/55fbc78aaf081b63773fe98cfd03b1bbed8642a5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 18df044c62..4c5eafc4b6 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  907915228335eeb9217e6f069cbb210fffce01095a6326908015cd89165a0328  kodi-inputstream-adaptive-20.3.6-Nexus.tar.gz
+sha256  6454f40c6e89e7ce2a9492197954bbef856ee83e242ef610c905d42aed7484d7  kodi-inputstream-adaptive-20.3.7-Nexus.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 1f3e86bb27..6d97f1766b 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.6-Nexus
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.7-Nexus
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
