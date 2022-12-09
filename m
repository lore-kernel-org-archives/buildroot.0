Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA3AC4167B
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4819141B6F;
	Fri,  9 Dec 2022 17:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4819141B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AUwe8sy7LEMT; Fri,  9 Dec 2022 17:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF3A41B76;
	Fri,  9 Dec 2022 17:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFF3A41B76
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B4C01BF976
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E68660F31
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E68660F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O0G3S83MBx2d for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14075611B5
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14075611B5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1233385EA0; Fri,  9 Dec 2022 17:01:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:36:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe85dbf818ab4321f3a18f742458f3313ed1b3ec
X-Git-Newrev: 445abe597ccb099660da911fa8fe1ab29b47e986
X-Patchwork-Hint: ignore
Message-Id: <20221209170105.1233385EA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_oclock: bump version to
 1.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=445abe597ccb099660da911fa8fe1ab29b47e986
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-August/003206.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_oclock/xapp_oclock.hash | 8 +++-----
 package/x11r7/xapp_oclock/xapp_oclock.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_oclock/xapp_oclock.hash b/package/x11r7/xapp_oclock/xapp_oclock.hash
index c8893f88b3..20e899b880 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.hash
+++ b/package/x11r7/xapp_oclock/xapp_oclock.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002856.html
-md5  973f6d25a6f0990720b98a15c9436b92  oclock-1.0.4.tar.bz2
-sha1  0bc8f3f44290950f60af894e20e0ceb0c5e8e862  oclock-1.0.4.tar.bz2
-sha256  cc20cfc1c0d5128d89e1eecd9ba52e58f111075be163e0aeda5690dbaafbaefe  oclock-1.0.4.tar.bz2
-sha512  6e0d36a84572a153226b2929f2253cb7adc3c9e5e3af168aeaf8c487ade2e43517b271a8e9cdb2a2c4a67ca56ed0b99c194ca63a4a822b68bfc72ca6518335e7  oclock-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-August/003206.html
+sha256  8f09979655e889d056b7a1e50b57f38b32529453e756b53ec659070fb3c3965c  oclock-1.0.5.tar.xz
+sha512  a87e89afdb25a91c36077e030b05c3907ddc063c6bdc0715a01bfc16edef8730b3b5a0347399ef4c8b2a13e70e068cba9ec5fe8d411f08548c0aa790a1873aff  oclock-1.0.5.tar.xz
 # Locally computed
 sha256  f6cae4b0c603ef5bd76da2df96b38aa43aa7547e482adb8cb8b83f09af35e4a2  COPYING
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.mk b/package/x11r7/xapp_oclock/xapp_oclock.mk
index 0f94cf8c13..4f70df4cbf 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.mk
+++ b/package/x11r7/xapp_oclock/xapp_oclock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_OCLOCK_VERSION = 1.0.4
-XAPP_OCLOCK_SOURCE = oclock-$(XAPP_OCLOCK_VERSION).tar.bz2
-XAPP_OCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_OCLOCK_VERSION = 1.0.5
+XAPP_OCLOCK_SOURCE = oclock-$(XAPP_OCLOCK_VERSION).tar.xz
+XAPP_OCLOCK_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_OCLOCK_LICENSE = MIT
 XAPP_OCLOCK_LICENSE_FILES = COPYING
 XAPP_OCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
