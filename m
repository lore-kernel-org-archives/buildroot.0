Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A662C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 17:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD8E381AA7;
	Tue,  5 Jul 2022 17:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD8E381AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-wB81YNNQls; Tue,  5 Jul 2022 17:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E467481A99;
	Tue,  5 Jul 2022 17:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E467481A99
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18AF11BF31C
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 17:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E86AB81A99
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 17:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E86AB81A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QWkx1ZHCwsZv for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 17:22:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD2CD81A8E
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD2CD81A8E
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 17:22:42 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout08.t-online.de (Postfix) with SMTP id D13324831
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 19:22:39 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.181.254]) by fwd70.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o8mFz-2M7ZIn0; Tue, 5 Jul 2022 19:22:39 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40108)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o8mFz-0003bo-6P
 for buildroot@buildroot.org; Tue, 05 Jul 2022 19:22:39 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue,  5 Jul 2022 19:22:39 +0200
Message-Id: <20220705172239.1272897-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1657041759-0143FF0B-FB5EFB2C/0/0 CLEAN NORMAL
X-TOI-MSGID: 89ce6716-1814-4cde-bea5-c76d0c8dfa9f
Subject: [Buildroot] [PATCH 1/1] package/bcg729: bump version to 1.1.1
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

Changelog:
https://github.com/BelledonneCommunications/bcg729/blob/master/CHANGELOG.md

Updated license to GPL-3.0+:
https://github.com/BelledonneCommunications/bcg729/commit/2c3ff1ae1af9b1571e3e8644c067965def39b747

License file was changed to LICENSE.txt:
https://github.com/BelledonneCommunications/bcg729/commit/089bb3454409d2cd630a6b3890a602b084e7ca89

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/bcg729/bcg729.hash | 4 ++--
 package/bcg729/bcg729.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/bcg729/bcg729.hash b/package/bcg729/bcg729.hash
index 4dbfbbbbb2..2eb80a0407 100644
--- a/package/bcg729/bcg729.hash
+++ b/package/bcg729/bcg729.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 94b3542a06cbd96306efc19f959f9febae62806a22599063f82a8c33e989d48b  bcg729-1.0.4.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  68599a850535d1b182932b3f86558ac8a76d4b899a548183b062956c5fdc916d  bcg729-1.1.1.tar.gz
+sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/bcg729/bcg729.mk b/package/bcg729/bcg729.mk
index 426cfd90af..f89e535546 100644
--- a/package/bcg729/bcg729.mk
+++ b/package/bcg729/bcg729.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-BCG729_VERSION = 1.0.4
+BCG729_VERSION = 1.1.1
 BCG729_SITE = $(call github,BelledonneCommunications,bcg729,$(BCG729_VERSION))
-BCG729_LICENSE = GPL-2.0+
-BCG729_LICENSE_FILES = COPYING
+BCG729_LICENSE = GPL-3.0+
+BCG729_LICENSE_FILES = LICENSE.txt
 BCG729_INSTALL_STAGING = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
