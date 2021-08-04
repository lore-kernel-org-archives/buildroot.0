Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8827BC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:37:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5398860F0F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5398860F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 211D040482;
	Wed,  4 Aug 2021 12:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R4LQi0aTM9jR; Wed,  4 Aug 2021 12:37:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29BE34010B;
	Wed,  4 Aug 2021 12:37:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E24D1BF2A9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7BBE60A41
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PfI7WqK1wfUN for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 12:34:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BC3B608F5
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 12:34:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 187AA810A6; Wed,  4 Aug 2021 12:34:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 14:31:49 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 7e52c8e6254e57261c593fb47517ebaa30249937
X-Git-Newrev: 9d46c05d1d5a3b5bf14ae5e3c80cba565b935496
X-Patchwork-Hint: ignore
Message-Id: <20210804123439.187AA810A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/flannel: update
 project URL
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9d46c05d1d5a3b5bf14ae5e3c80cba565b935496
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Update flannel project URL.

  from: github.com/coreos/flannel
  to:   github.com/flannel-io/flannel

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2f6cd888f4d0befd179693bb4f6d7f5d50e7864b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flannel/Config.in  | 2 +-
 package/flannel/flannel.mk | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flannel/Config.in b/package/flannel/Config.in
index 326361080f..eb8d798f48 100644
--- a/package/flannel/Config.in
+++ b/package/flannel/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_FLANNEL
 	  Flannel is a virtual network that gives a subnet to each
 	  host for use with container runtimes.
 
-	  https://github.com/coreos/flannel
+	  https://github.com/flannel-io/flannel
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index 8aa960f086..a8a3c7a3cd 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -5,13 +5,13 @@
 ################################################################################
 
 FLANNEL_VERSION = 0.12.0
-FLANNEL_SITE = https://github.com/coreos/flannel/archive
+FLANNEL_SITE = https://github.com/flannel-io/flannel/archive
 FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
 
 FLANNEL_LICENSE = Apache-2.0
 FLANNEL_LICENSE_FILES = LICENSE
 
-FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION)
+FLANNEL_LDFLAGS = -X github.com/flannel-io/flannel/version.Version=$(FLANNEL_VERSION)
 
 # Install flannel to its well known location.
 define FLANNEL_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
