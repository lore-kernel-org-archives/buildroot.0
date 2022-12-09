Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72DFC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DCFD40492;
	Fri,  9 Dec 2022 17:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DCFD40492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NWbM-2I2vZrb; Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90BF440002;
	Fri,  9 Dec 2022 17:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90BF440002
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA3B41BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8558382119
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8558382119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R5-6SwdDuSoL for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D11A882112
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D11A882112
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFEB885EA0; Fri,  9 Dec 2022 17:01:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82abffdbb7784ab30874544f740abf23f6c0c695
X-Git-Newrev: d8ae5b86edcf172d824982c0740c5099ea087697
X-Patchwork-Hint: ignore
Message-Id: <20221209170102.BFEB885EA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libICE: bump version to
 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8ae5b86edcf172d824982c0740c5099ea087697
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-December/003288.html
https://lists.x.org/archives/xorg-announce/2022-December/003274.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libICE/xlib_libICE.hash | 8 +++-----
 package/x11r7/xlib_libICE/xlib_libICE.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libICE/xlib_libICE.hash b/package/x11r7/xlib_libICE/xlib_libICE.hash
index 2bfbe54788..4a58f97698 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.hash
+++ b/package/x11r7/xlib_libICE/xlib_libICE.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003006.html
-md5  76d77499ee7120a56566891ca2c0dbcf  libICE-1.0.10.tar.bz2
-sha1  5b5eb125d4f43a3ab8153b0f850963ee6c982c24  libICE-1.0.10.tar.bz2
-sha256  6f86dce12cf4bcaf5c37dddd8b1b64ed2ddf1ef7b218f22b9942595fb747c348  libICE-1.0.10.tar.bz2
-sha512  2f1ef2c32c833c71894a08fa7e7ed53f301f6c7bd22485d71c12884d8e8b36b99f362ec886349dcc84d08edc81c8b2cea035320831d64974edeba021b433c468  libICE-1.0.10.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003288.html
+sha256  03e77afaf72942c7ac02ccebb19034e6e20f456dcf8dddadfeb572aa5ad3e451  libICE-1.1.1.tar.xz
+sha512  2f7833a25f31cc743ca95cb88f9a8403b50e19ffb5bf43bfef87ba405857d359789daaa9ec2391351237d958f16d35dbf082adb76d301e46d3a54162a6b452d3  libICE-1.1.1.tar.xz
 # Locally computed
 sha256  60105b7ea93cb07a67fee8443b092b727e3db7f0dff4fbe05bc6cd7747fb53c8  COPYING
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index 2b56aaab98..d92e81c0ab 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBICE_VERSION = 1.0.10
-XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.bz2
+XLIB_LIBICE_VERSION = 1.1.1
+XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.xz
 XLIB_LIBICE_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBICE_LICENSE = MIT
 XLIB_LIBICE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
