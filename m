Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66ABC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 17:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39A65409DD;
	Thu, 21 Apr 2022 17:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wujXlc6B6SYW; Thu, 21 Apr 2022 17:24:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FE9C405C4;
	Thu, 21 Apr 2022 17:24:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BCF01BF3D1
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 864CB60F7A
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id foNJLnrYPmZU for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 17:24:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7537660EAC
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 17:24:46 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout03.t-online.de (Postfix) with SMTP id 0E3A149AC;
 Thu, 21 Apr 2022 19:24:09 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.196.216]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nhaXH-4JK0nJ0; Thu, 21 Apr 2022 19:24:07 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:51098)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nhaXH-0007Al-3j;
 Thu, 21 Apr 2022 19:24:07 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:24:07 +0200
Message-Id: <20220421172407.2759939-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421172407.2759939-1-bernd.kuhls@t-online.de>
References: <20220421172407.2759939-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1650561847-0001606D-197E4891/0/0 CLEAN NORMAL
X-TOI-MSGID: 2ef14fe4-c3a3-4a50-b689-21adf4ebc53a
Subject: [Buildroot] [PATCH 2/2] package/intel-mediasdk: bump version to
 22.4.0
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
index 802131a772..3ca50d629e 100644
--- a/package/intel-mediasdk/intel-mediasdk.hash
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e1e74229f409e969b70c2b35b1955068de3d40db85ecc42bd6ff501468bc76d7  intel-mediasdk-22.3.0.tar.gz
+sha256  c1ebabf4c9a32de4349d9a9c707116b230cbf8a9c4655eec9ee844fd67dab6e8  intel-mediasdk-22.4.0.tar.gz
 sha256  dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index b90d252b4f..06b7aa87d0 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MEDIASDK_VERSION = 22.3.0
+INTEL_MEDIASDK_VERSION = 22.4.0
 INTEL_MEDIASDK_SITE = https://github.com/Intel-Media-SDK/MediaSDK/archive
 INTEL_MEDIASDK_LICENSE = MIT
 INTEL_MEDIASDK_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
