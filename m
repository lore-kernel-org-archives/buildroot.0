Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7914C46467
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 20:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ED75606C0;
	Thu, 29 Dec 2022 20:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ED75606C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id smTh6-xitC7q; Thu, 29 Dec 2022 20:18:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7157F60669;
	Thu, 29 Dec 2022 20:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7157F60669
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E607C1BF386
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 20:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C146A81992
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 20:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C146A81992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dcY-jDM7dk4Q for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 20:18:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB1681772
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AB1681772
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 20:18:50 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout09.t-online.de (Postfix) with SMTP id 44BE321D5F
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 21:18:47 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pAzMU-2ZJdnl0; Thu, 29 Dec 2022 21:18:46 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:46660)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pAzMU-0000Rc-1B
 for buildroot@buildroot.org; Thu, 29 Dec 2022 21:18:46 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 21:18:43 +0100
Message-Id: <20221229201846.3498030-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672345126-17FF2EA1-2629ABFF/0/0 CLEAN NORMAL
X-TOI-MSGID: d5a05493-4b36-481b-86a3-42437ed49333
Subject: [Buildroot] [PATCH 1/4] package/x11r7/xapp_xdriinfo: bump version
 to 1.0.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2022-December/003308.html

Switched tarball to xz, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
