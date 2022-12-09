Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD250C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A4B66118A;
	Fri,  9 Dec 2022 17:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A4B66118A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rI8cVpObOgrr; Fri,  9 Dec 2022 17:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2457610D2;
	Fri,  9 Dec 2022 17:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2457610D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1324F1BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B52141024
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B52141024
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3xODegIM_TZ for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C72541025
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C72541025
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A7CA85E9E; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:34:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c999fb9a0527e371f4d9f433436afcc1dc88d4af
X-Git-Newrev: f7f74ba0b3f8d5dd0dcf5af42e0622749e57a7e4
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.4A7CA85E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xcb-util-wm: bump version to
 0.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7f74ba0b3f8d5dd0dcf5af42e0622749e57a7e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-October/003235.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xcb-util-wm/xcb-util-wm.hash | 5 +++--
 package/x11r7/xcb-util-wm/xcb-util-wm.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xcb-util-wm/xcb-util-wm.hash b/package/x11r7/xcb-util-wm/xcb-util-wm.hash
index 444212accf..7383f015f2 100644
--- a/package/x11r7/xcb-util-wm/xcb-util-wm.hash
+++ b/package/x11r7/xcb-util-wm/xcb-util-wm.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-February/002401.html
-sha256  28bf8179640eaa89276d2b0f1ce4285103d136be6c98262b6151aaee1d3c2a3f  xcb-util-wm-0.4.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003235.html
+sha256  62c34e21d06264687faea7edbf63632c9f04d55e72114aa4a57bb95e4f888a0b  xcb-util-wm-0.4.2.tar.xz
+sha512  eab6588e6a47d28a3b25ecd13b5018529419db6b49c74458c093699b60a194933be1e1f6f7799abf03344f7ebc7af88586ff2935938d53644bdd5c763a7fa9b0  xcb-util-wm-0.4.2.tar.xz
 # License file, locally calculated
 sha256  12ab3559977a4b22ae3030b90c64a386e6ec51ab0e4eab1ff530f81a2639400a  COPYING
diff --git a/package/x11r7/xcb-util-wm/xcb-util-wm.mk b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
index 37df3fd92d..0c4f6e86fa 100644
--- a/package/x11r7/xcb-util-wm/xcb-util-wm.mk
+++ b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XCB_UTIL_WM_VERSION = 0.4.1
-XCB_UTIL_WM_SITE = http://xcb.freedesktop.org/dist
-XCB_UTIL_WM_SOURCE = xcb-util-wm-$(XCB_UTIL_WM_VERSION).tar.bz2
+XCB_UTIL_WM_VERSION = 0.4.2
+XCB_UTIL_WM_SITE = https://xorg.freedesktop.org/archive/individual/lib
+XCB_UTIL_WM_SOURCE = xcb-util-wm-$(XCB_UTIL_WM_VERSION).tar.xz
 XCB_UTIL_WM_INSTALL_STAGING = YES
 XCB_UTIL_WM_LICENSE = MIT
 XCB_UTIL_WM_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
