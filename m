Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16059C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 19:39:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8009F60BD3
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 19:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8009F60BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5168A832BF;
	Sun, 25 Jul 2021 19:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N2LaRbpqfabl; Sun, 25 Jul 2021 19:39:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAD5B8302F;
	Sun, 25 Jul 2021 19:39:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63ABD1BF405
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 19:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 529B240382
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 19:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96389aT3Yu8P for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 19:38:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 883BC40372
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 19:38:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EDBD388F3E; Sun, 25 Jul 2021 19:04:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 21:38:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2aea94a47892f22250a63f4ee4fda1ec5373f6c4
X-Git-Newrev: 2ed3e9edda331b678ab30e183d030b26a29a1204
X-Patchwork-Hint: ignore
Message-Id: <20210725190426.EDBD388F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dav1d: bump version to 0.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ed3e9edda331b678ab30e183d030b26a29a1204
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://code.videolan.org/videolan/dav1d/-/releases

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dav1d/dav1d.hash | 2 +-
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index 520e42fe90..0a8b2cc3a1 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  78ec7a1714d98a8f4ecbc4255e83e6c4c944cdd881871ea234ce40153fd3df04  dav1d-0.8.2.tar.bz2
+sha256  e0cb645f170e7a087bc76e501324177be51a8db21df22ad37b43d289d7d1f7b5  dav1d-0.9.0.tar.bz2
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 377bd63419..251330929f 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 0.8.2
+DAV1D_VERSION = 0.9.0
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.bz2
 DAV1D_SITE = https://code.videolan.org/videolan/dav1d/-/archive/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
