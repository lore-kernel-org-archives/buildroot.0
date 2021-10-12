Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0245C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:33:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B61E6103D
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B61E6103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C32440790;
	Tue, 12 Oct 2021 20:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mF5GJJSC_a_C; Tue, 12 Oct 2021 20:33:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 778634078C;
	Tue, 12 Oct 2021 20:33:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A22431BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C23760C12
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8-OiWxiwDPLe for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:33:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B87E160C0C
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:33:04 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout03.t-online.de (Postfix) with SMTP id C897D7733;
 Tue, 12 Oct 2021 22:31:43 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.193.128]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1maOQz-1aYeor0; Tue, 12 Oct 2021 22:31:37 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:38454)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1maOQy-000225-PA;
 Tue, 12 Oct 2021 22:31:36 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 22:31:34 +0200
Message-Id: <20211012203136.16834-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1634070697-0000146E-D60512E9/0/0 CLEAN NORMAL
X-TOI-MSGID: 04d7dca3-767a-4530-858b-5f05086ec867
Subject: [Buildroot] [PATCH 1/3] package/libva: bump version to 2.13.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/intel/libva/releases/tag/2.13.0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.hash | 6 +++---
 package/libva/libva.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index b6531b2c57..7b66a7709d 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases/download/2.12.0/libva-2.12.0.tar.bz2.sha1sum
-sha1  9704197d1d909d727f2e180672d287070576a923  libva-2.12.0.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.13.0/libva-2.13.0.tar.bz2.sha1sum
+sha1  2adb2c023371dd68fe0d23e58afcf0b072b79828  libva-2.13.0.tar.bz2
 # Locally computed
-sha256  d3f4873715077a8c969c9bfe4ba8455a133353176be0ffe0c41ffd4155c9a8c8  libva-2.12.0.tar.bz2
+sha256  fad383f39f36115814bd0eda1496a4cc01761643bd962635400df2d4470ad460  libva-2.13.0.tar.bz2
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 70cf4fee91..6ac5386540 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.12.0
+LIBVA_VERSION = 2.13.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
