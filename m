Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15574C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 16:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DE9C82983;
	Mon, 11 Jul 2022 16:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DE9C82983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rB3-lvdRUpdQ; Mon, 11 Jul 2022 16:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B027882980;
	Mon, 11 Jul 2022 16:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B027882980
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40C311BF983
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 16:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B8FA60F2F
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 16:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B8FA60F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T0NCL0gAJqxJ for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 16:39:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 652A360F03
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 16:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 652A360F03
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 98FE3836F1; Mon, 11 Jul 2022 16:26:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 18:36:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2943aea01e4d96376dd56e110714f066c86796c6
X-Git-Newrev: d2f958bbabdfd6309e62afea3415be9cd03ebb40
X-Patchwork-Hint: ignore
Message-Id: <20220711162602.98FE3836F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburing: bump to version 2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2f958bbabdfd6309e62afea3415be9cd03ebb40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of LICENSE (lines wrapped by
  https://github.com/axboe/liburing/commit/56066e7a41fdc6a0d0c537c94b2e746554449943)
- Update hash of README (changes not related to license)

https://github.com/axboe/liburing/blob/liburing-2.2/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liburing/liburing.hash | 6 +++---
 package/liburing/liburing.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
index 56e90d71cc..7d3306850f 100644
--- a/package/liburing/liburing.hash
+++ b/package/liburing/liburing.hash
@@ -1,8 +1,8 @@
 # Locally calculated
-sha256  df7c8fd05fd39da622b2814e06f815f11f1beb429487a4330eed64bb7f353dbf  liburing-2.1.tar.bz2
+sha256  0fcd25dc1eb32cbeb534219f8e7fcfeadbd8dc2304aa447148e5ca8408076f22  liburing-2.2.tar.bz2
 
 # Hash for license files
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
-sha256  d0b225f17ef2d05d5cda6b25b2dc334ef6f5f12537c20edf6e391852a095ec19  LICENSE
-sha256  97d62ff5d7cf0b1cef34c33a89877352911278ca4ac1c6c4f24a835baa5ea10b  README
+sha256  2ec12f7934cdfce25ff72b0557738989d79fc7a496d1cf9b2d3f9464fd61edbe  LICENSE
+sha256  1c3351726408c22787dafbb5cc4bfeaa38ca8e92eabf59a36a046a5a2e66108f  README
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index 874e268d43..e98c710997 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURING_VERSION = 2.1
+LIBURING_VERSION = 2.2
 LIBURING_SOURCE = liburing-$(LIBURING_VERSION).tar.bz2
 LIBURING_SITE = https://git.kernel.dk/cgit/liburing/snapshot
 LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
