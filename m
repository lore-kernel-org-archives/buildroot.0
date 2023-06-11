Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C77AC7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 14:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 241A160C16;
	Sun, 11 Jun 2023 14:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 241A160C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BoRxrpS7uwUz; Sun, 11 Jun 2023 14:56:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD8461117;
	Sun, 11 Jun 2023 14:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DD8461117
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D15DF1BF86B
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8C7B4170B
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C7B4170B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjMY6_2Mv7WQ for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 14:56:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0DB341707
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0DB341707
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 14:56:23 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout10.t-online.de (Postfix) with SMTP id 84E5A4D3E5
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 16:56:21 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8MUP-1x7DYx0; Sun, 11 Jun 2023 16:56:21 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:34716)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8MUO-0001vD-2W
 for buildroot@buildroot.org; Sun, 11 Jun 2023 16:56:20 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 16:56:09 +0200
Message-Id: <20230611145617.758070-5-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611145617.758070-1-bernd.kuhls@t-online.de>
References: <20230611145617.758070-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686495381-43FF1266-E09845E2/0/0 CLEAN NORMAL
X-TOI-MSGID: cdb71067-22b0-4995-8942-2d40fd0d1685
Subject: [Buildroot] [PATCH 04/12] package/x11r7/xlib_libX11: bump version
 to 1.8.5
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
 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index ed68164d5f..4fbec783d6 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003318.html
-sha256  c9a287a5aefa9804ce3cfafcf516fe96ed3f7e8e45c0e2ee59e84c86757df518  libX11-1.8.4.tar.xz
-sha512  3150a47498b0cb012482ee02efeaae16d9e736288f2b3f917be912e1613d56ad6b4ab180de8820305deb2b95dfd993633f43a65344d75979d6b86bdf110cb63e  libX11-1.8.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-June/003398.html
+sha256  e362c6f03c793171becd1ce2078c64789504c7d7ff48ee40a76ff76b59f6b561  libX11-1.8.5.tar.xz
+sha512  5274f6073ead119c8f915d302f1e2bf9579f88d28a2a2d084a4be2050b14fb605efe91099c89ba55aeb7ad36ae0ecbd519b0808be0e29f56367d5dd8faa063d3  libX11-1.8.5.tar.xz
 # Locally computed
 sha256  2e7012a140f000735a7172674a2d314398d79622444fba65d108b029b29ab283  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index add16f49db..5177e3a1e0 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.8.4
+XLIB_LIBX11_VERSION = 1.8.5
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.xz
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
