Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDCEC3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 20:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BBDA408CC;
	Thu, 29 Dec 2022 20:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BBDA408CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g5uRcSvFXo30; Thu, 29 Dec 2022 20:19:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46500408BF;
	Thu, 29 Dec 2022 20:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46500408BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 091541BF386
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 20:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E66EA40111
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 20:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E66EA40111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIwDtTYSyidT for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 20:18:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFDB6401E1
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFDB6401E1
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 20:18:52 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout07.t-online.de (Postfix) with SMTP id 5F2E41581A
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 21:18:50 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pAzMU-1KhJvV0; Thu, 29 Dec 2022 21:18:46 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:46660)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pAzMU-0000Rc-1b
 for buildroot@buildroot.org; Thu, 29 Dec 2022 21:18:46 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 21:18:45 +0100
Message-Id: <20221229201846.3498030-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229201846.3498030-1-bernd.kuhls@t-online.de>
References: <20221229201846.3498030-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672345126-FAC5D742-7516849D/0/0 CLEAN NORMAL
X-TOI-MSGID: 95ccd8d5-0e7a-4f61-9d54-a9c5d4b429f2
Subject: [Buildroot] [PATCH 3/4] package/x11r7/xcb-util: bump version to
 0.4.1
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
https://lists.x.org/archives/xorg-announce/2022-December/003306.html

Switched tarball to xz, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
