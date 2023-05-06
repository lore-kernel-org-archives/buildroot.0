Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95858C77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 412C540C5A;
	Sat,  6 May 2023 17:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 412C540C5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zAmHmp7dsMFq; Sat,  6 May 2023 17:40:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AB2641D75;
	Sat,  6 May 2023 17:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AB2641D75
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 114A41BF369
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9813B409B1
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9813B409B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HbJdjbpRyzHR for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8745C409FB
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8745C409FB
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:22 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout03.t-online.de (Postfix) with SMTP id 5D68D5840
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:20 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd73.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsN-3dyLpa0; Sat, 6 May 2023 19:39:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsM-0004jT-2s
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:18 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:39:06 +0200
Message-Id: <20230506173917.1112500-11-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394759-17094CF2-C48E28B8/0/0 CLEAN NORMAL
X-TOI-MSGID: 027600b0-d5b5-41f5-bd11-f05b18f50cda
Subject: [Buildroot] [PATCH 11/22] package/x11r7/xlib_libXfixes: bump
 version to 6.0.1
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
https://lists.x.org/archives/xorg-announce/2023-April/003382.html

Update license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/lib/libxfixes/-/commit/1f908b1f27723a9a8f532ab4cc58429c2f174224

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXfixes/xlib_libXfixes.hash | 9 ++++-----
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk   | 6 +++---
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
index 5dfe496052..03de906245 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
@@ -1,6 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-May/003086.html
-sha256  a7c1a24da53e0b46cac5aea79094b4b2257321c621b258729bc3139149245b4c  libXfixes-6.0.0.tar.bz2
-sha512  1985ef156f382e9a7e1cc7e044e0f626de1e4c82557a511cbcf6431994c0ac25b1f8b3a0293bd3089331593db8ce01d3a71ddec68f19b5fe6029d5082fb6885d  libXfixes-6.0.0.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2023-April/003382.html
+sha256  b695f93cd2499421ab02d22744458e650ccc88c1d4c8130d60200213abc02d58  libXfixes-6.0.1.tar.xz
+sha512  b46deffb30cd73ec8a127390d99f2ba2f3ab78f334fdba227f1f461441644a0c169b0d13ffa47576fa458780e7a6db664ff8b93e9195fb217262efd8128f1ffe  libXfixes-6.0.1.tar.xz
 # Locally calculated
-sha256  d64e671ffeb483d4543f98c842788ab34c77427e27d83d6b082065a4438d4885  COPYING
+sha256  a07d8a5a6972638a745a03983207a1052881c24eea29021fdca7794bea8d7774  COPYING
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index c0229b57d2..3f535fc1d4 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXFIXES_VERSION = 6.0.0
-XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.bz2
-XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXFIXES_VERSION = 6.0.1
+XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.xz
+XLIB_LIBXFIXES_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFIXES_LICENSE = MIT
 XLIB_LIBXFIXES_LICENSE_FILES = COPYING
 XLIB_LIBXFIXES_CPE_ID_VENDOR = x
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
