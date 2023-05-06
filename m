Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22579C77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C255F42A6C;
	Sat,  6 May 2023 17:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C255F42A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sX2CXTykQRAK; Sat,  6 May 2023 17:43:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C856141145;
	Sat,  6 May 2023 17:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C856141145
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F05EB1BF369
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D28B5409B1
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D28B5409B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nMzQYfsi-7Fh for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53285409FB
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53285409FB
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:29 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout03.t-online.de (Postfix) with SMTP id 4E0125837
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:27 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd70.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsM-0QLfYf0; Sat, 6 May 2023 19:39:18 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsL-0004jT-2n
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:17 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:38:57 +0200
Message-Id: <20230506173917.1112500-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394758-DD540C15-26DC503C/0/0 CLEAN NORMAL
X-TOI-MSGID: 00941a3d-7fd5-4f2a-99df-e9b2d2cdbfe1
Subject: [Buildroot] [PATCH 02/22] package/x11r7/xdriver_xf86-input-mouse:
 bump version to 1.9.5
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
https://lists.x.org/archives/xorg-announce/2023-May/003392.html

Updated license hash due to upstream commit
https://gitlab.freedesktop.org/xorg/driver/xf86-input-mouse/-/commit/5f63ab04338fd811c610ae7617757ede52471316

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-mouse.hash                         | 8 ++++----
 .../xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk  | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
index adba659aea..d654c362a9 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003247.html
-sha256  7f6f8551fc238abdddcf9f38906564c1f8c7dacb0ad947cfc110487aefbd8d4c  xf86-input-mouse-1.9.4.tar.xz
-sha512  7dfde3b1e0c1291c4d78ee920942771808b007f743bfc6eed20de12579383745858673dd874a4b5cf4ab8d9d15f6f7ca2db81ee831547a488d64848a7fe5e16c  xf86-input-mouse-1.9.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-May/003392.html
+sha256  4fde8ae9b44352e2a208584c36528ee3ed13cf5fe4417208a9785daccefd9968  xf86-input-mouse-1.9.5.tar.xz
+sha512  ed9bd9cb9a05dac0ff1bfb4e4704cb2e94117afb400aa9e0b7ccdbb102bc6db1b0d3af7cb6f99d0892f8fc306f1643286291c0fa7114af8e65864412bd6c1afa  xf86-input-mouse-1.9.5.tar.xz
 # Locally computed
-sha256  472ff645ead9bf3ffb48d42c596376ffc595897e0c0993a071a7ada0da1f4f10  COPYING
+sha256  5b066654bdb61a1ef41f38cceda752897bbddb6e60e20f5889cab436a9b7b813  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 4a9eb3089f..25e25ab93d 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.4
+XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.5
 XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.xz
 XDRIVER_XF86_INPUT_MOUSE_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_MOUSE_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
