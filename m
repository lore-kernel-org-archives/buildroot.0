Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52441C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1B578319F;
	Sat,  4 Dec 2021 22:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAu1Y0QwAYY8; Sat,  4 Dec 2021 22:01:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 659F883139;
	Sat,  4 Dec 2021 22:01:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89F681BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8714283139
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvy5baSyMBPL for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:01:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C066A83126
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:01:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8CADE935A4; Sat,  4 Dec 2021 21:56:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:01:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2db0ec06924d7f337755b9b920f5dd4c28f95e7f
X-Git-Newrev: 3fbc731441225c45dd2c8badfec3ec63c1226828
X-Patchwork-Hint: ignore
Message-Id: <20211204215626.8CADE935A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fwts: bump to version
 21.11.00
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
Content-Type: multipart/mixed; boundary="===============8471526648512656360=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8471526648512656360==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3fbc731441225c45dd2c8badfec3ec63c1226828
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also, update the hash of the copyright file, which has changed (by one
character).

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fwts/fwts.hash | 4 ++--
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index fc79a0b812..8634980e03 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
-sha256  e2d6e8b0704eba859a567fb8764e5dc5385793fc26bd00ecc70e7af03fd2568d  fwts-V21.05.00.tar.gz
+sha256  17d1f0b9639e0f9b092ed8233be2d63d6c44ea8d2a76be0fb5902cc867961374  fwts-V21.11.00.tar.gz
 
 # Hash for license file
-sha256  2003f5c8a1e40d7882f1499bd7adb7bc748c9656851abb28647a3d297c2e8e23  debian/copyright
+sha256  fbbea748555635dd8c7e6e2f99cddd778f5ee3f9e3510775183bf9799076e5e5  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 402a9e0b8f..6634cdc40e 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 21.05.00
+FWTS_VERSION = 21.11.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = http://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0

--===============8471526648512656360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8471526648512656360==--
