Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C44C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 956CC4DC17;
	Mon, 20 Feb 2023 21:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 956CC4DC17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69-l9vCj8tOS; Mon, 20 Feb 2023 21:41:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 332294D7A3;
	Mon, 20 Feb 2023 21:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 332294D7A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FFD91BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B34E1415C3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B34E1415C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UWau7D2XmlKl for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E658E415AF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E658E415AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E37F4828C8; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:33:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5ded7c84b569bc9b9e8bbbb23c768302098c8cfc
X-Git-Newrev: 8bf8f441d10848bddd47b9b0c84575177db2b4af
X-Patchwork-Hint: ignore
Message-Id: <20230220205157.E37F4828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_rgb: bump
 version to 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bf8f441d10848bddd47b9b0c84575177db2b4af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-October/003245.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_rgb/xapp_rgb.hash | 5 +++--
 package/x11r7/xapp_rgb/xapp_rgb.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_rgb/xapp_rgb.hash b/package/x11r7/xapp_rgb/xapp_rgb.hash
index ce05454ce9..11b2a83905 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.hash
+++ b/package/x11r7/xapp_rgb/xapp_rgb.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-November/002494.html
-sha256  bbca7c6aa59939b9f6a0fb9fff15dfd62176420ffd4ae30c8d92a6a125fbe6b0  rgb-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003245.html
+sha256  fc03d7f56e5b2a617668167f8927948cce54f93097e7ccd9f056077f479ed37b  rgb-1.1.0.tar.xz
+sha512  640888d64b2d328fff4a1652ba1299436e348bc3cbc90710d79c635acfa7f2fce0018adb818123b41ca008197ff1cbf87aab60501de36c163bed2d80d8556008  rgb-1.1.0.tar.xz
 # Locally computed
 sha256  1d08eb3384f5dedc7735bcfae1aa58cb64643ca9389edce3312b1c3cefbfdaa7  COPYING
diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
index b2d5d77744..4b6399fc76 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.mk
+++ b/package/x11r7/xapp_rgb/xapp_rgb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_RGB_VERSION = 1.0.6
-XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.bz2
-XAPP_RGB_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_RGB_VERSION = 1.1.0
+XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.xz
+XAPP_RGB_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_RGB_LICENSE = MIT
 XAPP_RGB_LICENSE_FILES = COPYING
 XAPP_RGB_DEPENDENCIES = xorgproto host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
