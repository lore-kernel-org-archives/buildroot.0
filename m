Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A26C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6A1041517;
	Wed, 27 Jul 2022 14:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6A1041517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KTbYV4oWRofd; Wed, 27 Jul 2022 14:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E69414E7;
	Wed, 27 Jul 2022 14:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1E69414E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78BB31BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6207B82416
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6207B82416
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sS80KKfELZ4q for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:46:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9631A823CF
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9631A823CF
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 59DCA86694; Wed, 27 Jul 2022 14:32:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 16:43:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea746f312844df298bbc9a697ca178f3a3c67a8f
X-Git-Newrev: 447323feac9606f827b166c4946b38b80fec456a
X-Patchwork-Hint: ignore
Message-Id: <20220727143225.59DCA86694@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/easy-rsa: bump to version 3.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=447323feac9606f827b166c4946b38b80fec456a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of gpl-2.0.txt (new line removed)

https://github.com/OpenVPN/easy-rsa/releases/tag/v3.1.0
https://github.com/OpenVPN/easy-rsa/blob/v3.1.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/easy-rsa/easy-rsa.hash | 4 ++--
 package/easy-rsa/easy-rsa.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/easy-rsa/easy-rsa.hash b/package/easy-rsa/easy-rsa.hash
index e363e570df..e304c367fa 100644
--- a/package/easy-rsa/easy-rsa.hash
+++ b/package/easy-rsa/easy-rsa.hash
@@ -1,6 +1,6 @@
 # Locally computed: (after verifying gpg sig)
-sha512  fd2cde4725cffd60c6af1b6aeaff0dbf15f31f0f322c9df75c22838e2297ba9dc3bba610d956464c8227bd74b3e63840e2a3da41fbc5ee1c79c1e7f5350adc94  EasyRSA-3.0.8.tgz
+sha512  be2dedde19eaf923622da61db34ecb2e926b3f15a60a0c3d9858d3126dbe3b4af9c0f6674f964516572b50611ffd1d254952f27dc5de867bd7a67474c89be5f0  EasyRSA-3.1.0.tgz
 
 # Hash for license files
 sha256  7c4a4fc71745d93a87278801f1bca555562ca23f21e18293add64b9e6f6b7bf1  COPYING.md
-sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  gpl-2.0.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
index 4ec011e179..7c32c1d83d 100644
--- a/package/easy-rsa/easy-rsa.mk
+++ b/package/easy-rsa/easy-rsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EASY_RSA_VERSION = 3.0.8
+EASY_RSA_VERSION = 3.1.0
 EASY_RSA_SOURCE = EasyRSA-$(EASY_RSA_VERSION).tgz
 EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/v$(EASY_RSA_VERSION)
 EASY_RSA_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
