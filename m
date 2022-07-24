Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC57C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1F4560FDF;
	Sun, 24 Jul 2022 16:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1F4560FDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g81DtU_Z14c7; Sun, 24 Jul 2022 16:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A045360AF2;
	Sun, 24 Jul 2022 16:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A045360AF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3004B1BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4A0A416A3
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4A0A416A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4vyMh50D983O for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A938541605
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A938541605
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:06 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout06.t-online.de (Postfix) with SMTP id 4662212DF1
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:04 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePc-3I37580; Sun, 24 Jul 2022 18:25:00 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePc-0007mb-25;
 Sun, 24 Jul 2022 18:25:00 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:24:47 +0200
Message-Id: <20220724162500.2683871-8-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679900-0144CFA9-90814114/0/0 CLEAN NORMAL
X-TOI-MSGID: 8f5d7ceb-286e-45e0-b716-42e01fd6a3a6
Subject: [Buildroot] [PATCH 07/20] package/x11r7/xapp_xpr: bump version to
 1.1.0
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
 package/x11r7/xapp_xpr/xapp_xpr.hash | 10 ++++------
 package/x11r7/xapp_xpr/xapp_xpr.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xpr/xapp_xpr.hash b/package/x11r7/xapp_xpr/xapp_xpr.hash
index 0a1b4f81b9..841fddd08b 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.hash
+++ b/package/x11r7/xapp_xpr/xapp_xpr.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002869.html
-md5 eaac255076ea351fd08d76025788d9f9  xpr-1.0.5.tar.bz2
-sha1 0632c7d8632ac9d23f285811aaea805a2956e155  xpr-1.0.5.tar.bz2
-sha256 b936e0f1f8d63f5ad097a0bbdce2e67c34f5d49b7263f32a832ff62d394d1e1f  xpr-1.0.5.tar.bz2
-sha512 d5dfb936ec4ad0067d02654dec8e862fe337ff6a2c2f974b2b3a612a829c2e728a0d51e7aba00ed2a94dc96dc50cc69f2c59f522e0635013f5f4f5bb3f4ab967  xpr-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003177.html
+sha256  a0bbb11475366622632440b1c6f16d19964b4516483232fe5f46c169528557c5  xpr-1.1.0.tar.xz
+sha512  53eb896cf1844036a13b1018ffcecbc6a0a56eebe0d7cb6331dbe691207498d2c41f3791655b7fc081acfef2ed9904987f363b710bf0eeff6c8d33f819a951cb  xpr-1.1.0.tar.xz
 # Locally computed
-sha256 5e8ff9b5d3fc86b5d0bc5957c9ee0aa1a6d0fb9a6b116aae70762b628a0d5069 COPYING
+sha256  5e8ff9b5d3fc86b5d0bc5957c9ee0aa1a6d0fb9a6b116aae70762b628a0d5069 COPYING
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
index b77c5b4844..4db4cd3309 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ b/package/x11r7/xapp_xpr/xapp_xpr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XPR_VERSION = 1.0.5
-XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.bz2
-XAPP_XPR_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XPR_VERSION = 1.1.0
+XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.xz
+XAPP_XPR_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XPR_LICENSE = MIT
 XAPP_XPR_LICENSE_FILES = COPYING
 XAPP_XPR_DEPENDENCIES = xlib_libX11 xlib_libXmu
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
