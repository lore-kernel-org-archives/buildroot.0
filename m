Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D034E8FDB6
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 20:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1956561198;
	Tue,  3 Oct 2023 20:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1956561198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OBR3-wRQ4l2K; Tue,  3 Oct 2023 20:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14B41610E4;
	Tue,  3 Oct 2023 20:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14B41610E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 624C41BF574
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 20:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 369E140917
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 20:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 369E140917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zWr10fLDsjyi for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 20:47:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 271E1408D9
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 20:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 271E1408D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13D7D8418D; Tue,  3 Oct 2023 20:47:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Oct 2023 22:39:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74b50d553eafb0e3ec7a9a7eec5181d552b71707
X-Git-Newrev: 61b72fb9d490bf8b2e50b2da8e13699dee6b223e
X-Patchwork-Hint: ignore
Message-Id: <20231003204721.13D7D8418D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcodec2: bump version to 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=61b72fb9d490bf8b2e50b2da8e13699dee6b223e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tag we currently use no longer exists in the upstream repository, as
the history has ben "rewritten":
    https://github.com/drowe67/codec2/issues/5

Bump to the latest (and only) tag in the new repository.

Release notes: https://github.com/drowe67/codec2/releases/tag/1.2.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[yann.morin.1998@free.fr: explain about missing tag]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcodec2/libcodec2.hash | 2 +-
 package/libcodec2/libcodec2.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcodec2/libcodec2.hash b/package/libcodec2/libcodec2.hash
index edaa275bbc..828efa3e4d 100644
--- a/package/libcodec2/libcodec2.hash
+++ b/package/libcodec2/libcodec2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  44015b071968d98ee326012c498db6a8308bed1a7a914ecb6d4d8e2a354a4611  libcodec2-1.1.1.tar.gz
+sha256  cbccae52b2c2ecc5d2757e407da567eb681241ff8dadce39d779a7219dbcf449  libcodec2-1.2.0.tar.gz
 sha256  9ebb6f82b7380a62ac74c5f0322c88e6744dedf2ebe1f54d6f088282b39844bf  COPYING
diff --git a/package/libcodec2/libcodec2.mk b/package/libcodec2/libcodec2.mk
index 295dd8983f..5fc190aefd 100644
--- a/package/libcodec2/libcodec2.mk
+++ b/package/libcodec2/libcodec2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCODEC2_VERSION = 1.1.1
-LIBCODEC2_SITE = $(call github,drowe67,codec2,v$(LIBCODEC2_VERSION))
+LIBCODEC2_VERSION = 1.2.0
+LIBCODEC2_SITE = $(call github,drowe67,codec2,$(LIBCODEC2_VERSION))
 LIBCODEC2_LICENSE = LGPL-2.1
 LIBCODEC2_LICENSE_FILES = COPYING
 LIBCODEC2_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
