Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CE8C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A66440145;
	Thu,  8 Dec 2022 22:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A66440145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2Sp_MWWfG6n; Thu,  8 Dec 2022 22:39:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37031403E9;
	Thu,  8 Dec 2022 22:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37031403E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97FE81BF973
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EEE841915
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EEE841915
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j8gFC67BOloX for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB158418BD
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB158418BD
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:22 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout08.t-online.de (Postfix) with SMTP id 74AB413757
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:20 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd87.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PWz-0RSxsn0; Thu, 8 Dec 2022 23:38:17 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PWz-00048i-1P
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:17 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:08 +0100
Message-Id: <20221208223817.1088619-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539097-3BFEC81E-E685746C/0/0 CLEAN NORMAL
X-TOI-MSGID: a18327c8-7a66-41dd-b714-9a2bc5766d3d
Subject: [Buildroot] [PATCH 01/70] package/x11r7/xdriver_xf86-input-mouse:
 bump version to 1.9.4
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-mouse.hash                         | 8 +++-----
 .../xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk  | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
index fe83f6920f..adba659aea 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-June/002903.html
-md5  a2104693bbcfe1413397f7905eecd3dc  xf86-input-mouse-1.9.3.tar.bz2
-sha1  b3982998808ba43117fc066c4ecc94ce67c5818e  xf86-input-mouse-1.9.3.tar.bz2
-sha256  93ecb350604d05be98b7d4e5db3b8155a44890069a7d8d6b800c0bea79c85cc5  xf86-input-mouse-1.9.3.tar.bz2
-sha512  d99f5b4b1ef1aa4cbf1a92549e412f54f121bc804e4d6643248ad7ea18081b38b958bd289dc8476ebc0f6ef5f7424c2f2a8abcfaa30cae5378829549af6b148f  xf86-input-mouse-1.9.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003247.html
+sha256  7f6f8551fc238abdddcf9f38906564c1f8c7dacb0ad947cfc110487aefbd8d4c  xf86-input-mouse-1.9.4.tar.xz
+sha512  7dfde3b1e0c1291c4d78ee920942771808b007f743bfc6eed20de12579383745858673dd874a4b5cf4ab8d9d15f6f7ca2db81ee831547a488d64848a7fe5e16c  xf86-input-mouse-1.9.4.tar.xz
 # Locally computed
 sha256  472ff645ead9bf3ffb48d42c596376ffc595897e0c0993a071a7ada0da1f4f10  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 3886fa7aa1..4a9eb3089f 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.3
-XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.4
+XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.xz
+XDRIVER_XF86_INPUT_MOUSE_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_MOUSE_LICENSE = MIT
 XDRIVER_XF86_INPUT_MOUSE_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xorgproto
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
