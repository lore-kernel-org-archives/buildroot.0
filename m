Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649E9C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:40:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB7260C51
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EB7260C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0889B606B4;
	Sat,  4 Sep 2021 18:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QpGthvjIbiTm; Sat,  4 Sep 2021 18:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5918F6060D;
	Sat,  4 Sep 2021 18:40:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C6771BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9D074022D
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G4cCbNwGHoQQ for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C61B40238
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 731A98834A; Sat,  4 Sep 2021 18:23:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:32:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ceb79e472da6d1a1b66d36530cd40ae76ce05ec0
X-Git-Newrev: 43c19b1e39aa3f2db2c4d90b9c83861c93c400ff
X-Patchwork-Hint: ignore
Message-Id: <20210904182354.731A98834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xmrig: bump version to 6.14.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=43c19b1e39aa3f2db2c4d90b9c83861c93c400ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index c698670bc9..0af163de8a 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a6b5e7f3ca1dad6513e34a34cda81c4a1f1415fade87e8d7a4692fb10c77745c  xmrig-6.14.0.tar.gz
+sha256  5342632664a01efc7d512ce404f580d9ee380899afb144b4afc05c43e76cf446  xmrig-6.14.1.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index 28433f1376..d04a783254 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.14.0
+XMRIG_VERSION = 6.14.1
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
