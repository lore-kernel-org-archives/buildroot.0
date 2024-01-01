Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A10C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2FBF40396;
	Mon,  1 Jan 2024 21:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2FBF40396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIuZtkKsU93c; Mon,  1 Jan 2024 21:24:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B344041530;
	Mon,  1 Jan 2024 21:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B344041530
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50BB21BF3F0
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F92141F11
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F92141F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMVZ8Q8gVuid for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:14:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B11ED41ED2
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B11ED41ED2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C65383B51; Mon,  1 Jan 2024 21:14:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 22:07:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79206b0ab90ab519319d741e69d6d0ed05dd232c
X-Git-Newrev: e619785d79880a5ae24c6cf4db4c642a555facf6
X-Patchwork-Hint: ignore
Message-Id: <20240101211459.9C65383B51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libucl: bump to version 0.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e619785d79880a5ae24c6cf4db4c642a555facf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/vstakhov/libucl/releases/tag/0.8.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libucl/libucl.hash | 2 +-
 package/libucl/libucl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libucl/libucl.hash b/package/libucl/libucl.hash
index 164b00276f..4ad166dc7d 100644
--- a/package/libucl/libucl.hash
+++ b/package/libucl/libucl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a6397e179672f0e8171a0f9a2cfc37e01432b357fd748b13f4394436689d24ef  libucl-0.8.1.tar.gz
+sha256  d95a0e2151cc167a0f3e51864fea4e8977a0f4c473faa805269a347f7fb4e165  libucl-0.8.2.tar.gz
 sha256  1bf976835764c1d827e07472a0a75adb098682df56681878af05fc0db7439b03  COPYING
diff --git a/package/libucl/libucl.mk b/package/libucl/libucl.mk
index 9f0378ad9c..bf5e368f2b 100644
--- a/package/libucl/libucl.mk
+++ b/package/libucl/libucl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCL_VERSION = 0.8.1
+LIBUCL_VERSION = 0.8.2
 LIBUCL_SITE = $(call github,vstakhov,libucl,$(LIBUCL_VERSION))
 LIBUCL_INSTALL_STAGING = YES
 LIBUCL_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
