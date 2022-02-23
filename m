Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ED5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 15:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FBAD82846;
	Wed, 23 Feb 2022 15:20:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lcHA3HJcVfQY; Wed, 23 Feb 2022 15:20:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85BA98282C;
	Wed, 23 Feb 2022 15:20:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55B0C1BF83B
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 15:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 441E88281A
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 15:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rkjnfJPEWtlr for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 15:20:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CC018282C
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 15:20:43 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout04.t-online.de (Postfix) with SMTP id 463688700;
 Wed, 23 Feb 2022 16:20:41 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.196.238]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nMtRY-2fXiT30; Wed, 23 Feb 2022 16:20:40 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:44820)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nMtRY-0001Qx-5u;
 Wed, 23 Feb 2022 16:20:40 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 16:20:39 +0100
Message-Id: <20220223152040.188210-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645629640-0000BD0E-A930E0D1/0/0 CLEAN NORMAL
X-TOI-MSGID: a81ee55a-127f-4bd2-b9fc-845e64bb28e2
Subject: [Buildroot] [PATCH/next 1/2] package/libva: bump version to 2.14.0
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

Release notes: https://github.com/intel/libva/releases/tag/2.14.0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.hash | 6 +++---
 package/libva/libva.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 7b66a7709d..4646a816bb 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases/download/2.13.0/libva-2.13.0.tar.bz2.sha1sum
-sha1  2adb2c023371dd68fe0d23e58afcf0b072b79828  libva-2.13.0.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.14.0/libva-2.14.0.tar.bz2.sha1sum
+sha1  36b482ec8c361a6c3a6198f4777409b136f2713c  libva-2.14.0.tar.bz2
 # Locally computed
-sha256  fad383f39f36115814bd0eda1496a4cc01761643bd962635400df2d4470ad460  libva-2.13.0.tar.bz2
+sha256  511e9a74d1ccfb548bc192290603082c11074ac59b17aadfd5d56a3f93e58454  libva-2.14.0.tar.bz2
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 6ac5386540..db1cfd29be 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.13.0
+LIBVA_VERSION = 2.14.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
