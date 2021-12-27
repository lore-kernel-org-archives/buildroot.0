Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249C6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 10:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4770813A4;
	Mon, 27 Dec 2021 10:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s4I0pzUyFydM; Mon, 27 Dec 2021 10:19:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D1D981398;
	Mon, 27 Dec 2021 10:19:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1B1D1BF4DB
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE9D740319
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sw_kyuh62GFA for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 10:18:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4653D4030C
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:18:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6996882B7B; Mon, 27 Dec 2021 10:13:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 11:18:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ce29b9ecfe38156363a594c5311b66b94e6389f
X-Git-Newrev: 49515077dcfdace7e07c45613fdb7036318f8e4e
X-Patchwork-Hint: ignore
Message-Id: <20211227101312.6996882B7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcre2: bump to version 10.39
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

commit: https://git.buildroot.net/buildroot/commit/?id=49515077dcfdace7e07c45613fdb7036318f8e4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
-University of Cambridge Computing Service,
+Retired from University of Cambridge Computing Service,

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcre2/pcre2.hash | 8 ++++----
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 2e86d8a193..3e6299f80b 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
-# Locally calculated after checking pgp signature and compared with the mirror on:
-# http://downloads.sourceforge.net/project/pcre/pcre2/10.37/pcre2-10.37.tar.bz2.sig
-sha256  4d95a96e8b80529893b4562be12648d798b957b1ba1aae39606bbc2ab956d270  pcre2-10.37.tar.bz2
+# Locally calculated after checking pgp signature:
+# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.39/pcre2-10.39.tar.bz2.sig
+sha256  0f03caf57f81d9ff362ac28cd389c055ec2bf0678d277349a1a4bee00ad6d440  pcre2-10.39.tar.bz2
 # Locally computed
-sha256  9c9488256e3612ec5ea40fd12abe7ec55a58f23bd36e6f465116c2b3cbffba02  LICENCE
+sha256  15bc778a1f7e1f857d57abab4181749a06ad1d1f9420d5c9e3c23ef8c991b025  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 398e7389f3..adcfaf1cae 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.37
+PCRE2_VERSION = 10.39
 PCRE2_SITE = https://github.com/PhilipHazel/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
