Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265B2C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:47:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B7A60EE8
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8B7A60EE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B42D7424AD;
	Wed,  4 Aug 2021 00:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6OxJGvdSZ0yT; Wed,  4 Aug 2021 00:47:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C3F1424A1;
	Wed,  4 Aug 2021 00:47:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 071A71BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23DB640360
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IbaaZ1bfCvHy for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 536E440F94
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9D73287884; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:05:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f7eccd6b3bc7361e8c9e2259c09ebd5537da9c81
X-Git-Newrev: 42b46562a286d0082638f9bac5346c523877b5c2
X-Patchwork-Hint: ignore
Message-Id: <20210803211021.9D73287884@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gssdp: bump to version
 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=42b46562a286d0082638f9bac5346c523877b5c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update license to LGPL-2.1+:
https://gitlab.gnome.org/GNOME/gssdp/-/commit/b018ff574f482a178f0c8515faf32962da70396a

https://gitlab.gnome.org/GNOME/gssdp/-/blob/gssdp-1.3.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gssdp/gssdp.hash | 6 +++---
 package/gssdp/gssdp.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index f31f21942a..2f13c0a847 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.2/gssdp-1.2.3.sha256sum:
-sha256  a263dcb6730e3b3dc4bbbff80cf3fab4cd364021981d419db6dd5a8e148aa7e8  gssdp-1.2.3.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.3/gssdp-1.3.0.sha256sum:
+sha256  e739cf33f813403a53973cd8f2882dcd7208bad9582269f7066fc9e8ea3a52cc  gssdp-1.3.0.tar.xz
 
 # Hash for license file:
-sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 02b10d961a..03987ff085 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-GSSDP_VERSION_MAJOR = 1.2
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).3
+GSSDP_VERSION_MAJOR = 1.3
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).0
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
-GSSDP_LICENSE = LGPL-2.0+
+GSSDP_LICENSE = LGPL-2.1+
 GSSDP_LICENSE_FILES = COPYING
 GSSDP_INSTALL_STAGING = YES
 GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
