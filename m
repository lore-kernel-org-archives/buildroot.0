Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE87C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CC91813DE;
	Wed,  1 Nov 2023 16:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CC91813DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id glITsBoYux4R; Wed,  1 Nov 2023 16:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E190C846EF;
	Wed,  1 Nov 2023 16:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E190C846EF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53BD61BF35B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3901140363
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3901140363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tyPfusMUWjBM for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:00:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 807B640180
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 807B640180
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CAD08634C; Wed,  1 Nov 2023 16:00:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 16:59:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdb49b908be7f39a6075cd7d8511acdd2186d2b1
X-Git-Newrev: c7ef3c56c8912ae7edb3053b53fe7912d1a145b6
X-Patchwork-Hint: ignore
Message-Id: <20231101160038.6CAD08634C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/c-periphery: bump to version 2.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7ef3c56c8912ae7edb3053b53fe7912d1a145b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of LICENSE file (year updated with
https://github.com/vsergeev/c-periphery/commit/415b0cf5e826b26a35f7ddf752d092c1adbf11ee)

https://github.com/vsergeev/c-periphery/blob/v2.4.2/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/c-periphery/c-periphery.hash | 4 ++--
 package/c-periphery/c-periphery.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
index 516cfb33e5..f8f0654b4f 100644
--- a/package/c-periphery/c-periphery.hash
+++ b/package/c-periphery/c-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ba298aac5c1f6ebe2b89ed623a2f678bedfa3b9dc78aaf4f0534a1dd304629da  c-periphery-2.3.1.tar.gz
-sha256  7121a0a2ba36ed9388be2f1a916f0e3584d8e49cc7888fbcfcf83bab2a8bebef  LICENSE
+sha256  24327bc2a22588444b2576fa1c9560619f6faad986c236c54f4b3f36b20dad56  c-periphery-2.4.2.tar.gz
+sha256  2c29e38ac4d393558522c5fa671bd03f9d6f7d751c899a3482b20ab2a0ba5122  LICENSE
diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index 722679f9f8..367ac319b3 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_PERIPHERY_VERSION = 2.3.1
+C_PERIPHERY_VERSION = 2.4.2
 C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 C_PERIPHERY_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
