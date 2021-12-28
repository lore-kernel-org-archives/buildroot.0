Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0296C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 20:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 498DF40894;
	Tue, 28 Dec 2021 20:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tNaO0llufOHl; Tue, 28 Dec 2021 20:40:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CB0D401FC;
	Tue, 28 Dec 2021 20:40:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40B801BF344
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 20:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ED89401C4
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 20:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I63AqSqWoQRM for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 20:39:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E933401FC
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 20:39:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5D32982BC6; Tue, 28 Dec 2021 20:33:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 21:23:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c2970261dd4c3cae364cfb29ffeb2c17b47eb11
X-Git-Newrev: 74ffdc2b47256d8c8aa40f70ff1db1e488cc2ad4
X-Patchwork-Hint: ignore
Message-Id: <20211228203345.5D32982BC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-filmon: bump version to
 19.0.1-Matrix
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=74ffdc2b47256d8c8aa40f70ff1db1e488cc2ad4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index 8e9ecc2ac4..ce6fb8f385 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e4a28e6cd1785e8ea7b99f4ea0068470c998e8b8d5a55d095dabed75a29cd29f  kodi-pvr-filmon-19.0.0-Matrix.tar.gz
+sha256  5853a69455847da87ed0aebad4121f47c7a1aeb80cda6dbe20f069d33a02720b  kodi-pvr-filmon-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index b9ac51f841..c5705670f8 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_FILMON_VERSION = 19.0.0-Matrix
+KODI_PVR_FILMON_VERSION = 19.0.1-Matrix
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
 KODI_PVR_FILMON_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
