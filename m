Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726ADC7EE29
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 08:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15FE140412;
	Sat, 10 Jun 2023 08:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15FE140412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjy35YCfDKdR; Sat, 10 Jun 2023 08:46:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BCEF401ED;
	Sat, 10 Jun 2023 08:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BCEF401ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA3391BF35E
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 08:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9275C41E53
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 08:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9275C41E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVa98UvvQhMg for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 08:46:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3429E41E40
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3429E41E40
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 08:46:43 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout04.t-online.de (Postfix) with SMTP id 6347924A6E
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 10:46:40 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd85.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7uF4-0TLpfV0; Sat, 10 Jun 2023 10:46:38 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:54728)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7uF3-00036m-2v
 for buildroot@buildroot.org; Sat, 10 Jun 2023 10:46:37 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 10:46:37 +0200
Message-Id: <20230610084637.3239026-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686386798-AFD93DAB-149F7641/0/0 CLEAN NORMAL
X-TOI-MSGID: 566fd519-785f-45f5-8da7-dc79bd6e0dc8
Subject: [Buildroot] [PATCH 1/1] package/less: bump version to 633
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

Removed patch which is included in this version.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .checkpackageignore                           |  1 -
 ...-on-invalid-embedded-escape-sequence.patch | 27 -------------------
 package/less/less.hash                        |  4 +--
 package/less/less.mk                          |  5 +---
 4 files changed, 3 insertions(+), 34 deletions(-)
 delete mode 100644 package/less/0001-End-OSC8-hyperlink-on-invalid-embedded-escape-sequence.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 592bf95d3a..71a96a9116 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -686,7 +686,6 @@ package/lcdproc/0001-LCDd.conf.patch Upstream
 package/lcdproc/0002-Add-missing-ioctl-header.patch Upstream
 package/lcdproc/0003-Fixcompilation-with-GCC-10-x.patch Upstream
 package/leafnode2/0001-cross_makefile.patch Upstream
-package/less/0001-End-OSC8-hyperlink-on-invalid-embedded-escape-sequence.patch Upstream
 package/let-me-create/0001-fix-build-with-musl-C-library.patch Upstream
 package/leveldb/0001-Fix-compilation-with-g-4.8.2.patch Upstream
 package/leveldb/0002-CMake-install-libmemenv.a.patch Upstream
diff --git a/package/less/0001-End-OSC8-hyperlink-on-invalid-embedded-escape-sequence.patch b/package/less/0001-End-OSC8-hyperlink-on-invalid-embedded-escape-sequence.patch
deleted file mode 100644
index 233f949e24..0000000000
--- a/package/less/0001-End-OSC8-hyperlink-on-invalid-embedded-escape-sequence.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From a78e1351113cef564d790a730d657a321624d79c Mon Sep 17 00:00:00 2001
-From: Mark Nudelman <markn@greenwoodsoftware.com>
-Date: Fri, 7 Oct 2022 19:25:46 -0700
-Subject: [PATCH] End OSC8 hyperlink on invalid embedded escape sequence.
-
-[Retrieved from:
-https://github.com/gwsw/less/commit/a78e1351113cef564d790a730d657a321624d79c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- line.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/line.c b/line.c
-index 236c49ae..cba7bdd1 100644
---- a/line.c
-+++ b/line.c
-@@ -633,8 +633,8 @@ ansi_step(pansi, ch)
- 		/* Hyperlink ends with \7 or ESC-backslash. */
- 		if (ch == '\7')
- 			return ANSI_END;
--		if (pansi->prev_esc && ch == '\\')
--			return ANSI_END;
-+		if (pansi->prev_esc)
-+            return (ch == '\\') ? ANSI_END : ANSI_ERR;
- 		pansi->prev_esc = (ch == ESC);
- 		return ANSI_MID;
- 	}
diff --git a/package/less/less.hash b/package/less/less.hash
index 19be26cae0..8018c9fab1 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-# https://www.greenwoodsoftware.com/less/less-608.sig
-sha256  a69abe2e0a126777e021d3b73aa3222e1b261f10e64624d41ec079685a6ac209  less-608.tar.gz
+# https://www.greenwoodsoftware.com/less/less-633.sig
+sha256  2f201d64b828b88af36dfe6cfdba3e0819ece2e446ebe6224813209aaefed04f  less-633.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index dfbd411863..91ce08f4f0 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-LESS_VERSION = 608
+LESS_VERSION = 633
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
 LESS_CPE_ID_VENDOR = gnu
 LESS_DEPENDENCIES = ncurses
 
-# 0001-End-OSC8-hyperlink-on-invalid-embedded-escape-sequence.patch
-LESS_IGNORE_CVES += CVE-2022-46663
-
 define LESS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/less $(TARGET_DIR)/usr/bin/less
 endef
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
