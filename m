Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F5BC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17A3A8426F;
	Thu,  9 Jun 2022 20:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dajJSc-DuLvV; Thu,  9 Jun 2022 20:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FC8C83689;
	Thu,  9 Jun 2022 20:44:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 823451BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D318741B52
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4paVEK0DZej for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:43:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5505141A0A
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:43:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 888BF86F1D; Thu,  9 Jun 2022 20:31:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:43:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79f92631fde8540f9cbd5c4d9f52c55e199a337f
X-Git-Newrev: 44fa5be2745e0444cfb451701f7bf1a273a1d737
X-Patchwork-Hint: ignore
Message-Id: <20220609203153.888BF86F1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libaio: bump to version 0.3.113
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

commit: https://git.buildroot.net/buildroot/commit/?id=44fa5be2745e0444cfb451701f7bf1a273a1d737
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libaio/libaio.hash | 2 +-
 package/libaio/libaio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libaio/libaio.hash b/package/libaio/libaio.hash
index ac815a73b5..4ddc97334f 100644
--- a/package/libaio/libaio.hash
+++ b/package/libaio/libaio.hash
@@ -1,5 +1,5 @@
 # From https://releases.pagure.org/libaio/CHECKSUMS
-sha256  ab0462f2c9d546683e5147b1ce9c195fe95d07fac5bf362f6c01637955c3b492 libaio-0.3.112.tar.gz
+sha512  65c30a102433bf8386581b03fc706d84bd341be249fbdee11a032b237a7b239e8c27413504fef15e2797b1acd67f752526637005889590ecb380e2e120ab0b71  libaio-0.3.113.tar.gz
 
 # Hash for license file:
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 34f08b75e7..e13e49346b 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAIO_VERSION = 0.3.112
+LIBAIO_VERSION = 0.3.113
 LIBAIO_SITE = https://releases.pagure.org/libaio
 LIBAIO_INSTALL_STAGING = YES
 LIBAIO_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
