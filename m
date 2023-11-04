Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A366C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E286E81DE1;
	Sat,  4 Nov 2023 21:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E286E81DE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHZlEEYUk7qF; Sat,  4 Nov 2023 21:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 413FD81D7C;
	Sat,  4 Nov 2023 21:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 413FD81D7C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17FF91BF5A7
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E567F60C1A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E567F60C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQSaCtKJE7hm for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:46:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FD8D60C00
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FD8D60C00
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F23038678D; Sat,  4 Nov 2023 21:46:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 22:45:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 160f0e4b5f161d1966a70ad36679a9f5e9dfa9d3
X-Git-Newrev: 3cc1b539e7e9fd49f571441e395e7daa8597dbec
X-Patchwork-Hint: ignore
Message-Id: <20231104214611.F23038678D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburing: bump to version 2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cc1b539e7e9fd49f571441e395e7daa8597dbec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of README (changes not related to licensing)

https://github.com/axboe/liburing/blob/liburing-2.4/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liburing/liburing.hash | 4 ++--
 package/liburing/liburing.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
index 7d3306850f..eaee8fcfa1 100644
--- a/package/liburing/liburing.hash
+++ b/package/liburing/liburing.hash
@@ -1,8 +1,8 @@
 # Locally calculated
-sha256  0fcd25dc1eb32cbeb534219f8e7fcfeadbd8dc2304aa447148e5ca8408076f22  liburing-2.2.tar.bz2
+sha256  ca260e7a5820c2d0e737ec1e9b999f10776dbe84a169a02a0eff10c8eeaf3394  liburing-2.4.tar.bz2
 
 # Hash for license files
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  2ec12f7934cdfce25ff72b0557738989d79fc7a496d1cf9b2d3f9464fd61edbe  LICENSE
-sha256  1c3351726408c22787dafbb5cc4bfeaa38ca8e92eabf59a36a046a5a2e66108f  README
+sha256  51e124279343177cb3c214ffddc011f1355b6eba0bbefca4f4c41fbc56574c92  README
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index e98c710997..c35fb39390 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURING_VERSION = 2.2
+LIBURING_VERSION = 2.4
 LIBURING_SOURCE = liburing-$(LIBURING_VERSION).tar.bz2
 LIBURING_SITE = https://git.kernel.dk/cgit/liburing/snapshot
 LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
