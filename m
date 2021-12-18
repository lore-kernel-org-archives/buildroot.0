Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DB6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 18:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9316611BD;
	Sat, 18 Dec 2021 18:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tkB_BKz59wA2; Sat, 18 Dec 2021 18:41:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B9BC60F48;
	Sat, 18 Dec 2021 18:41:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A88D1BF2AA
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 18:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09B4460F48
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 18:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGJaglm2OCnz for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 18:41:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0288C60EB7
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 18:41:46 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.12.215])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 08CAE13F84C;
 Sat, 18 Dec 2021 19:41:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639852903;
 bh=nduG6vl+ZNMgRpT8nHivmFlCBYip6Yjm1v5zACQD5VI=;
 h=From:To:Cc:Subject:Date:From;
 b=mbUabo/kGmoEp4yb6iM5nqeHmgM3k23cpRklD+3Gs5FncUFA98UwGUFKAAkotCjOC
 SYbv4Bgd4spjS2GZCK7jdlwhXa2odkSemV1iLRj6L25qqVcwq7Iq6SamQWXAcdrxM2
 KyKc0A/3l67PTw4U3bdFeQrLYo+FiAp6u/nP+PH43F2Rk0xscYDC31RcZzD2UuaU0H
 6O54cwBBKvYWaHAQGy/QhPtxW0WKXpG2uW4/KWHXRXCIcESlZ/u1x/Yp8X+9oIYj+V
 OpEYy8MoEeFkgmx4s4KojtP1hlAzqQC01SMd5k7B6VHluWo5OODqN9IC0mGP83Rvn1
 blaH53cb0qmFQ==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 19:41:10 +0100
Message-Id: <20211218184110.725832-1-ju.o@free.fr>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.2.4
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since v2.2.3, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.4

./utils/test-pkg --package fluidsynth
6 builds, 2 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index d1fd162fb1..4e544bc7f6 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b31807cb0f88e97f3096e2b378c9815a6acfdc20b0b14f97936d905b536965c4  fluidsynth-2.2.3.tar.gz
+sha256  83cb1dba04c632ede74f0c0717018b062c0e00b639722203b23f77a961afd390  fluidsynth-2.2.4.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 61e0bf8396..4ca8518ae0 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.2.3
+FLUIDSYNTH_VERSION = 2.2.4
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
