Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A63C43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 17:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D9DD410E8;
	Tue, 28 Jun 2022 17:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D9DD410E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CXfey3ZJa68o; Tue, 28 Jun 2022 17:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27525410E3;
	Tue, 28 Jun 2022 17:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27525410E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 297531BF82F
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 17:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02E6F410E3
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 17:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02E6F410E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqwWeJ_gRfKg for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 17:55:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5458410E2
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5458410E2
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 17:55:37 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout12.t-online.de (Postfix) with SMTP id 673AF1F29C
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 19:55:34 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.186.7]) by fwd70.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o6FQv-0oy62j0; Tue, 28 Jun 2022 19:55:29 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:46546)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o6FQu-0003xv-NE
 for buildroot@buildroot.org; Tue, 28 Jun 2022 19:55:28 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 19:55:28 +0200
Message-Id: <20220628175528.315928-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1656438929-0143FF0B-C6F8F212/0/0 CLEAN NORMAL
X-TOI-MSGID: 19b4839b-2945-47db-99d9-b645625d536b
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libX11: bump version to
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
https://lists.x.org/archives/xorg-announce/2022-June/003168.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index 8073888436..5a8f639165 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003161.html
-sha256  081bf42ebab023aa92cfdb20c7af8c5ae13d13e88a5e22f90f4453ef80bbdde4  libX11-1.8.tar.xz
-sha512  64899ba9efbda00211daf08534a2a98eba86bb377980d21ce319106075cd36b511b17245d02e8ebd1045e7c2147f2c005004bcf579121138be7a7b879eeca83b  libX11-1.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-June/003168.html
+sha256  1bc41aa1bbe01401f330d76dfa19f386b79c51881c7bbfee9eb4e27f22f2d9f7  libX11-1.8.1.tar.xz
+sha512  2e36d2c47519e0cb2697f588c0ccdf73fbe75c2163f0855c78f7052dc9e920bca081f9d5e39c707a14067f101faef74fc758c8862eeba675b1535b43119d533a  libX11-1.8.1.tar.xz
 # Locally computed
 sha256  2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 44ab866596..9ed9f1ddb3 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.8
+XLIB_LIBX11_VERSION = 1.8.1
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.xz
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
