Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE96AC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:45:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9968360E8C
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9968360E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 720C482C99;
	Sat, 24 Jul 2021 20:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dtF0XnFsOv6l; Sat, 24 Jul 2021 20:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B10AD82C9C;
	Sat, 24 Jul 2021 20:45:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E14D91BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE11482C99
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Odufijf16NuN for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:45:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46B4F82456
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:45:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6EA1488C7A; Sat, 24 Jul 2021 20:11:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:44:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c339ec003743608b7d997b8582f4eafeaa3343e5
X-Git-Newrev: 124112d8a58cc2e09ec9360754651a73ba391da0
X-Patchwork-Hint: ignore
Message-Id: <20210724201112.6EA1488C7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglu: bump version to 9.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=124112d8a58cc2e09ec9360754651a73ba391da0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2021-June/000634.html

Removed md5 & sha1 hashes not provided by upstream anymore.

Updated license hash due to upstream commit:
https://cgit.freedesktop.org/mesa/glu/commit/?id=a172e0aec8f537f365078dab5486cae9c9a6880e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libglu/libglu.hash | 10 ++++------
 package/libglu/libglu.mk   |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/libglu/libglu.hash b/package/libglu/libglu.hash
index b0202a1334..234b58dd63 100644
--- a/package/libglu/libglu.hash
+++ b/package/libglu/libglu.hash
@@ -1,7 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-July/000530.html
-md5 151aef599b8259efe9acd599c96ea2a3  glu-9.0.1.tar.xz
-sha1 b6ffef562ba55d3f80146d4238589cb9b1de66f5  glu-9.0.1.tar.xz
-sha256 fb5a4c2dd6ba6d1c21ab7c05129b0769544e1d68e1e3b0ffecb18e73c93055bc  glu-9.0.1.tar.xz
-sha512 8a6dae5b4bd63efb96d15f23ccda4ad9c2ffaa964897e5fa63d1e58360d8d4e6732c5efd2109dba04155d5fc457ab1718a65cf9b544ce0d452679ba988d04018  glu-9.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-June/000634.html
+sha256  6e7280ff585c6a1d9dfcdf2fca489251634b3377bfc33c29e4002466a38d02d4  glu-9.0.2.tar.xz
+sha512  2517d7406bb643d12c017a95dcb5d8716f307344332638bcbdf274a90752a7c22165d34745f1b082ed916bb07d40e62d1d1d67d96426225be63166f3480d6f64  glu-9.0.2.tar.xz
 # locally computed
-sha256  84187ce0fd0153769675cb7f3301583eb27393f66b57c5604999a1d805a9184c  include/GL/glu.h
+sha256  3a9992ccc9d672cfdd07ea862431d943a992d04836570c638a733bf15ec62c54  include/GL/glu.h
diff --git a/package/libglu/libglu.mk b/package/libglu/libglu.mk
index e18c7f1494..8820e75d8b 100644
--- a/package/libglu/libglu.mk
+++ b/package/libglu/libglu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLU_VERSION = 9.0.1
+LIBGLU_VERSION = 9.0.2
 LIBGLU_SITE = https://mesa.freedesktop.org/archive/glu
 LIBGLU_SOURCE = glu-$(LIBGLU_VERSION).tar.xz
 LIBGLU_LICENSE = SGI-B-2.0
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
