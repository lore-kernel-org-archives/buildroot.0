Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFF6C04FDE
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8018B61197;
	Fri,  9 Dec 2022 17:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8018B61197
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cPsx72Or9hAS; Fri,  9 Dec 2022 17:12:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE28A6115C;
	Fri,  9 Dec 2022 17:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE28A6115C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 648F91BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E74A5611AA
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E74A5611AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Xy5oMUgfA4J for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7331611AF
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7331611AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B562385EA0; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:36:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77c048e6297193ba4e116484bd8005fafdc412e1
X-Git-Newrev: e17f3076021efbd9ed699d78dc252aa0bf629922
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.B562385EA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-vmmouse:
 bump version to 13.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e17f3076021efbd9ed699d78dc252aa0bf629922
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-October/003217.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash      | 5 +++--
 .../x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk  | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash
index fd6221fa23..2a221a4c12 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-June/002616.html
-sha256  0af558957ac1be1b2863712c2475de8f4d7f14921fd01ded2e2fde4921b19319  xf86-input-vmmouse-13.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003217.html
+sha256  56f077580ab8f02e2f40358c5c46b0ae3e1828fc77744526b24adf1ceea339b8  xf86-input-vmmouse-13.2.0.tar.xz
+sha512  26a01347a679db058abdc7cbd9a363bb4fccd1a727dc18e279d15b8a0dce71f67af5ff54df28b908391da8d2fc311d8c1813f26dcded4e9a2668db7b55ca5687  xf86-input-vmmouse-13.2.0.tar.xz
 # Locally calculated
 sha256  804737a1582428fdde4e2bfd1e9f3ca07971fc3bdce20ba2d06cc2bba6c84a9e  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
index b8c77de5f6..178e1344b2 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_VMMOUSE_VERSION = 13.1.0
-XDRIVER_XF86_INPUT_VMMOUSE_SOURCE = xf86-input-vmmouse-$(XDRIVER_XF86_INPUT_VMMOUSE_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_VMMOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_VMMOUSE_VERSION = 13.2.0
+XDRIVER_XF86_INPUT_VMMOUSE_SOURCE = xf86-input-vmmouse-$(XDRIVER_XF86_INPUT_VMMOUSE_VERSION).tar.xz
+XDRIVER_XF86_INPUT_VMMOUSE_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_VMMOUSE_LICENSE = MIT
 XDRIVER_XF86_INPUT_VMMOUSE_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
