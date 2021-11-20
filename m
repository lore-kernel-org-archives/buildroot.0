Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0455FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 10:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4830824DD;
	Sat, 20 Nov 2021 10:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qcw8mlW_shk8; Sat, 20 Nov 2021 10:01:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF30C82521;
	Sat, 20 Nov 2021 10:01:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB4861BF271
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 10:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B11540361
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 10:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIS8JrV6IS9e for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 10:01:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9F5640257
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 10:01:16 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout12.t-online.de (Postfix) with SMTP id 557DDC158;
 Sat, 20 Nov 2021 11:01:11 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.220]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1moNBG-0REfL70; Sat, 20 Nov 2021 11:01:10 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:45090)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1moNBG-0005Jn-6R;
 Sat, 20 Nov 2021 11:01:10 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 11:01:08 +0100
Message-Id: <20211120100110.1940984-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1637402470-00001449-01014011/0/0 CLEAN NORMAL
X-TOI-MSGID: 4a2c45d8-ea06-4255-8c69-778a90c13689
Subject: [Buildroot] [PATCH/next 1/3] package/intel-gmmlib: bump version to
 21.3.3
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index cb4bd691c4..88f82a9596 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d26a6512a1b3ca604dabe035ddaf47b4b445bd503eac69a59e4acb2d1f54634b  intel-gmmlib-21.3.1.tar.gz
+sha256  77473df5440915e7c487a0f1c3f6236a8c29610528c6f0833da9caae834a1741  intel-gmmlib-21.3.3.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 5feda94308..2071d9f533 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 21.3.1
+INTEL_GMMLIB_VERSION = 21.3.3
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
