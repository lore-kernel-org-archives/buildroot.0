Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6187C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CAAE40C15;
	Sat,  6 May 2023 17:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CAAE40C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hy0RWqMRNMDV; Sat,  6 May 2023 17:39:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9366640CC3;
	Sat,  6 May 2023 17:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9366640CC3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EA4B1BF85D
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 268F4415CB
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 268F4415CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KyuJ3hjlAsuB for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 376DA409B1
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 376DA409B1
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:21 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout06.t-online.de (Postfix) with SMTP id 80D06B0BB
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:18 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd85.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsM-3RK6Lb0; Sat, 6 May 2023 19:39:18 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsM-0004jT-08
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:18 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:38:59 +0200
Message-Id: <20230506173917.1112500-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394758-A57C7C52-FEB012AE/0/0 CLEAN NORMAL
X-TOI-MSGID: 0d5e77c3-add1-42cb-8886-6b6f4881c193
Subject: [Buildroot] [PATCH 04/22] package/x11r7/xlib_libXi: bump version to
 1.8.1
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
https://lists.x.org/archives/xorg-announce/2023-May/003390.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXi/xlib_libXi.hash | 6 +++---
 package/x11r7/xlib_libXi/xlib_libXi.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.hash b/package/x11r7/xlib_libXi/xlib_libXi.hash
index a86ef13225..545d4881f6 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.hash
+++ b/package/x11r7/xlib_libXi/xlib_libXi.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-September/003109.html
-sha256  2ed181446a61c7337576467870bc5336fc9e222a281122d96c4d39a3298bba00  libXi-1.8.tar.bz2
-sha512  4b2c667a8466eb389f253d77285c3f506c4a2b6c75054c722974a864565d565cc0c5701f8ea773eb929ceb94adfeb737ecd7a0bfc2c240157416a5f343c07aba  libXi-1.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-May/003390.html
+sha256  89bfc0e814f288f784202e6e5f9b362b788ccecdeb078670145eacd8749656a7  libXi-1.8.1.tar.xz
+sha512  a30b1a07e6d710f5196e7477415d68074736f89d954e8f2d5ccc9b5f349e7d1d440c90fb512508176b5db5ecad55608cfb540872936b731963fd83343db3a0b9  libXi-1.8.1.tar.xz
 # Locally computed
 sha256  9392174bc86e291369fd2f61f3ed325962735a5f5c585ce8d7ebd365e2a5639f  COPYING
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index b4802cf018..6ae5ec8be8 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.8
-XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
-XLIB_LIBXI_SITE = https://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXI_VERSION = 1.8.1
+XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.xz
+XLIB_LIBXI_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXI_LICENSE = MIT
 XLIB_LIBXI_LICENSE_FILES = COPYING
 XLIB_LIBXI_CPE_ID_VENDOR = x.org
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
