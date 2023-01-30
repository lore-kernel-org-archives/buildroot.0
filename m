Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DBFC54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 17:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD1E781E81;
	Mon, 30 Jan 2023 17:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD1E781E81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHY-cbDJuhI0; Mon, 30 Jan 2023 17:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 273F681C19;
	Mon, 30 Jan 2023 17:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 273F681C19
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16E7B1BF28E
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 17:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E535560FB8
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 17:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E535560FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xsosXVHxU_iA for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 17:44:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B76B060FAE
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B76B060FAE
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 17:44:35 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout12.t-online.de (Postfix) with SMTP id 5BBABD0BE;
 Mon, 30 Jan 2023 18:43:40 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.195.67]) by fwd82.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pMYBw-3vM0V00; Mon, 30 Jan 2023 18:43:40 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:59284)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pMYBv-00052S-31;
 Mon, 30 Jan 2023 18:43:39 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 18:43:39 +0100
Message-Id: <20230130174339.36794-5-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130174339.36794-1-bernd.kuhls@t-online.de>
References: <20230130174339.36794-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675100620-12796992-918E624A/0/0 CLEAN NORMAL
X-TOI-MSGID: f9755630-a3f3-4629-a6c7-eef500d00958
Subject: [Buildroot] [PATCH 5/5] package/intel-mediasdk: bump version to
 23.1.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Louis-Paul Cordier <lpdev@cordier.org>
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
index 903b6f3394..a2c4243790 100644
--- a/package/intel-mediasdk/intel-mediasdk.hash
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3a671cc692da5111c041088f5e32528b4346e122e8a134fad71310c572705106  intel-mediasdk-22.6.5.tar.gz
+sha256  9208c35641ba995760d662689426a6c433973cf5283b8510f9cfb774e4b9cb38  intel-mediasdk-23.1.0.tar.gz
 sha256  dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index f7bce30c74..462d487ebe 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MEDIASDK_VERSION = 22.6.5
+INTEL_MEDIASDK_VERSION = 23.1.0
 INTEL_MEDIASDK_SITE = https://github.com/Intel-Media-SDK/MediaSDK/archive
 INTEL_MEDIASDK_LICENSE = MIT
 INTEL_MEDIASDK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
