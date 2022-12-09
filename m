Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF56C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C49B610D2;
	Fri,  9 Dec 2022 17:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C49B610D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fed7Gc5onJTT; Fri,  9 Dec 2022 17:09:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59E0E60769;
	Fri,  9 Dec 2022 17:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59E0E60769
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EF971BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3366B41A67
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3366B41A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l5TAEOLZUcQt for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B7B741B3C
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B7B741B3C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BA3F85EA6; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:34:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b42c06423c7b31b5fdc8d2d06bdec7cd059eb30
X-Git-Newrev: cd91f23a6ab9d0bb734fa8084275d81a39d300b2
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.5BA3F85EA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xcb-util-keysyms: bump
 version to 0.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd91f23a6ab9d0bb734fa8084275d81a39d300b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-October/003233.html

Added license file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash |  7 +++++--
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk   | 10 ++++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash
index 6437d070f4..20a341ca22 100644
--- a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash
@@ -1,2 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-October/002485.html
-sha256  0ef8490ff1dede52b7de533158547f8b454b241aa3e4dcca369507f66f216dd9  xcb-util-keysyms-0.4.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003233.html
+sha256  7c260a5294412aed429df1da2f8afd3bd07b7cba3fec772fba15a613a6d5c638  xcb-util-keysyms-0.4.1.tar.xz
+sha512  dd53a36b52647f22bf0da8cded4b2974a51899eaac799797017ed8534f14bc2d2d339a14fa5ef387ae4528b7d9a5d31920bb0c71b09ca34f58e5081e768e2bbf  xcb-util-keysyms-0.4.1.tar.xz
+# Locally computed
+sha256  d499c1bf2c2a5f0a0498e5204d998388e308dcf2273dfbe2250a5b9a73f66537  COPYING
diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
index 9036b06fe8..364dc5b6da 100644
--- a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-XCB_UTIL_KEYSYMS_VERSION = 0.4.0
-XCB_UTIL_KEYSYMS_SOURCE = xcb-util-keysyms-$(XCB_UTIL_KEYSYMS_VERSION).tar.bz2
-XCB_UTIL_KEYSYMS_SITE = http://xcb.freedesktop.org/dist
-
-# unfortunately, no license file
+XCB_UTIL_KEYSYMS_VERSION = 0.4.1
+XCB_UTIL_KEYSYMS_SOURCE = xcb-util-keysyms-$(XCB_UTIL_KEYSYMS_VERSION).tar.xz
+XCB_UTIL_KEYSYMS_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XCB_UTIL_KEYSYMS_LICENSE = MIT
-
+XCB_UTIL_KEYSYMS_LICENSE_FILES = COPYING
 XCB_UTIL_KEYSYMS_INSTALL_STAGING = YES
 
 XCB_UTIL_KEYSYMS_DEPENDENCIES = host-pkgconf libxcb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
