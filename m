Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FBEC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A17F44F11D;
	Tue, 21 Feb 2023 00:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A17F44F11D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jidNDrgQ4doN; Tue, 21 Feb 2023 00:14:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E8B34F11B;
	Tue, 21 Feb 2023 00:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E8B34F11B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 634D21BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A2776FAA4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A2776FAA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TenYtPmZjvkk for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34B1061099
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34B1061099
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32C37828C8; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Jan 2023 10:20:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1906e1fb7cb4104aa3e326f09926b2b3f5129991
X-Git-Newrev: 43b13ebbdc89f3d7597f476123bcddb7e0a1655d
X-Patchwork-Hint: ignore
Message-Id: <20230220205226.32C37828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xdriinfo:
 bump version to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=43b13ebbdc89f3d7597f476123bcddb7e0a1655d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.x.org/archives/xorg-announce/2022-December/003308.html

Switched tarball to xz, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash | 8 +++-----
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
index 21c50184c7..ce11d06977 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002858.html
-md5  480e63cd365f03eb2515a6527d5f4ca6  xdriinfo-1.0.6.tar.bz2
-sha1  11682ae1f04a311b832651d78bbf4c6ac77f0ed9  xdriinfo-1.0.6.tar.bz2
-sha256  d9ccd2c3e87899417acc9ea1f3e319a4198112babe1dc711273584f607449d51  xdriinfo-1.0.6.tar.bz2
-sha512  7ddd9e19abaef93e4d85004293528ec3814ef84c470d496dbb8dc8313d804bb7520406de8d33d2bc2b3af942bd0a5d5032a109b2726438a966af63ea680a102f  xdriinfo-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003308.html
+sha256  dd838bae9d2b19ddd71fe6d30ed33abc7c85e19d223e79d35600db3fa44bf734  xdriinfo-1.0.7.tar.xz
+sha512  a368cf32c606ca78f3a23bc5d88fb57b9c1a3827d0fec3e48cee153703135e47cecd3db8ee0eba93f309d7f03b4306c3f2e7f46f36d0d2970671c5e5b78093ad  xdriinfo-1.0.7.tar.xz
 # Locally computed
 sha256  de2fbb160bbb64c48975d7a3ebe3636a312b73227df1efe37488a8cecb9c1932  COPYING
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index 7f7aac9e15..7672dc8899 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XDRIINFO_VERSION = 1.0.6
-XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.bz2
-XAPP_XDRIINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDRIINFO_VERSION = 1.0.7
+XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.xz
+XAPP_XDRIINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDRIINFO_LICENSE = MIT
 XAPP_XDRIINFO_LICENSE_FILES = COPYING
 XAPP_XDRIINFO_DEPENDENCIES = libgl xlib_libX11 xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
