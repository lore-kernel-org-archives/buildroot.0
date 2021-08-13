Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FABC4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:16:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE8EA60F36
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE8EA60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C692606B8;
	Fri, 13 Aug 2021 13:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q_BthZL-UA9X; Fri, 13 Aug 2021 13:16:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA23A60BB2;
	Fri, 13 Aug 2021 13:16:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23C891C115D
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F77F80ADC
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:16:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iMJnnFHXfmRN for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:16:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3474580AD8
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:16:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C281C85FEA; Fri, 13 Aug 2021 13:15:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:15:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 372ccf6a19ec86bebecd40a584bb415f77db97ad
X-Git-Newrev: 5edce579d548c5029a652da2030454b616c0cd4d
X-Patchwork-Hint: ignore
Message-Id: <20210813131542.C281C85FEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/{mesa3d,
 mesa3d-headers}: bump version to 21.1.7
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=5edce579d548c5029a652da2030454b616c0cd4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes for this bugfix release:
https://lists.freedesktop.org/archives/mesa-announce/2021-August/000642.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 64587b4bcd..f569b53285 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.1.6
+MESA3D_HEADERS_VERSION = 21.1.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 4b63e0cece..3ff58f028e 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-July/000640.html
-sha256  b1cb0122f911dfa9fe1f209a7061378c61a1448a280e711511ca72dad9999e37  mesa-21.1.6.tar.xz
-sha512  5daf389aad4fe7ab3574f6af3aabc62ba8b3034004a0a0853dcc18ef6c8003d2f2195cc377dc57b30863ae4cf158149e3156247445ca2b11e401700011cb878c  mesa-21.1.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-August/000642.html
+sha256  e9e67c10654f2e4bf15b944bb048007a614292aa4792b1b7512eb700b7b3a7bb  mesa-21.1.7.tar.xz
+sha512  1fd677437f292c30fbf08bfef8c1088557841f426090ccba20ab2a222b08fb5c3ec48a7a0301466e03a23019d09414c700a4f5e299479cacd6972a9f3ba030c8  mesa-21.1.7.tar.xz
 
 # License
 sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6a53d203ef..54b50f684f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.1.6
+MESA3D_VERSION = 21.1.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
