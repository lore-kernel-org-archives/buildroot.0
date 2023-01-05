Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD01C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11AC04F09E;
	Tue, 21 Feb 2023 00:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11AC04F09E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1aUFT3tidsxG; Tue, 21 Feb 2023 00:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B34FD4F07B;
	Tue, 21 Feb 2023 00:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B34FD4F07B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE1401BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E4316FAD0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E4316FAD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqYDfABeQRnx for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 570756FAB0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 570756FAB0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54A96828C8; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Jan 2023 10:20:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a70e0bdfdabad5e9d789db181e0f4c37544a426b
X-Git-Newrev: 2b249eca85819761140f670cc52dcf8fb09ef5b3
X-Patchwork-Hint: ignore
Message-Id: <20230220205226.54A96828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xcb-util: bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b249eca85819761140f670cc52dcf8fb09ef5b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.x.org/archives/xorg-announce/2022-December/003306.html

Switched tarball to xz, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xcb-util/xcb-util.hash | 4 +++-
 package/x11r7/xcb-util/xcb-util.mk   | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xcb-util/xcb-util.hash b/package/x11r7/xcb-util/xcb-util.hash
index c088a62bab..b9d6687752 100644
--- a/package/x11r7/xcb-util/xcb-util.hash
+++ b/package/x11r7/xcb-util/xcb-util.hash
@@ -1,3 +1,5 @@
+# From https://lists.x.org/archives/xorg-announce/2022-December/003306.html
+sha256  5abe3bbbd8e54f0fa3ec945291b7e8fa8cfd3cccc43718f8758430f94126e512  xcb-util-0.4.1.tar.xz
+sha512  da67f2f017d2a1788dcf35f28d6956e171303a622a1dd085cd3d69fdb2ed77965d83c557cc926ebf9b32e905eb2cbb5921987250192d78a2f5edc4d437ed7d2b  xcb-util-0.4.1.tar.xz
 # locally computed
-sha256  46e49469cb3b594af1d33176cd7565def2be3fa8be4371d62271fabb5eae50e9  xcb-util-0.4.0.tar.bz2
 sha256  325b64f0b0284e08bbb7a78ae3e55c1edc2a7cd77f603225ae4b8ffc35423e37  COPYING
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index bb73530f94..793c3dc7f2 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XCB_UTIL_VERSION = 0.4.0
-XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
-XCB_UTIL_SITE = http://xcb.freedesktop.org/dist
+XCB_UTIL_VERSION = 0.4.1
+XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.xz
+XCB_UTIL_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XCB_UTIL_LICENSE = MIT
 XCB_UTIL_LICENSE_FILES = COPYING
 XCB_UTIL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
