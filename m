Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21C9C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 21:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41500403B4;
	Mon, 12 Dec 2022 21:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41500403B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPEJMEHaRdDx; Mon, 12 Dec 2022 21:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47D77403C1;
	Mon, 12 Dec 2022 21:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47D77403C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 706831BF30A
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 21:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BA6060B20
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 21:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BA6060B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lj0GwMQwW5Mw for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 21:22:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27CCE60AC3
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27CCE60AC3
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 21:22:59 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout10.t-online.de (Postfix) with SMTP id 52D3A23D4C
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 22:22:56 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4qGA-0TPgLx0; Mon, 12 Dec 2022 22:22:50 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:39876)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4qG9-0007PB-2s
 for buildroot@buildroot.org; Mon, 12 Dec 2022 22:22:49 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 22:22:49 +0100
Message-Id: <20221212212249.2360248-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670880170-EEFEF7E2-EE604427/0/0 CLEAN NORMAL
X-TOI-MSGID: 723d845c-5fe3-4688-b504-f00a923373f2
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-input-libinput:
 bump version to 1.2.1
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
https://lists.x.org/archives/xorg-announce/2022-January/003129.html

Switched tarball to xz, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-libinput.hash                       | 7 +++----
 .../xdriver_xf86-input-libinput.mk                         | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index a2f295d6b5..480886b295 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,6 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-September/003110.html
-sha256  f80da3c514fe1cbf57fa1b1bd6ff97f6b0a1f87466ad89247bac59cd0a5869f6  xf86-input-libinput-1.2.0.tar.bz2
-sha512  ebff9490d33fd7495df2e03203060a76b3274f0e638bc92f3d95257fac57cdb9dac308e90e54006fe9522b6de3b1f1c38fd5f0b0b75b7051e5422290f43de52d  xf86-input-libinput-1.2.0.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2022-January/003129.html
+sha256  8151db5b9ddb317c0ce92dcb62da9a8db5079e5b8a95b60abc854da21e7e971b  xf86-input-libinput-1.2.1.tar.xz
+sha512  3decf694861d1aa3c02d090e66c5ed5513818cb18e9863f1790e0c8122a972230fb903705062b8291e1709db9098623f1205c63ccfb68e552e104813414589c7  xf86-input-libinput-1.2.1.tar.xz
 # Locally computed
 sha256  4114220b281561e80f3422f0e7ae8d3e1fc85131ffc2e3b6265119e66f1adb27  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 21d962aa52..d1f93ffb5b 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.2.0
-XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_LIBINPUT_SITE = https://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.2.1
+XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.xz
+XDRIVER_XF86_INPUT_LIBINPUT_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_LIBINPUT_DEPENDENCIES = libinput xserver_xorg-server xorgproto
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
