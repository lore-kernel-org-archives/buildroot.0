Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51270C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:05:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 194E461050
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 194E461050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFCE2400C7;
	Wed,  4 Aug 2021 00:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q79qDm4FbwYh; Wed,  4 Aug 2021 00:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1C264052E;
	Wed,  4 Aug 2021 00:05:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75F181BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CE5940E65
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEbrw-HUXEGc for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBC6D4069E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3F32F87B09; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 23:12:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 878b57ca3b80d63106ec1398932d2e0ebd18c0c7
X-Git-Newrev: f008ee25a5e23afc6b9f2fa1c4941905e1682d56
X-Patchwork-Hint: ignore
Message-Id: <20210803210959.3F32F87B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libksba: bump to
 version 1.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f008ee25a5e23afc6b9f2fa1c4941905e1682d56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update hash of AUTHORS file (update in year:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commitdiff;h=1015bea2f8a55b965dee29e17118bc73c2deca39)

https://dev.gnupg.org/T5479

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libksba/libksba.hash | 4 ++--
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index c8c9d6bdd7..422048be5f 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,8 +1,8 @@
 # Locally calculated after checking pgp signature
-sha256  ae4af129216b2d7fdea0b5bf2a788cd458a79c983bb09a43f4d525cc87aba0ba  libksba-1.5.0.tar.bz2
+sha256  dad683e6f2d915d880aa4bed5cea9a115690b8935b78a1bbe01669189307a48b  libksba-1.6.0.tar.bz2
 
 # Hash for license files:
-sha256  4d7ff8486176da695f3c81da2ac7ce1b9e5331e0a1667d9ebfe44057088a4220  AUTHORS
+sha256  8f1b87e551d97b2b23b6d3403a5d598c63ea89824cb8ee351f631f6cab2beaa5  AUTHORS
 sha256  6197b98c6bf69838c624809c509d84333de1bc847155168c0e84527446a27076  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING.GPLv3
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index bb02391a38..ca5fc1d749 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.5.0
+LIBKSBA_VERSION = 1.6.0
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
