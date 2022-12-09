Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A356C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 074CB402F3;
	Fri,  9 Dec 2022 17:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 074CB402F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gG-q_YqJAbif; Fri,  9 Dec 2022 17:03:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40DD14100D;
	Fri,  9 Dec 2022 17:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40DD14100D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D48C1BF973
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCD8640002
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCD8640002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ckerQArSkL2Y for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24D0F402F3
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24D0F402F3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2324685E9E; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b6ea10c528c1c7b3f6ac7bbba7ba519974b2c3a
X-Git-Newrev: bac3d21a3fb3ef872b538adda01725c2fb77dd75
X-Patchwork-Hint: ignore
Message-Id: <20221209170103.2324685E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXdamage: bump
 version to 1.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=bac3d21a3fb3ef872b538adda01725c2fb77dd75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-December/003277.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXdamage/xlib_libXdamage.hash | 8 +++-----
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash b/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash
index 9e7cf566a7..41a809ad23 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002973.html
-md5  e3f554267a7a04b042dc1f6352bd6d99  libXdamage-1.1.5.tar.bz2
-sha1  719ae6ab8c1b972c6386b654976c479255af5572  libXdamage-1.1.5.tar.bz2
-sha256  b734068643cac3b5f3d2c8279dd366b5bf28c7219d9e9d8717e1383995e0ea45  libXdamage-1.1.5.tar.bz2
-sha512  a3ca6cc33b1727f717a3e2aa5593f660508a81a47918a0aa949e9e8fba105e303fe5071983b48caac92feea0fe6e8e01620805e4d19b41f21f20d837b191c124  libXdamage-1.1.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003277.html
+sha256  52733c1f5262fca35f64e7d5060c6fcd81a880ba8e1e65c9621cf0727afb5d11  libXdamage-1.1.6.tar.xz
+sha512  624dcefa1c79064569df952892f7f1351dc19ad338ce73d1a57041e406cb3e18abe531bab352b93d1f0f5c9b5c6b2652cc84a8f1fbfcbba648343812695a8acb  libXdamage-1.1.6.tar.xz
 # Locally computed
 sha256  33effe928634be12e668465c3935c5570ff2787b970b15d9243d69df42302c57  COPYING
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index cc5493ff6c..dba0862211 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXDAMAGE_VERSION = 1.1.5
-XLIB_LIBXDAMAGE_SOURCE = libXdamage-$(XLIB_LIBXDAMAGE_VERSION).tar.bz2
-XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXDAMAGE_VERSION = 1.1.6
+XLIB_LIBXDAMAGE_SOURCE = libXdamage-$(XLIB_LIBXDAMAGE_VERSION).tar.xz
+XLIB_LIBXDAMAGE_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXDAMAGE_LICENSE = MIT
 XLIB_LIBXDAMAGE_LICENSE_FILES = COPYING
 XLIB_LIBXDAMAGE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
