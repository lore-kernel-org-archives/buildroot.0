Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287E6C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 09:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C35624019E;
	Sat,  8 Jan 2022 09:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDnDnsjRO5AV; Sat,  8 Jan 2022 09:17:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0A5B40124;
	Sat,  8 Jan 2022 09:17:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 921301BF343
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80F3F408C8
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLWYefB2VIsx for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 09:17:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F77340897
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 09:17:43 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout11.t-online.de (Postfix) with SMTP id CF7F1B744
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:17:40 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.177.158]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n67r1-1g1zAf0; Sat, 8 Jan 2022 10:17:39 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55026)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n67r1-0006CN-AC
 for buildroot@buildroot.org; Sat, 08 Jan 2022 10:17:39 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 10:17:39 +0100
Message-Id: <20220108091739.927609-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1641633459-0000B7AB-814993E2/0/0 CLEAN NORMAL
X-TOI-MSGID: 496fd402-9f6a-4e34-8cbd-59dc97edd693
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: bump version to 1.46.5
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
http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.46.5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 63c7c9929f..452c8d5689 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.46.3/sha256sums.asc
-sha256  b11042533c1b1dcf17512f0da48e05b0c573dada1dd8b762864d10f4dc399713  e2fsprogs-1.46.4.tar.xz
+# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.46.5/sha256sums.asc
+sha256  2f16c9176704cf645dc69d5b15ff704ae722d665df38b2ed3cfc249757d8d81e  e2fsprogs-1.46.5.tar.xz
 # Locally calculated
 sha256  5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256  032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 76215e8c34..cd70e3a034 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.46.4
+E2FSPROGS_VERSION = 1.46.5
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
