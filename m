Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79290C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 11:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A6FB82004;
	Sun,  7 May 2023 11:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A6FB82004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVDnHgco3ps6; Sun,  7 May 2023 11:42:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4804582038;
	Sun,  7 May 2023 11:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4804582038
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B1751BF301
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 11:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01C9460B9F
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 11:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01C9460B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qBgRlkmkIa7 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 11:42:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDAD660B91
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDAD660B91
 for <buildroot@buildroot.org>; Sun,  7 May 2023 11:42:32 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout04.t-online.de (Postfix) with SMTP id C97C24D1F
 for <buildroot@buildroot.org>; Sun,  7 May 2023 13:42:30 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd73.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvcmW-1VGbTN0; Sun, 7 May 2023 13:42:24 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:60270)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvcmW-0003uR-1I
 for buildroot@buildroot.org; Sun, 07 May 2023 13:42:24 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 13:42:24 +0200
Message-Id: <20230507114224.3774853-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507114224.3774853-1-bernd.kuhls@t-online.de>
References: <20230507114224.3774853-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683459744-17094CF2-1FBDEE76/0/0 CLEAN NORMAL
X-TOI-MSGID: 421e8f3c-cd24-4aac-aad2-e72f1474ce25
Subject: [Buildroot] [PATCH 3/3] package/kodi-inputstream-adaptive: update
 license info
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

Include all licenses mentioned in LICENSES/README.md and update the
deprecated SPDX identifier for the GPL-2.0 license:
https://spdx.org/licenses/GPL-2.0+.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-inputstream-adaptive.hash                       | 1 +
 .../kodi-inputstream-adaptive.mk                         | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 4c5eafc4b6..f562fe193c 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,3 +1,4 @@
 # Locally computed
 sha256  6454f40c6e89e7ce2a9492197954bbef856ee83e242ef610c905d42aed7484d7  kodi-inputstream-adaptive-20.3.7-Nexus.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
+sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 6d97f1766b..b58047b899 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -6,8 +6,13 @@
 
 KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.7-Nexus
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
-KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
-KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.md
+KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
+	BSD-2-Clause-Views \
+	BSD-3-Clause \
+	google-patent-license-webm \
+	GPL-2.0-or-later \
+	RSA-MD5
+KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.md LICENSES/README.md
 KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = bento4 expat kodi
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
