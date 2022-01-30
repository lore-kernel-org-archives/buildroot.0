Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E28C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 481964017C;
	Sun, 30 Jan 2022 14:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxQk5tT_Y_Yg; Sun, 30 Jan 2022 14:12:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5231F40111;
	Sun, 30 Jan 2022 14:12:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DAD91BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D67B60B27
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:12:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YdNSMBBfQEjH for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:12:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78081607A1
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:12:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CDF857FEA9; Sun, 30 Jan 2022 14:05:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 14:53:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8aa81ad9f129f8aa3ccd5bdb1207c0ecc3de147a
X-Git-Newrev: e889bc8db5ac67031abec8a55ba12abb3c443555
X-Patchwork-Hint: ignore
Message-Id: <20220130140530.CDF857FEA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/enlightenment: bump to version
 0.25.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e889bc8db5ac67031abec8a55ba12abb3c443555
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the a bugfix release.

See:
https://www.enlightenment.org/news/2022-01-03-enlightenment-0.25.1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index dd4c4d78c0..2d977b86f7 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,4 +1,4 @@
-# From https://www.enlightenment.org/news/2021-12-26-enlightenment-0.25.0
-sha256  7d6e72ceed5aca135b7a49c2a1c1eb9d8fde1318613517401d0418e0e5f6df06  enlightenment-0.25.0.tar.xz
+# From https://www.enlightenment.org/news/2022-01-03-enlightenment-0.25.1
+sha256  2cf05fe3d96ef35e823619dbc0ac513ecabcae2186800ecd804924a637112444  enlightenment-0.25.1.tar.xz
 sha256  8d2fbc393e967cd6f5b8559d1744881a6a1ceb3ec6e1c2368c3916809ffccb8d  COPYING
 sha256  cdc77ee1732455b203610f923fe4196046b3f7509038c48dc0b0c7e3492c23f3  src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 24bbd96cd0..95670e800d 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.25.0
+ENLIGHTENMENT_VERSION = 0.25.1
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = https://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause, OFL-1.1 (font)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
