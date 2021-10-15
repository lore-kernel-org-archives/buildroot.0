Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6C2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 15:39:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D97E96105A
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 15:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D97E96105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8518404D7;
	Fri, 15 Oct 2021 15:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GsUd8Z5RsGUE; Fri, 15 Oct 2021 15:39:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F29C6404E0;
	Fri, 15 Oct 2021 15:39:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 703431BF378
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 15:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 609998277E
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 15:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wJpZzN0nV20f for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 15:39:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7961C8272D
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 15:39:52 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout06.t-online.de (Postfix) with SMTP id 24675114D4
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 17:39:49 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.199.253]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mbPJD-1UubYn0; Fri, 15 Oct 2021 17:39:47 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:35132)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mbPJD-0005PV-9E
 for buildroot@buildroot.org; Fri, 15 Oct 2021 17:39:47 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 17:39:47 +0200
Message-Id: <20211015153947.1371324-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1634312387-00001473-6A1BF64E/0/0 CLEAN NORMAL
X-TOI-MSGID: 63022028-9f8f-4e21-a3bd-4b0503ee3822
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.14.8
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
https://www.samba.org/samba/history/samba-4.14.8.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 5fb0760366..f33b61e262 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.14.7.tar.asc
-sha256  6f50353f9602aa20245eb18ceb00e7e5ec793df0974aebd5254c38f16d8f1906  samba-4.14.7.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.14.8.tar.asc
+sha256  c936b782c2aced8cd7299c13bec67c495fd4affdb217a6ed6150f4fd6d770fde  samba-4.14.8.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 3df80afd6b..3faeb88e09 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.14.7
+SAMBA4_VERSION = 4.14.8
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
