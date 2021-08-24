Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B0DC4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 21:55:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF515613B1
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 21:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF515613B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C55DB61394;
	Tue, 24 Aug 2021 21:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbFt0gTrPyQq; Tue, 24 Aug 2021 21:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5B746138E;
	Tue, 24 Aug 2021 21:55:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06C361BF2A2
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 21:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9CFD80F2B
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 21:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gC6FEkK-7utP for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 21:55:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC84180F4E
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 21:55:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BDAB18DBB3; Tue, 24 Aug 2021 21:54:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 23:55:34 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f4367444f02111f4456a0de526949fa077ee8d01
X-Git-Newrev: 6976d7df495943ad8d46372a7b46b936754b996b
X-Patchwork-Hint: ignore
Message-Id: <20210824215443.BDAB18DBB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-hts: bump
 version to 8.4.0-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=6976d7df495943ad8d46372a7b46b936754b996b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://github.com/kodi-pvr/pvr.hts/blob/Matrix/pvr.hts/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index b282eaf083..be638be6c9 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98f4250d8d8700741798524ea8a3756c5d02403408c74de2d2d3b22b3f13aa23  kodi-pvr-hts-8.3.4-Matrix.tar.gz
+sha256  a8fec6749481999981903f2de48bd9a71ca5b4828eab91b8b115238f66e68140  kodi-pvr-hts-8.4.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 70240116a9..28c6d6ea1f 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 8.3.4-Matrix
+KODI_PVR_HTS_VERSION = 8.4.0-Matrix
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
