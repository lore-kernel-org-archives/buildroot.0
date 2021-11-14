Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DF7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:45:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD87761056
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD87761056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEABA606DA;
	Sun, 14 Nov 2021 14:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4Eyi_0PGaLB; Sun, 14 Nov 2021 14:45:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 174F1606A8;
	Sun, 14 Nov 2021 14:45:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6406D1BF20B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC74440239
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OnKu_g5_m8iy for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:44:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F014740249
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:44:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 844028D2F3; Sun, 14 Nov 2021 14:40:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:43:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 34e12c4c3bfe7b2b23912d99a138fa8e43bc169b
X-Git-Newrev: 886d14edef7697f6801dc5ad098d98119ded8e1e
X-Patchwork-Hint: ignore
Message-Id: <20211114144017.844028D2F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/kodi-audiodecoder-snesapu: bump version to 19.0.1-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=886d14edef7697f6801dc5ad098d98119ded8e1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash | 2 +-
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index 714f2f8719..c8bf76ada7 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8b4c75ccfbcf829922e9dbf10d9ec75c4312ac6ad1837d3cf39833395fb036be  kodi-audiodecoder-snesapu-19.0.0-Matrix.tar.gz
+sha256  f7a346b751900f4b66e8a3e7d3c3579b0b10a112e6ed6901553c4c9fc72bbb3b  kodi-audiodecoder-snesapu-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index ac77f76f14..5397e765f7 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SNESAPU_VERSION = 19.0.0-Matrix
+KODI_AUDIODECODER_SNESAPU_VERSION = 19.0.1-Matrix
 KODI_AUDIODECODER_SNESAPU_SITE = $(call github,xbmc,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
