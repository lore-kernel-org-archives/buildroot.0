Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A54AC77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7A4683B7E;
	Sun,  7 May 2023 12:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7A4683B7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdxjLLyE1-9d; Sun,  7 May 2023 12:06:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F3A883B5E;
	Sun,  7 May 2023 12:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F3A883B5E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF9841BF861
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF981418B6
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF981418B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YdXAIop0deTX for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:04:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF264418BE
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF264418BE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD54685EEF; Sun,  7 May 2023 12:04:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 13:59:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de8a3a53e52dc1ac6e04e623739aa67d412e965e
X-Git-Newrev: e24cd30a147992a6647da23cc4ff5b4aac1aa120
X-Patchwork-Hint: ignore
Message-Id: <20230507120438.AD54685EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-libinput:
 bump version to 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e24cd30a147992a6647da23cc4ff5b4aac1aa120
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-April/003378.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash    | 6 +++---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index 480886b295..cca2639dc3 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-January/003129.html
-sha256  8151db5b9ddb317c0ce92dcb62da9a8db5079e5b8a95b60abc854da21e7e971b  xf86-input-libinput-1.2.1.tar.xz
-sha512  3decf694861d1aa3c02d090e66c5ed5513818cb18e9863f1790e0c8122a972230fb903705062b8291e1709db9098623f1205c63ccfb68e552e104813414589c7  xf86-input-libinput-1.2.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-April/003378.html
+sha256  1446ba20a22bc968b5a4a0b4dbc3b8e037c50d9c59ac75fa3f7fc506c58c1abb  xf86-input-libinput-1.3.0.tar.xz
+sha512  f81f408b37e5f98ee97337dc4da6e78449e554e0ab2a3c6791b089d2cb6d645d0206ddf9babbc2120ab8bfe3b1489314fe42503ee015cec41775024538f3a34f  xf86-input-libinput-1.3.0.tar.xz
 # Locally computed
 sha256  4114220b281561e80f3422f0e7ae8d3e1fc85131ffc2e3b6265119e66f1adb27  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index d1f93ffb5b..381df31fee 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.2.1
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.3.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.xz
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
