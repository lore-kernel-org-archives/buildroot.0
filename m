Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F64C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:47:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9EDA61B3B
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9EDA61B3B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DBD060704;
	Mon, 13 Sep 2021 13:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sGPkNN_0c5BR; Mon, 13 Sep 2021 13:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC200606CF;
	Mon, 13 Sep 2021 13:47:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E82B1BF378
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E7BC60701
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zi4QAM6cm2eb for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 13:43:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F04666070D
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 13:43:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 474778A56C; Mon, 13 Sep 2021 13:41:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 15:34:58 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: d803ab285f7b1bb48edab8540009c8d383094d22
X-Git-Newrev: a6f3c70a1750c8067ef6885dcae5a6014ae2e7f2
X-Patchwork-Hint: ignore
Message-Id: <20210913134145.474778A56C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/mc: bump to
 version 4.8.26
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6f3c70a1750c8067ef6885dcae5a6014ae2e7f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e648dfa6f7078a6fbbc5feb83292c6a98300fe8f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index 208d0beda4..63fbfa3213 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,4 +1,4 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.25.sha256
-sha256  ffc19617f20ebb23330acd3998b7fd559a042d172fa55746d53d246697b2548a  mc-4.8.25.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.26.sha256
+sha256  c6deadc50595f2d9a22dc6c299a9f28b393e358346ebf6ca444a8469dc166c27  mc-4.8.26.tar.xz
 # sha256 locally computed:
 sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 00f34f81cc..50dc50f65e 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.25
+MC_VERSION = 4.8.26
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
