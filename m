Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CD8C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 08:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33BD260B01;
	Sun, 11 Dec 2022 08:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33BD260B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NqBWutWRSiKW; Sun, 11 Dec 2022 08:15:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58354607F6;
	Sun, 11 Dec 2022 08:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58354607F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2CC301BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 079DE40886
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 079DE40886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORZtgY_uXuXq for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:15:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E11D4087A
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E11D4087A
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:15:23 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout03.t-online.de (Postfix) with SMTP id 2C263EE76
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 09:15:21 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4HUQ-3zkEuv0; Sun, 11 Dec 2022 09:15:14 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:37350)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4HUQ-0002nq-0f
 for buildroot@buildroot.org; Sun, 11 Dec 2022 09:15:14 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:15:13 +0100
Message-Id: <20221211081514.3138057-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670746514-F9452742-0DE01F28/0/0 CLEAN NORMAL
X-TOI-MSGID: 458b1d5d-1909-4436-91ba-a2737d08287f
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{4, 10, 15}.x / 6.0.x series
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
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 3631fcb6d6..c1c690f4cc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.0.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.0.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.145-cip17" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.145-cip17-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 0af02e1326..8739da4f75 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  6114a208e82739b4a1ab059ace35262be2a83be34cd1ae23cb8a09337db831c7  linux-6.0.9.tar.xz
+sha256  89b730edf8942b49e02f9894244205886c9a214d629b35b88c4ff06ee9304f01  linux-6.0.12.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c93bb384a97ad1f0a4f18e442ce0291242722f78023eca658b22344541f09489  linux-5.19.17.tar.xz
-sha256  cba39031dbc0eed0785b8afdc8c58cf23df83e47001b2354fa44486ae699c154  linux-5.15.79.tar.xz
-sha256  f1b027526c58e7bd127f35b17736e4a6c865866b9048898f05c5358d4d52d4f3  linux-5.10.155.tar.xz
-sha256  8b7df25b5560620eb2776d7b7c67569764b3916ff2f596767f72567b38d13d36  linux-5.4.224.tar.xz
+sha256  fceef6bb79bac494663ccde34453521fc616cd94272fd30564752b3742381b65  linux-5.15.82.tar.xz
+sha256  1e0a24bb5510caa18b3601b25e12cc2a1ce123948de551f4f2cdbb40aea707e7  linux-5.10.158.tar.xz
+sha256  0c1f552a1d2f63b3ecd4d33189f0003bc91fb8ff79967a7e295d015c280c9a44  linux-5.4.226.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  41bf80c4766ba9915470afe97ead6a16faff484b94590387012ce7f9ce41502b  linux-4.9.333.tar.xz
-sha256  26233603ae992cd31e9f78066d54475b3e3f878ab0e3fd271e74a795ab60b15c  linux-4.14.299.tar.xz
-sha256  37406ead61149283973bccdf670a1fd020c2f19722b7176e88ec8567df6dacd0  linux-4.19.265.tar.xz
+sha256  ed4fd861fe9f6cd09f409f00dcccfa691e6d1a61c585723e587575dcb60aeb29  linux-4.9.335.tar.xz
+sha256  acd2ee8e03da098fe9f7e52871dd0790850fc32b78657606bdf65bdd94bbf99b  linux-4.14.301.tar.xz
+sha256  219bce1ac3f542d06fc606ae6bcb10f8ab1940a46c7903113be59afc486c204f  linux-4.19.268.tar.xz
 # Locally computed
 sha256  4594c147bdc493c7c286688542bbe65e550fb7bd58e0649ec587a2fe893ec0ee  linux-cip-5.10.145-cip17.tar.gz
 sha256  a5598f7f673b3ef819d6ed24f08d539eecb6febd11673a1d4752a1c05d4ee289  linux-cip-5.10.145-cip17-rt7.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f72e7f408c..24f51418e6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -392,14 +392,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.9.333"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.299"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.265"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.224"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.155"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.79"	if BR2_KERNEL_HEADERS_5_15
+	default "4.9.335"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.301"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.268"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.226"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.158"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.82"	if BR2_KERNEL_HEADERS_5_15
 	default "5.19.17"	if BR2_KERNEL_HEADERS_5_19
-	default "6.0.9"		if BR2_KERNEL_HEADERS_6_0
+	default "6.0.12"	if BR2_KERNEL_HEADERS_6_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
