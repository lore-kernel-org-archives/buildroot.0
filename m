Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74400C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 13:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8FA36068D;
	Sat, 22 Jan 2022 13:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9q7tFTDIlEU; Sat, 22 Jan 2022 13:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7673160AC2;
	Sat, 22 Jan 2022 13:21:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C981D1BF3D5
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 13:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6EC3401DD
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 13:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r1oPJee4YEHb for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 13:21:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71BB2400D6
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 13:21:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9C10182675; Sat, 22 Jan 2022 13:14:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 14:21:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49d7c85421e87d9d762be9352805cb47a2f0bbeb
X-Git-Newrev: 2915d5a9f1f95c99f28a2276e18acdeeb0ab23d6
X-Patchwork-Hint: ignore
Message-Id: <20220122131427.9C10182675@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8812au-aircrack-ng: bump
 version to 3a6402e
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

commit: https://git.buildroot.net/buildroot/commit/?id=2915d5a9f1f95c99f28a2276e18acdeeb0ab23d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

  47a38b7 Fix kernel 5.15 compilation
  6fd304f fix libc6_2.34 dependency on build
  307d694 Merge pull request #898 from CGarces/fix_5.15
  191f5bc Remove REMAKE_INITRD
  bd8e44b Add back 8814au support
  849206d Merge pull request #913 from iyanmv/iyanmv-remove-remake-initrd
  7bb5114 Fix kernel v5.15+ compiler warnings
  1b63ee6 Fixed compiler warning for unused function
  a72835d Fix (test) for IPX header on various distros
  3a6402e Fix for kernel v3.20

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index 5503b4f22e..ed1921d1c2 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2c5d8286a00273343fc10d0e16afc52e788ac73b7df57c8159e58a40707f61da  rtl8812au-aircrack-ng-b8167e66b4ac046b3b76c2c40008d84528e91594.tar.gz
+sha256  acae758c3834196c71f4ee58f53a3c1b29ffd984f63ff2f40f2b080c8785c49f  rtl8812au-aircrack-ng-3a6402e9e79802891f1531b435be54f4d8b71f0b.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index d42d953496..2bbca88cfb 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = b8167e66b4ac046b3b76c2c40008d84528e91594
+RTL8812AU_AIRCRACK_NG_VERSION = 3a6402e9e79802891f1531b435be54f4d8b71f0b
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
