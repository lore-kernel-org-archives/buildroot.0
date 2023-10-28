Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454E4C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F121441927;
	Sat, 28 Oct 2023 21:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F121441927
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wiljUIHNidAx; Sat, 28 Oct 2023 21:06:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D11542F43;
	Sat, 28 Oct 2023 21:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D11542F43
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38B6C1BF869
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB912613B2
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB912613B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kn2x7Fw-iTvP for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04C5B613B8
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04C5B613B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02C7386077; Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:49:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0e96336aba445d711a352caadab68ed87e87d07
X-Git-Newrev: c709ab6fff85285c3f44eacbe780302a29a32ede
X-Patchwork-Hint: ignore
Message-Id: <20231028210322.02C7386077@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXpm: security bump
 to version 3.5.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=c709ab6fff85285c3f44eacbe780302a29a32ede
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-43788, CVE-2023-43789 and CVE-2023-43786

https://lists.x.org/archives/xorg-announce/2023-October/003424.html
https://lists.x.org/archives/xorg-announce/2023-October/003425.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.hash | 6 +++---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.hash b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
index a041f0d440..3582169891 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.hash
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003385.html
-sha256  e6bc5da7a69dbd9bcc67e87c93d4904fe2f5177a0711c56e71fa2f6eff649f51  libXpm-3.5.16.tar.xz
-sha512  ee564311f8c1c9c08ed1035d55c287ecf7c20c6fee09ad448acfab59f38fd1ef381d4a24b4af2b581f3033730eebc7c690918e52ba706de689d1ef11085edac2  libXpm-3.5.16.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-October/003425.html
+sha256  64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43  libXpm-3.5.17.tar.xz
+sha512  52f9d2664a47a26c1a6ad65d18867de870b66947b0b0d99cca3512756a0aaa6ce2a245c0b49f20b70c3ce48bf04c47c333e8119a147465c277bca727f6ab017e  libXpm-3.5.17.tar.xz
 # Locally calculated
 sha256  a80d706759624a04aa90fd62bc644a360fc3d72e08dcbfb129f167c11ca285de  COPYING
 sha256  cbe4ced0abc8a32bea471204ae01038c202758ce4e772d3d329a341ffa761e71  COPYRIGHT
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 51f6283370..0bba3ea946 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXPM_VERSION = 3.5.16
+XLIB_LIBXPM_VERSION = 3.5.17
 XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.xz
 XLIB_LIBXPM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
