Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C969AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:48:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93CF2610A5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93CF2610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CDFB84024;
	Wed,  6 Oct 2021 15:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6F65dx8XSmP; Wed,  6 Oct 2021 15:48:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B745583FDD;
	Wed,  6 Oct 2021 15:48:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B57B1BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4740940130
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkAolPYqlrVA for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:48:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 588A0402C2
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:48:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2606492B9C; Wed,  6 Oct 2021 15:46:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 17:47:24 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: e4b0075eaab8e778056be0cf378be408957d19f4
X-Git-Newrev: 36e0e1d4ee28baf95d5d1aa0c0d107f8faf06bca
X-Patchwork-Hint: ignore
Message-Id: <20211006154608.2606492B9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/pcre2: bump to
 version 10.37
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

commit: https://git.buildroot.net/buildroot/commit/?id=36e0e1d4ee28baf95d5d1aa0c0d107f8faf06bca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

diff LICENSE:
-Copyright (c) 1997-2020 University of Cambridge
+Copyright (c) 1997-2021 University of Cambridge
-Copyright(c) 2010-2020 Zoltan Herczeg
+Copyright(c) 2010-2021 Zoltan Herczeg

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0b151824ea9cba34b3c97d9ff82b5e1b52dee9c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre2/pcre2.hash | 6 +++---
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index b30a290968..130ce1f596 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.pcre.org/pub/pcre/pcre2-10.36.tar.bz2.sig
-sha256  a9ef39278113542968c7c73a31cfcb81aca1faa64690f400b907e8ab6b4a665c  pcre2-10.36.tar.bz2
+# https://ftp.pcre.org/pub/pcre/pcre2-10.37.tar.bz2.sig
+sha256  4d95a96e8b80529893b4562be12648d798b957b1ba1aae39606bbc2ab956d270  pcre2-10.37.tar.bz2
 # Locally computed
-sha256  8937734bbb1ba65d9f8ac7a7c8fc9016759a09aa2fb37d2175c06c9e7a856a24  LICENCE
+sha256  9c9488256e3612ec5ea40fd12abe7ec55a58f23bd36e6f465116c2b3cbffba02  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index d02772650f..220eb8a99c 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.36
+PCRE2_VERSION = 10.37
 PCRE2_SITE = https://ftp.pcre.org/pub/pcre
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
