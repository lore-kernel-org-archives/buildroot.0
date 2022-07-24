Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD203C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 869C76116B;
	Sun, 24 Jul 2022 16:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 869C76116B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AJyqKs38l6Ke; Sun, 24 Jul 2022 16:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B14B60AF2;
	Sun, 24 Jul 2022 16:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B14B60AF2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4AD791BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24F414052E
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24F414052E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WOPbzJp5OQIw for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FC2A400B9
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FC2A400B9
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout01.t-online.de (Postfix) with SMTP id CC70550E
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:05 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePd-0f12IP0; Sun, 24 Jul 2022 18:25:01 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePd-0007mb-05;
 Sun, 24 Jul 2022 18:25:01 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:24:53 +0200
Message-Id: <20220724162500.2683871-14-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679901-0144F70D-07031985/0/0 CLEAN NORMAL
X-TOI-MSGID: 9dd04583-645b-4971-88dc-fba9673af8b3
Subject: [Buildroot] [PATCH 13/20] package/x11r7/xapp_xmessage: bump version
 to 1.0.6
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xmessage/xapp_xmessage.hash | 10 ++++------
 package/x11r7/xapp_xmessage/xapp_xmessage.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.hash b/package/x11r7/xapp_xmessage/xapp_xmessage.hash
index b668edf6a1..350739284f 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.hash
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002868.html
-md5 e50ffae17eeb3943079620cb78f5ce0b  xmessage-1.0.5.tar.bz2
-sha1 d3eca72c7173d0d9547c676a16bcec51ca1213a2  xmessage-1.0.5.tar.bz2
-sha256 373dfb81e7a6f06d3d22485a12fcde6e255d58c6dee1bbaeb00c7d0caa9b2029  xmessage-1.0.5.tar.bz2
-sha512 a8423c3986b1576fa67800c315a605a527bb9a8f594ac269a736ae7b91eed0d4d83deb89148197dc3cd3f0e51894146958ce2979f78e97dcdb99c5326e34dabe  xmessage-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003187.html
+sha256  d2eac545f137156b960877e052fcc8e29795ed735c02f7690fd7b439e6846a12  xmessage-1.0.6.tar.xz
+sha512  89deb7a81bd047027f99cb92cd16a47f94479c61a6f9fbac4638e6d642037b3e9bbac2313db59ac8c5544175947c693f6a210537c6df2b88dc3de1c67498cba8  xmessage-1.0.6.tar.xz
 # Locally computed
-sha256 dfd5427188bd6d6647ad1a9a0644428403c6239f6aa7f9d1a17629d8cc0a4ecd COPYING
+sha256  dfd5427188bd6d6647ad1a9a0644428403c6239f6aa7f9d1a17629d8cc0a4ecd COPYING
diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
index 9d426974bd..52a9f32631 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMESSAGE_VERSION = 1.0.5
-XAPP_XMESSAGE_SOURCE = xmessage-$(XAPP_XMESSAGE_VERSION).tar.bz2
-XAPP_XMESSAGE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMESSAGE_VERSION = 1.0.6
+XAPP_XMESSAGE_SOURCE = xmessage-$(XAPP_XMESSAGE_VERSION).tar.xz
+XAPP_XMESSAGE_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XMESSAGE_LICENSE = MIT
 XAPP_XMESSAGE_LICENSE_FILES = COPYING
 XAPP_XMESSAGE_DEPENDENCIES = xlib_libXaw
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
