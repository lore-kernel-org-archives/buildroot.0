Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29154C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:43:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E712760F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E712760F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6B7840526;
	Tue,  3 Aug 2021 23:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qg5P4gvk-K7U; Tue,  3 Aug 2021 23:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD97C404FA;
	Tue,  3 Aug 2021 23:43:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55CCC1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8B4040E5D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FHoG5vCjgKwP for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1696A40EA7
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5C5AD87059; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 12:36:08 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 60a13de87542cf9c00858ce2298d6f74f7e113ae
X-Git-Newrev: b5ba0119e858f0bdc2683f15dd7758eb08ed1f6a
X-Patchwork-Hint: ignore
Message-Id: <20210803211007.5C5AD87059@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/civetweb: bump to
 version 1.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5ba0119e858f0bdc2683f15dd7758eb08ed1f6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump to version 1.14:

https://github.com/civetweb/civetweb/releases/tag/v1.14

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/civetweb/civetweb.hash | 2 +-
 package/civetweb/civetweb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/civetweb/civetweb.hash b/package/civetweb/civetweb.hash
index cf9d676832..96e4aa105b 100644
--- a/package/civetweb/civetweb.hash
+++ b/package/civetweb/civetweb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a7ccc76c2f1b5f4e8d855eb328ed542f8fe3b882a6da868781799a98f4acdedc  civetweb-1.13.tar.gz
+sha256  d02d7ab091c8b4edf21fc13a03c6db08a8a8b8605e35e0073251b9d88443c653  civetweb-1.14.tar.gz
 sha256  291622dfbbf4fb35829726fbe97177b7227c0d4d6392b350660af73af4f86df8  LICENSE.md
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 94fbb4f9d8..40841285ef 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIVETWEB_VERSION = 1.13
+CIVETWEB_VERSION = 1.14
 CIVETWEB_SITE = $(call github,civetweb,civetweb,v$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
