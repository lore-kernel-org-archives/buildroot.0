Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E582EC77B60
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 12:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6487A42046;
	Fri, 28 Apr 2023 12:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6487A42046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id os5zXYvlcomT; Fri, 28 Apr 2023 12:23:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E63941C5A;
	Fri, 28 Apr 2023 12:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E63941C5A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 103B81BF584
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 12:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E972941C3F
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 12:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E972941C3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aDX1QSdIRlOd for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 12:23:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE59641BE3
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE59641BE3
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 12:23:47 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout04.t-online.de (Postfix) with SMTP id 2949E19A3;
 Fri, 28 Apr 2023 14:23:45 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.3.195]) by fwd85.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1psN8a-2G0duL0; Fri, 28 Apr 2023 14:23:44 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:52462)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1psN8Z-0001V2-2g;
 Fri, 28 Apr 2023 14:23:43 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 14:23:43 +0200
Message-Id: <20230428122343.211709-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230428122343.211709-1-bernd.kuhls@t-online.de>
References: <20230428122343.211709-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1682684624-977FDC52-0CADF0D0/0/0 CLEAN NORMAL
X-TOI-MSGID: bf1adf35-5ccb-41ed-8c55-28f7fd66889b
Subject: [Buildroot] [PATCH 3/3] package/intel-mediasdk: bump version to
 23.2.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-mediasdk/intel-mediasdk.hash | 2 +-
 package/intel-mediasdk/intel-mediasdk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
index bdd4c7f3a6..4b5779169b 100644
--- a/package/intel-mediasdk/intel-mediasdk.hash
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f1bb11ddaa44d5827562600e0a989ca20550e1b021314bce32bc4957352da110  intel-mediasdk-23.1.3.tar.gz
+sha256  6b33ec917ef0c6395fb66c7b93aae4ae31b3d1dedb5d7d39e0c69f45acb7c4fb  intel-mediasdk-23.2.0.tar.gz
 sha256  dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index 9843ec3502..c09d81aa2d 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MEDIASDK_VERSION = 23.1.3
+INTEL_MEDIASDK_VERSION = 23.2.0
 INTEL_MEDIASDK_SITE = https://github.com/Intel-Media-SDK/MediaSDK/archive
 INTEL_MEDIASDK_LICENSE = MIT
 INTEL_MEDIASDK_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
