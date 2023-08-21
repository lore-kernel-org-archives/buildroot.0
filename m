Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438EDEC8733
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEE5B83A4E;
	Thu,  7 Sep 2023 15:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEE5B83A4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zNS_WoDxImXY; Thu,  7 Sep 2023 15:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F64983A34;
	Thu,  7 Sep 2023 15:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F64983A34
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75AAE1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 754F8612A8
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 754F8612A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoxKVPnwe9R2 for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8294612A3
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8294612A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A930A86A25; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 12:44:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f1418b5dd80809dc90196d967d8d9665b794c8e
X-Git-Newrev: 90031397ed65078e88145397ec434b6574ff3459
X-Patchwork-Hint: ignore
Message-Id: <20230907145130.A930A86A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencsd: bump to version 1.4.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=90031397ed65078e88145397ec434b6574ff3459
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/Linaro/OpenCSD/blob/v1.4.1/README.md?plain=1#L294

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencsd/opencsd.hash | 2 +-
 package/opencsd/opencsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencsd/opencsd.hash b/package/opencsd/opencsd.hash
index 84a762fb36..a3534976b5 100644
--- a/package/opencsd/opencsd.hash
+++ b/package/opencsd/opencsd.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  e1bb6d8d09e87974cb5ca6db2a13b0e1ba9e51117ca2ed71879df07ff7af4de2  opencsd-1.4.0.tar.gz
+sha256  159a611535fd7d3bf179bcbdab3791852c6e7199401a6e59cdeef3ba2072edc4  opencsd-1.4.1.tar.gz
 sha256  980eef4b0744e63834e3ec0d50c2a4ff6d81d7ec62dd8ba8c66acae0ec5a2e88  LICENSE
diff --git a/package/opencsd/opencsd.mk b/package/opencsd/opencsd.mk
index 680364d01d..76135bf0b0 100644
--- a/package/opencsd/opencsd.mk
+++ b/package/opencsd/opencsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCSD_VERSION = 1.4.0
+OPENCSD_VERSION = 1.4.1
 OPENCSD_SITE = $(call github,Linaro,OpenCSD,v$(OPENCSD_VERSION))
 OPENCSD_LICENSE = BSD-3-Clause
 OPENCSD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
