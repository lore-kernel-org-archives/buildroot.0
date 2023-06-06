Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153FFC77B7A
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 17:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EA6081747;
	Tue,  6 Jun 2023 17:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EA6081747
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MsRjjDFDzn2f; Tue,  6 Jun 2023 17:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50B8681498;
	Tue,  6 Jun 2023 17:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50B8681498
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 458E31BF292
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 17:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EF3A60C00
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 17:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EF3A60C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5KkbCthfIf2 for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 17:58:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3882160B8C
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3882160B8C
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 17:58:53 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout07.t-online.de (Postfix) with SMTP id 83CA5DCB0
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 19:58:50 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q6axG-1EfLPd0; Tue, 6 Jun 2023 19:58:50 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:57966)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q6axF-0004D7-2q
 for buildroot@buildroot.org; Tue, 06 Jun 2023 19:58:49 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue,  6 Jun 2023 19:58:49 +0200
Message-Id: <20230606175849.420138-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686074330-48E27266-A82D9B07/0/0 CLEAN NORMAL
X-TOI-MSGID: 774e6a4d-9578-4f82-b94b-66255d451865
Subject: [Buildroot] [PATCH/next 1/1] package/libva-utils: bump version to
 2.18.2
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-utils/libva-utils.hash | 2 +-
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 9b1d9cb210..3cde9cd284 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  724a54524d9156967d3508f294ce5c45d94cb8f7326537c24ee7fcf59e70de91  libva-utils-2.18.1.tar.gz
+sha256  c4c0555c96ca678f9ac47fbb56f0ae56ca39fd50fe3553bae5cb13117bfcb406  libva-utils-2.18.2.tar.gz
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 9e6ee3c878..38d46a08c9 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.18.1
+LIBVA_UTILS_VERSION = 2.18.2
 LIBVA_UTILS_SITE = $(call github,intel,libva-utils,$(LIBVA_UTILS_VERSION))
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
