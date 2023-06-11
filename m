Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1590AC77B7A
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 14:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B560461181;
	Sun, 11 Jun 2023 14:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B560461181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fBBcFaMFHTXt; Sun, 11 Jun 2023 14:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC7686119F;
	Sun, 11 Jun 2023 14:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC7686119F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD26D1BF3E8
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9864682AED
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9864682AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4gPsDiuOoyV for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 14:56:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB07482C7C
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB07482C7C
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 14:56:25 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout04.t-online.de (Postfix) with SMTP id B4BC71A95E
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 16:56:23 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd85.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8MUP-3zPtIZ0; Sun, 11 Jun 2023 16:56:21 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:34716)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8MUO-0001vD-2i
 for buildroot@buildroot.org; Sun, 11 Jun 2023 16:56:20 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 16:56:10 +0200
Message-Id: <20230611145617.758070-6-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611145617.758070-1-bernd.kuhls@t-online.de>
References: <20230611145617.758070-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686495381-AF592DAB-B3555B2F/0/0 CLEAN NORMAL
X-TOI-MSGID: 51b78a55-1a92-403e-a0d8-f56bd5b4c551
Subject: [Buildroot] [PATCH 05/12] package/x11r7/xlib_xtrans: bump version
 to 1.5.0
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
https://lists.x.org/archives/xorg-announce/2023-June/003399.html

Updated license hash due to upstream commit which removed "All rights
reserved" from Oracle copyright notices:
https://gitlab.freedesktop.org/xorg/lib/libxtrans/-/commit/9d77996f9f972da63c06099fd8c0f0529159b98f

Added XLIB_XTRANS_INSTALL_TARGET = NO, quoting release notes:
"xtrans is a library of code that is shared among various X packages to
 handle network protocol transport in a modular fashion, allowing a single
 place to add new transport types - but it is *not* a shared library, more
 like a "header-only" library."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_xtrans/xlib_xtrans.hash | 10 ++++------
 package/x11r7/xlib_xtrans/xlib_xtrans.mk   |  7 ++++---
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.hash b/package/x11r7/xlib_xtrans/xlib_xtrans.hash
index 1bab37244e..9595a73d0e 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.hash
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002980.html
-md5  ce2fb8100c6647ee81451ebe388b17ad  xtrans-1.4.0.tar.bz2
-sha1  7c490026efb450798e02b040c05eba5212291c08  xtrans-1.4.0.tar.bz2
-sha256  377c4491593c417946efcd2c7600d1e62639f7a8bbca391887e2c4679807d773  xtrans-1.4.0.tar.bz2
-sha512  4fea89a3455c0e13321cbefa43340016dbb59bdd0dbdb5b796c1a6d2a6b1fd63cf1327b769ab426286b9c54b32ec764a50cd2b46228e4e43b841bda6b94de214  xtrans-1.4.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-June/003399.html
+sha256  1ba4b703696bfddbf40bacf25bce4e3efb2a0088878f017a50e9884b0c8fb1bd  xtrans-1.5.0.tar.xz
+sha512  e8091f11d4ad2b14e01de3eac56bdf2267ea26687ce66e3056374d0d02e049480c0b27c482f8828a0efd086f1e4c485108ca4dce3f83d66c1896effa3b38b228  xtrans-1.5.0.tar.xz
 # Locally computed
-sha256  a9c96c832e00774266b492d4d41556f12a64f039ba3ef645c4b8c6010fcb8f2a  COPYING
+sha256  22616bf00b6db85ee3164775a95206894af987b85ff1a7703de55644bc722a39  COPYING
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index 88c9b57a52..001705bb2e 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-XLIB_XTRANS_VERSION = 1.4.0
-XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
-XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_XTRANS_VERSION = 1.5.0
+XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.xz
+XLIB_XTRANS_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_XTRANS_LICENSE = MIT
 XLIB_XTRANS_LICENSE_FILES = COPYING
 XLIB_XTRANS_INSTALL_STAGING = YES
+XLIB_XTRANS_INSTALL_TARGET = NO
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
