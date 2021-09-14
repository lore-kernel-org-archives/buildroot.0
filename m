Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B3AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 06:15:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D4216112D
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 06:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D4216112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D01B580E16;
	Tue, 14 Sep 2021 06:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_JXQst1lR78; Tue, 14 Sep 2021 06:15:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50AD380E17;
	Tue, 14 Sep 2021 06:15:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16B1E1BF989
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 06:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2683607D9
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 06:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yps-4ICOT42a for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 06:14:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F803607C9
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 06:14:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 197B48AF42; Tue, 14 Sep 2021 06:13:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 08:14:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 495316758070f7859f974e0594928c5dbe6712de
X-Git-Newrev: 200e6b014254ccd97affe63e5a8ddb49d4728ffd
X-Patchwork-Hint: ignore
Message-Id: <20210914061300.197B48AF42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmaxminddb: bump to version 1.6.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=200e6b014254ccd97affe63e5a8ddb49d4728ffd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/maxmind/libmaxminddb/releases/tag/1.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmaxminddb/libmaxminddb.hash | 2 +-
 package/libmaxminddb/libmaxminddb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
index 4bdc05f34e..cfe838f7e5 100644
--- a/package/libmaxminddb/libmaxminddb.hash
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5237076d250a5f7c297e331c35a433eeaaf0dc205e070e4db353c9ba10f340a2  libmaxminddb-1.5.2.tar.gz
+sha256  7620ac187c591ce21bcd7bf352376a3c56a933e684558a1f6bef4bd4f3f98267  libmaxminddb-1.6.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index c022acf797..4037f89a15 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMAXMINDDB_VERSION = 1.5.2
+LIBMAXMINDDB_VERSION = 1.6.0
 LIBMAXMINDDB_SITE = \
 	https://github.com/maxmind/libmaxminddb/releases/download/$(LIBMAXMINDDB_VERSION)
 LIBMAXMINDDB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
