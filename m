Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FEDC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD52C4098B;
	Mon, 20 Feb 2023 21:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD52C4098B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C93Fd3yXxxRH; Mon, 20 Feb 2023 21:44:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C767D4E95A;
	Mon, 20 Feb 2023 21:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C767D4E95A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B7FF1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40921415B3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40921415B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxn2GvVQeRO8 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E849415C1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E849415C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A11186494; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:35:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f7b42852817e93423afeff64e637795d8ba80672
X-Git-Newrev: 6111bac9e5d2f1cea5db127ad59f2379f86b90fd
X-Patchwork-Hint: ignore
Message-Id: <20230220205158.7A11186494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xcb-util-cursor:
 bump version to 0.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=6111bac9e5d2f1cea5db127ad59f2379f86b90fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-October/003230.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xcb-util-cursor/xcb-util-cursor.hash | 5 +++--
 package/x11r7/xcb-util-cursor/xcb-util-cursor.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
index 14cea17138..ca316d3ce8 100644
--- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2016-May/002691.html
-sha1  26562eb6d4151307f7b6a53453d360ecfc0563ac  xcb-util-cursor-0.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003230.html
+sha256  28dcfe90bcab7b3561abe0dd58eb6832aa9cc77cfe42fcdfa4ebe20d605231fb  xcb-util-cursor-0.1.4.tar.xz
+sha512  d27dd59a4d7ded9994dca77774421dd9533e3ee823b880af35d3219bd7340c89fbc61d1d0fa10e2991de2cac9e6395e09497769d7b8728eedc691e76649107b1  xcb-util-cursor-0.1.4.tar.xz
 # Locally computed
 sha256  0dde91ae1d443105dc9e13cbaed6674c36683b7095836ad9ddfce26be270aad5  COPYING
diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
index 07b37c5e47..0fb131693b 100644
--- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XCB_UTIL_CURSOR_VERSION = 0.1.3
-XCB_UTIL_CURSOR_SITE = http://xcb.freedesktop.org/dist
-XCB_UTIL_CURSOR_SOURCE = xcb-util-cursor-$(XCB_UTIL_CURSOR_VERSION).tar.bz2
+XCB_UTIL_CURSOR_VERSION = 0.1.4
+XCB_UTIL_CURSOR_SITE = https://xorg.freedesktop.org/archive/individual/lib
+XCB_UTIL_CURSOR_SOURCE = xcb-util-cursor-$(XCB_UTIL_CURSOR_VERSION).tar.xz
 XCB_UTIL_CURSOR_LICENSE = MIT
 XCB_UTIL_CURSOR_LICENSE_FILES = COPYING
 XCB_UTIL_CURSOR_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
