Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B5AC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:30:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3431460E78
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3431460E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CA796063A;
	Tue,  3 Aug 2021 23:30:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xOAEtOzixZI7; Tue,  3 Aug 2021 23:30:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6087860A51;
	Tue,  3 Aug 2021 23:30:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3AF1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73E8240E60
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxA3Xl5x8FZl for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2C334069E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 01E3482A39; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 15 Jul 2021 22:48:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 82f399f2257f000b3cbac6c281d9d8a5d5b86534
X-Git-Newrev: 091661568cbb152f345ea73e26b2cc2d30400430
X-Patchwork-Hint: ignore
Message-Id: <20210803211003.01E3482A39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-vuplus: bump
 version to 7.4.6-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=091661568cbb152f345ea73e26b2cc2d30400430
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://github.com/kodi-pvr/pvr.vuplus/blob/Matrix/pvr.vuplus/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index cc49237402..2c2c68e183 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0845aeb136395cad979d9d4c687a8a2bd0b30e361ac9569368d564ec88316a5e  kodi-pvr-vuplus-7.4.3-Matrix.tar.gz
+sha256  5fc5abbeef3735c87b4b1826b265932f60187fc60c6e47dd193e86c849f0eb49  kodi-pvr-vuplus-7.4.6-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index 1f0b91317d..691b2cb62f 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VUPLUS_VERSION = 7.4.3-Matrix
+KODI_PVR_VUPLUS_VERSION = 7.4.6-Matrix
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
