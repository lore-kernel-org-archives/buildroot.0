Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D491C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 18:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F13EB82BEB;
	Wed, 27 Jul 2022 18:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F13EB82BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q-uARfRFz962; Wed, 27 Jul 2022 18:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16CAB82662;
	Wed, 27 Jul 2022 18:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16CAB82662
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D4C31BF39C
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FD2A826FB
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FD2A826FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zTpuaiWvslmn for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 18:13:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33C9E82662
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33C9E82662
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 18:13:10 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout05.t-online.de (Postfix) with SMTP id DC8741D6C2;
 Wed, 27 Jul 2022 20:13:07 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oGlWq-3Y7eK10; Wed, 27 Jul 2022 20:13:04 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:57490)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oGlWq-0002ht-19;
 Wed, 27 Jul 2022 20:13:04 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 20:13:01 +0200
Message-Id: <20220727181304.440002-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658945584-0144E3C8-3F0E452E/0/0 CLEAN NORMAL
X-TOI-MSGID: 2086f6ac-ae0c-44ad-8032-09f489595e8b
Subject: [Buildroot] [PATCH 1/4] package/libutp: bump version
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Follow transmission switching from branch post-3.3-transmission to
branch post-3.4-transmission:
https://github.com/transmission/transmission/commit/745adf8332b9686afa55407f9be20de21002a187

This branch contains a copyright year bump for the license file:
https://github.com/transmission/libutp/commit/365254427e5358a0c390aa5a60df5f449b9c0f00

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libutp/libutp.hash | 4 ++--
 package/libutp/libutp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libutp/libutp.hash b/package/libutp/libutp.hash
index 38d46b0ae5..f347dc3f2c 100644
--- a/package/libutp/libutp.hash
+++ b/package/libutp/libutp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c515e6f9add47d3d202389e8a62feb765f0ae41d6398cc238e44028be520774e  libutp-fda9f4b3db97ccb243fcbed2ce280eb4135d705b.tar.gz
-sha256  4441418beb8e352b6e2aa09083b4c51a86814a49878dbb1a81936b466cd5badd  LICENSE
+sha256  484f802d044f774fa5f669476ecdd9cb6110c383781c39adc03bbf6575090771  libutp-059c9449a104e440e4f913756a5f560dd4ae76a9.tar.gz
+sha256  73b400bf61dde52223dae1642205ca187f1a6b24a508dcce52bf386c27a0e58c  LICENSE
diff --git a/package/libutp/libutp.mk b/package/libutp/libutp.mk
index c926c290d2..394c1e9cb9 100644
--- a/package/libutp/libutp.mk
+++ b/package/libutp/libutp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUTP_VERSION = fda9f4b3db97ccb243fcbed2ce280eb4135d705b
+LIBUTP_VERSION = 059c9449a104e440e4f913756a5f560dd4ae76a9
 LIBUTP_SITE = $(call github,transmission,libutp,$(LIBUTP_VERSION))
 LIBUTP_LICENSE = MIT
 LIBUTP_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
