Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D949C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 061BF84269;
	Thu,  9 Jun 2022 20:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l13dAElCNegO; Thu,  9 Jun 2022 20:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F0EF83689;
	Thu,  9 Jun 2022 20:44:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BEEDD1BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD9B441B8A
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A3Zxq-aau3fC for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:43:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F1CB41B52
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:43:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B601E86F1C; Thu,  9 Jun 2022 20:31:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:43:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da28867e875b165d83163ac7a618bd0f1c23345e
X-Git-Newrev: f3f441aea23dbf84fec85a9cef1aaf276c4484f0
X-Patchwork-Hint: ignore
Message-Id: <20220609203153.B601E86F1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ksmbd-tools: bump to version 3.4.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f3f441aea23dbf84fec85a9cef1aaf276c4484f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ksmbd-tools/ksmbd-tools.hash | 2 +-
 package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
index d146f36a0e..589128c189 100644
--- a/package/ksmbd-tools/ksmbd-tools.hash
+++ b/package/ksmbd-tools/ksmbd-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f42aec21515e34305bc07e1ce2c4926c87ea7bc8a675ca6d0a453f6b6be34e2b  ksmbd-tools-3.4.4.tar.gz
+sha256  c1b9096f37eddaced055dfc90a9ed06ceb9e8ceb608ed46c51ed5a2c901ddc81  ksmbd-tools-3.4.5.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
index b08845b581..e7f2bf91bc 100644
--- a/package/ksmbd-tools/ksmbd-tools.mk
+++ b/package/ksmbd-tools/ksmbd-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KSMBD_TOOLS_VERSION = 3.4.4
+KSMBD_TOOLS_VERSION = 3.4.5
 KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
 KSMBD_TOOLS_LICENSE = GPL-2.0+
 KSMBD_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
