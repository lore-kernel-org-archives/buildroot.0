Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEF6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 12:56:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E751C60E73
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 12:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E751C60E73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86C2C6069A;
	Sat, 13 Nov 2021 12:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJAhGVCXTJow; Sat, 13 Nov 2021 12:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF32360673;
	Sat, 13 Nov 2021 12:56:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A21C1BF95C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 12:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3386760673
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 12:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GLyQmnFn-UI6 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 12:56:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B09460602
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 12:56:24 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout05.t-online.de (Postfix) with SMTP id 7231FEE31;
 Sat, 13 Nov 2021 13:56:21 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.5.80]) by fwd70.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mlsZx-2r2kHh0; Sat, 13 Nov 2021 13:56:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:57762)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mlsZw-00028Q-JI;
 Sat, 13 Nov 2021 13:56:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 13:56:17 +0100
Message-Id: <20211113125620.1981211-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211113125620.1981211-1-bernd.kuhls@t-online.de>
References: <20211113125620.1981211-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636808181-00001432-5299E1CA/0/0 CLEAN NORMAL
X-TOI-MSGID: 91ffcba7-4bf6-4c12-9a6e-3f2acb2944bd
Subject: [Buildroot] [PATCH/next 2/5] package/x11r7/xlib_libXi: bump version
 to 1.8
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reformatted hashes, removed md5 and sha1 hashes.

Release notes:
https://lists.x.org/archives/xorg-announce/2021-September/003109.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXi/xlib_libXi.hash | 10 ++++------
 package/x11r7/xlib_libXi/xlib_libXi.mk   |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.hash b/package/x11r7/xlib_libXi/xlib_libXi.hash
index 1235631321..a86ef13225 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.hash
+++ b/package/x11r7/xlib_libXi/xlib_libXi.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-June/002999.html
-md5 62c4af0839072024b4b1c8cbe84216c7  libXi-1.7.10.tar.bz2
-sha1 79052e50ea07ce2431f8988a60553d9091d46207  libXi-1.7.10.tar.bz2
-sha256 36a30d8f6383a72e7ce060298b4b181fd298bc3a135c8e201b7ca847f5f81061  libXi-1.7.10.tar.bz2
-sha512 591f0860bf5904897587c4990d6c852f3729a212d1ef390362d41242440e078221877c31db2232d5cc81727fe97f4e194b077f7de917e251e60641bbd06ee218  libXi-1.7.10.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-September/003109.html
+sha256  2ed181446a61c7337576467870bc5336fc9e222a281122d96c4d39a3298bba00  libXi-1.8.tar.bz2
+sha512  4b2c667a8466eb389f253d77285c3f506c4a2b6c75054c722974a864565d565cc0c5701f8ea773eb929ceb94adfeb737ecd7a0bfc2c240157416a5f343c07aba  libXi-1.8.tar.bz2
 # Locally computed
-sha256 9392174bc86e291369fd2f61f3ed325962735a5f5c585ce8d7ebd365e2a5639f  COPYING
+sha256  9392174bc86e291369fd2f61f3ed325962735a5f5c585ce8d7ebd365e2a5639f  COPYING
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index ad4cf5f96f..b4802cf018 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.7.10
+XLIB_LIBXI_VERSION = 1.8
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
 XLIB_LIBXI_SITE = https://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
