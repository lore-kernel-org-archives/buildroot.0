Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18EAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:03:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 693F060F6B
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 693F060F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4143040314;
	Sun, 26 Sep 2021 21:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O4G64Crap2wl; Sun, 26 Sep 2021 21:03:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68E3C40379;
	Sun, 26 Sep 2021 21:03:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A61DD1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F029A4031B
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mqz8VkGf5839 for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:00:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 970C440347
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1F9848D2B1; Sun, 26 Sep 2021 20:57:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 22:55:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4dc40c21ea2f4c2682855231fe409a74d6cbe911
X-Git-Newrev: 32b2a03745785afeb496979aa3c0f654bc6063ce
X-Patchwork-Hint: ignore
Message-Id: <20210926205757.1F9848D2B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/micropython: Bump version to 1.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=32b2a03745785afeb496979aa3c0f654bc6063ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to micropython-1.17. The LICENSE text has been updated to reflect
the licenses used for various libraries and ports, update the hash
accordingly.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/micropython/micropython.hash | 4 ++--
 package/micropython/micropython.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index fe47ee09c4..d5045e8f27 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  542eb120df8d9eb6f200bcd856294e143813adea9dda0d7189405c218d4b16f7  micropython-1.14.tar.gz
-sha256  9c6089e26c8638a0645bcb0db2c85051f82de8022dcd07fb22baa0c5f9362085  LICENSE
+sha256  c21dbf8144237b3dbe3847c9ad5264cd0f3104eb078c810b3986004cce8fcd70  micropython-1.17.tar.gz
+sha256  59b1f0947a87c90d0d29dbe2c8deb3d1f8263bbbd2fb5ebcc79a649cff6dfcba  LICENSE
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 03811be714..3d69e152e5 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.14
+MICROPYTHON_VERSION = 1.17
 MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
 # Micropython has a lot of code copied from other projects, and also a number
 # of submodules for various libs. However, we don't even clone the submodules,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
