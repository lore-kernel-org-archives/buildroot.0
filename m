Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B217C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA7A760BF4;
	Sun, 24 Jul 2022 16:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA7A760BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fGCSjtdv4czK; Sun, 24 Jul 2022 16:27:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B27060AF2;
	Sun, 24 Jul 2022 16:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B27060AF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28CAC1BF479
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D75C849BE
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D75C849BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TyEw7YN-XJH9 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67C1E8492E
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67C1E8492E
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout07.t-online.de (Postfix) with SMTP id CD2CB9FF8
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:05 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePd-0f12IR0; Sun, 24 Jul 2022 18:25:01 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePd-0007mb-17;
 Sun, 24 Jul 2022 18:25:01 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:24:58 +0200
Message-Id: <20220724162500.2683871-19-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679901-0144F70D-6E0DCF87/0/0 CLEAN NORMAL
X-TOI-MSGID: 004a95d0-495a-4e48-9ae1-8b0456e720fd
Subject: [Buildroot] [PATCH 18/20] package/x11r7/xlib_libxcvt: bump version
 to 0.1.2
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
 package/x11r7/xlib_libxcvt/xlib_libxcvt.hash | 6 +++---
 package/x11r7/xlib_libxcvt/xlib_libxcvt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash b/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash
index 71ae9170ac..f635c90fdc 100644
--- a/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash
+++ b/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-October/003114.html
-sha256  27ebce180d355f94c1992930bedb40a36f6d7312ee50bf7f0acbcd22f33e8c29  libxcvt-0.1.1.tar.xz
-sha512  50e9cd0283858823d4cfde75f06e23ffc42983272cb1f75408052fb5b76a4bb6f9de7d42d8ff9ec0dae6e95eefebc6273e03c919a92f237585db55eaf1a57005  libxcvt-0.1.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-July/003195.html
+sha256  0561690544796e25cfbd71806ba1b0d797ffe464e9796411123e79450f71db38  libxcvt-0.1.2.tar.xz
+sha512  3f6b2baca712a4608780686932f8881255c07bb74b1a788f9b07d4e22975c038d75111cd6b452257882a0b2bad57eebb2002f80a3e435d2e2d16936597f039b0  libxcvt-0.1.2.tar.xz
 # Locally calculated
 sha256  4849851554bdeda9a2a85ce93946b786605e009685941b8b907a9a36b02ae068  COPYING
diff --git a/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk b/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk
index 33a55dfa20..7f61054dbe 100644
--- a/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk
+++ b/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXCVT_VERSION = 0.1.1
+XLIB_LIBXCVT_VERSION = 0.1.2
 XLIB_LIBXCVT_SOURCE = libxcvt-$(XLIB_LIBXCVT_VERSION).tar.xz
 XLIB_LIBXCVT_SITE = https://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCVT_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
