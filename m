Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209FEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:10:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEE046109E
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEE046109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D8324058C;
	Thu, 14 Oct 2021 21:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Q3XFZ7FpYER; Thu, 14 Oct 2021 21:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61BA540571;
	Thu, 14 Oct 2021 21:10:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2398F1BF9D1
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10B57401AF
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVQmkNBbw-om for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:08:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3DE840154
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:08:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BC8C994EAD; Thu, 14 Oct 2021 21:05:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 22:43:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 950445c90d0b169285c10ff6d2de02e737a98c9c
X-Git-Newrev: e9bd451a627521cb614aba0018408e030a5e06cb
X-Patchwork-Hint: ignore
Message-Id: <20211014210541.BC8C994EAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgphoto2: bump to version 2.5.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9bd451a627521cb614aba0018408e030a5e06cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/gphoto/libgphoto2/releases/tag/v2.5.27

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libgphoto2/libgphoto2.hash | 5 +----
 package/libgphoto2/libgphoto2.mk   | 8 +++-----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
index e405735c8b..af52b47dc8 100644
--- a/package/libgphoto2/libgphoto2.hash
+++ b/package/libgphoto2/libgphoto2.hash
@@ -1,6 +1,3 @@
-# https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.26/
-sha1  38373ef7f76e90492ffca309094487fb1474f3fe  libgphoto2-2.5.26.tar.bz2
-
 # Locally calculated hash
-sha256  7740fea3cbb78489071cdfec06c07fab528e69e27ac82734eae6a73eaeeabcd4  libgphoto2-2.5.26.tar.bz2
+sha256  a7253bd18c6ef65352150ac36a668f883a5ad2634eb6455b3ca9aa6ac98d0073  libgphoto2-2.5.27.tar.xz
 sha256  ebc385a0b1d477be5177ed6d9129557aa59a3ad0f26ebe7dd97ee942a0fb68ee  COPYING
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index 1d42ba862f..c1d5352c00 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-LIBGPHOTO2_VERSION = 2.5.26
-LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.bz2
-# Project is maintained on github but github tarball doesn't have
-# configure, so use tarballs from SourceForge
-LIBGPHOTO2_SITE = https://downloads.sourceforge.net/project/gphoto/libgphoto/$(LIBGPHOTO2_VERSION)
+LIBGPHOTO2_VERSION = 2.5.27
+LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.xz
+LIBGPHOTO2_SITE = https://github.com/gphoto/libgphoto2/releases/download/v$(LIBGPHOTO2_VERSION)
 LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
 	LGPL-2.0 (sipix), LGPL-3.0+ (pentax), BSD-3-Clause (ax203/tinyjpeg)
 # There is a single license file for the LGPL-2.1, no license files
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
