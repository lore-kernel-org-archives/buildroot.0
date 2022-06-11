Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA5DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 17:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 336D341225;
	Sat, 11 Jun 2022 17:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZf_NhuBj2w8; Sat, 11 Jun 2022 17:27:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E77E408D1;
	Sat, 11 Jun 2022 17:27:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C0E71BF82C
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 17:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0993C844B0
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 17:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zT8zxYZvlr8H for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 17:27:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06D32844AF
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 17:27:34 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout12.t-online.de (Postfix) with SMTP id 0719085AC
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 19:27:33 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.12.97]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o04tX-1zAXCr0; Sat, 11 Jun 2022 19:27:31 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:56822)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o04tX-0006jf-Gp
 for buildroot@buildroot.org; Sat, 11 Jun 2022 19:27:31 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 19:27:31 +0200
Message-Id: <20220611172731.2980548-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654968452-01432E2F-E8A06D06/0/0 CLEAN NORMAL
X-TOI-MSGID: 6c16f49d-ec03-441b-bdc1-fbd3241db406
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.111
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
https://lists.freedesktop.org/archives/dri-devel/2022-June/357686.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index e0fac3a4d1..48b60f66cd 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2022-February/342405.html
-sha256  eecee4c4b47ed6d6ce1a9be3d6d92102548ea35e442282216d47d05293cf9737  libdrm-2.4.110.tar.xz
-sha512  52f92ef1fe4c218a1d7dba53ef43334dbfca80e3209afe59f3a32c4bf67473126534e990df07a931a12d46a3b997c21ef17c1c4d8a0c88d44d5c6c040e3b6be3  libdrm-2.4.110.tar.xz
+# From https://lists.freedesktop.org/archives/dri-devel/2022-June/357686.html
+sha256  1ad7164f77424de6f4ecba7c262bde196a214c6e19a6fbf497f0815f4d7ab2a9  libdrm-2.4.111.tar.xz
+sha512  17e92e9e4ded8031ac222764bed7e9ff430a1a377f5e435f6b62b4a7f45cb4c4b769b3b79fbcba11512c1ac973abf8cdcca8e0b9659ae095e915d3d5efcf5516  libdrm-2.4.111.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index b64db06931..5cfd2d56eb 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.110
+LIBDRM_VERSION = 2.4.111
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
