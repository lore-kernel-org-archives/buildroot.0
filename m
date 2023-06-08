Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C333C7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 19:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E14FC83F4B;
	Thu,  8 Jun 2023 19:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E14FC83F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEiLxv20VB9c; Thu,  8 Jun 2023 19:02:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C2FD83C79;
	Thu,  8 Jun 2023 19:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C2FD83C79
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7C331BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 19:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C951A42121
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 19:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C951A42121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Py8kUnPZM__I for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 19:02:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9456A42113
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9456A42113
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 19:02:37 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout08.t-online.de (Postfix) with SMTP id 6B7AD1A978;
 Thu,  8 Jun 2023 21:02:35 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd71.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7Ku2-0kJdjt0; Thu, 8 Jun 2023 21:02:34 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:34234)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7Ku2-0004G2-1a;
 Thu, 08 Jun 2023 21:02:34 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 21:02:34 +0200
Message-Id: <20230608190234.3523884-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686250954-4D3BE3BC-360BD649/0/0 CLEAN NORMAL
X-TOI-MSGID: 50b85e7a-d395-4244-8b93-7ef7aa32c531
Subject: [Buildroot] [PATCH 1/1] package/libfribidi: bump to version 1.0.13
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
Cc: Mikhail Boiko <mikhailboiko85@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/fribidi/fribidi/releases/tag/v1.0.13

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libfribidi/libfribidi.hash | 2 +-
 package/libfribidi/libfribidi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index 7e5df98112..9187112cee 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0cd233f97fc8c67bb3ac27ce8440def5d3ffacf516765b91c2cc654498293495  fribidi-1.0.12.tar.xz
+sha256  7fa16c80c81bd622f7b198d31356da139cc318a63fc7761217af4130903f54a2  fribidi-1.0.13.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index ec86f468a4..ba0859c93d 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 1.0.12
+LIBFRIBIDI_VERSION = 1.0.13
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
 LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
 LIBFRIBIDI_LICENSE = LGPL-2.1+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
