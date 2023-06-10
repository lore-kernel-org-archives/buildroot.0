Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6B5C7EE2E
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 08:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 860F6401ED;
	Sat, 10 Jun 2023 08:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 860F6401ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gmCwPvvzOlZk; Sat, 10 Jun 2023 08:35:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C21A840114;
	Sat, 10 Jun 2023 08:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C21A840114
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CB511BF35E
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 08:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1687283BE7
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 08:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1687283BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgD58ekLiLaR for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 08:35:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFC6383BE0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFC6383BE0
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 08:35:34 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout10.t-online.de (Postfix) with SMTP id A66D137DEB;
 Sat, 10 Jun 2023 10:35:30 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd89.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7u4H-2E6OsT0; Sat, 10 Jun 2023 10:35:29 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:50510)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7u4G-0001Cs-2V;
 Sat, 10 Jun 2023 10:35:28 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 10:35:28 +0200
Message-Id: <20230610083528.3232068-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686386129-FBFE8283-C47A8837/0/0 CLEAN NORMAL
X-TOI-MSGID: f3547c07-e5ed-49fa-84cf-aeda19e7f1f5
Subject: [Buildroot] [PATCH 1/1] package/lcms2: bump version to 2.15
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://littlecms.com/blog/2023/03/01/lcms2-2.15/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lcms2/lcms2.hash | 6 +++---
 package/lcms2/lcms2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index 700b9746f1..45728a36f1 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.14
-sha1  94350a2638fe58da736e8726048c859b46a69e6f  lcms2-2.14.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.15
+sha1  b143ff29b03676119dbca30f13cbed72af15cce8  lcms2-2.15.tar.gz
 # Locally computed:
-sha256  28474ea6f6591c4d4cee972123587001a4e6e353412a41b3e9e82219818d5740  lcms2-2.14.tar.gz
+sha256  b20cbcbd0f503433be2a4e81462106fa61050a35074dc24a4e356792d971ab39  lcms2-2.15.tar.gz
 sha256  46d4e05af3bce75332a12d01f19bcce7e32b6bac544be28a64043d0231291e31  COPYING
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 743b0ec858..3892dbfbdc 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.14
+LCMS2_VERSION = 2.15
 LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
