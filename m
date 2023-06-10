Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEFEC7EE29
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 16:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 839C94266C;
	Sat, 10 Jun 2023 16:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 839C94266C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rgg9oDkDvEeq; Sat, 10 Jun 2023 16:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 869E842667;
	Sat, 10 Jun 2023 16:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 869E842667
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59AF01BF32E
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 16:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 401A160F56
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 16:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 401A160F56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xu3QLiOFNmje for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 16:36:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C18660F53
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C18660F53
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 16:36:43 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout10.t-online.de (Postfix) with SMTP id 1620211886;
 Sat, 10 Jun 2023 18:36:42 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd83.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q81Zv-39ZLZR0; Sat, 10 Jun 2023 18:36:39 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:34322)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q81Zu-0000Qs-3D;
 Sat, 10 Jun 2023 18:36:39 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 18:36:38 +0200
Message-Id: <20230610163638.1019447-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686414999-86FF8480-53E51A64/0/0 CLEAN NORMAL
X-TOI-MSGID: 9e247036-be96-4bfd-8771-7fe4bad4cd39
Subject: [Buildroot] [PATCH 1/1] package/mcelog: bump version to 194
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/log/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mcelog/mcelog.hash | 2 +-
 package/mcelog/mcelog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
index 23fd4e50f3..a82d6f2ed2 100644
--- a/package/mcelog/mcelog.hash
+++ b/package/mcelog/mcelog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b3b2616acde7afba4752d4dc447a2c2ad5a75da65e7496e0da30f8f8d2015cfa  mcelog-191.tar.gz
+sha256  52ad2771a8dc8e30b44a52864620cf1be1fce81f9ae83c4652a9e2d010b1a533  mcelog-194.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index 9f7194e376..5cd00cc354 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MCELOG_VERSION = 191
+MCELOG_VERSION = 194
 MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
 MCELOG_LICENSE = GPL-2.0
 MCELOG_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
