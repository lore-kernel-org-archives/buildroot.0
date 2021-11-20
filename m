Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3DBC433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 09:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E18DB818D4;
	Sat, 20 Nov 2021 09:50:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNuCvntRRW-0; Sat, 20 Nov 2021 09:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42C46817E4;
	Sat, 20 Nov 2021 09:49:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A991B1BF271
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 09:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A147E402A4
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 09:49:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plvxwDKBo-at for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 09:49:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C9A9400F0
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 09:49:56 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout02.t-online.de (Postfix) with SMTP id 5959526F6;
 Sat, 20 Nov 2021 10:48:35 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.220]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1moMz4-4Sh38T0; Sat, 20 Nov 2021 10:48:35 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:45088)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1moMz4-00037O-D3;
 Sat, 20 Nov 2021 10:48:34 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 10:48:34 +0100
Message-Id: <20211120094834.1840554-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1637401715-00001460-0EA204B4/0/0 CLEAN NORMAL
X-TOI-MSGID: fb1c8654-a99c-437e-b906-b6736644927c
Subject: [Buildroot] [PATCH/next 1/1] package/jpeg-turbo: bump version to
 2.1.2
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
Cc: Murat Demirten <mdemirten@yh.com.tr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelogs:
https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.1.0
https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.1.1
https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.1.2

Updated license hashes due to upstream commits:
https://github.com/libjpeg-turbo/libjpeg-turbo/commits/main/LICENSE.md
https://github.com/libjpeg-turbo/libjpeg-turbo/commits/main/README.ijg

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/jpeg-turbo/jpeg-turbo.hash | 12 ++++++------
 package/jpeg-turbo/jpeg-turbo.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 1a22b1d6ff..de82199659 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.6/
-sha1  5406c7676d7df89fb4da791ad5af51202910fb25  libjpeg-turbo-2.0.6.tar.gz
-md5  4cada3f0bdc93d826fa31bf9e4469ef6  libjpeg-turbo-2.0.6.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.2/
+sha1  65c51c543b1fbba6db9ff5bee474ccb0b52a929f  libjpeg-turbo-2.1.2.tar.gz
+md5  e181bd78884dd5392a869209bfa41d4a  libjpeg-turbo-2.1.2.tar.gz
 # Locally computed
-sha256  d74b92ac33b0e3657123ddcf6728788c90dc84dcb6a52013d758af3c4af481bb  libjpeg-turbo-2.0.6.tar.gz
-sha256  0b7a24c3906d26dfbe24e96e9415549b387c3227140dc6b7ab2fb924254e37a1  LICENSE.md
-sha256  01ccef626ec864773c681d4a4056f72af9052d619e0609df0d369117f8b3efdf  README.ijg
+sha256  09b96cb8cbff9ea556a9c2d173485fd19488844d55276ed4f42240e1e2073ce5  libjpeg-turbo-2.1.2.tar.gz
+sha256  7d8683a7f048e715e08b4cada8b7f0d9a6ab8afad88ed09c1143ef764ecbc0f2  LICENSE.md
+sha256  4b7b9f8c03bb8d60270dfd12684e70ab21e4abfd27e73905cd1a7c4cae6f5cdb  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 5c977dc029..ddae019839 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.0.6
+JPEG_TURBO_VERSION = 2.1.2
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
