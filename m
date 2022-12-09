Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D54C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57C4647394;
	Mon, 20 Feb 2023 21:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57C4647394
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Mmm_vcRQAuL; Mon, 20 Feb 2023 21:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32FE24EBE1;
	Mon, 20 Feb 2023 21:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32FE24EBE1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D1691BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D64CB415A0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D64CB415A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hrMz0sjIzFvi for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D9EF415B0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D9EF415B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1AE886494; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:36:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5e2df02d3109131b72880ebf313088e70366c5da
X-Git-Newrev: 4b8022395d32d8bda95ca084436659a983932c11
X-Patchwork-Hint: ignore
Message-Id: <20230220205158.F1AE886494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xlib_libXxf86vm:
 bump version to 1.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b8022395d32d8bda95ca084436659a983932c11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-September/003213.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash | 7 +++----
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
index 0601360c0e..d181310c69 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
@@ -1,6 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-February/002539.html
-sha1  78ef18ca2be157131899e01c62679e247409a13f  libXxf86vm-1.1.4.tar.bz2
-sha256  afee27f93c5f31c0ad582852c0fb36d50e4de7cd585fcf655e278a633d85cd57  libXxf86vm-1.1.4.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2022-September/003213.html
+sha256  247fef48b3e0e7e67129e41f1e789e8d006ba47dba1c0cdce684b9b703f888e7  libXxf86vm-1.1.5.tar.xz
+sha512  68226fcb9773a583ea417ab413146203dd7db6ff8a4d388285da972353355e11e179861a77c9fa284aefac025bb3bbf5a9537fa0bf246c782e0116a667c9d9b6  libXxf86vm-1.1.5.tar.xz
 # Locally calculated
 sha256  f3da8eaed19e27e4f67e6f076d4ebdb8d649e15a8ad33a415fb65a23de1b6689  COPYING
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index 8871bd507e..0f3decb04e 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXXF86VM_VERSION = 1.1.4
-XLIB_LIBXXF86VM_SOURCE = libXxf86vm-$(XLIB_LIBXXF86VM_VERSION).tar.bz2
-XLIB_LIBXXF86VM_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXXF86VM_VERSION = 1.1.5
+XLIB_LIBXXF86VM_SOURCE = libXxf86vm-$(XLIB_LIBXXF86VM_VERSION).tar.xz
+XLIB_LIBXXF86VM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXXF86VM_LICENSE = MIT
 XLIB_LIBXXF86VM_LICENSE_FILES = COPYING
 XLIB_LIBXXF86VM_CPE_ID_VENDOR = x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
