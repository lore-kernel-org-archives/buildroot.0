Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5A8C433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 16:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFD8D605A6;
	Sat, 29 Oct 2022 16:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFD8D605A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id guwTqGpQy2Ve; Sat, 29 Oct 2022 16:16:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2159060601;
	Sat, 29 Oct 2022 16:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2159060601
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24ACD1BF5DC
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D5F7404C8
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D5F7404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8J2dWZ2tPdkI for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 16:16:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE6374047C
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 16:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE6374047C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB01F8738D; Sat, 29 Oct 2022 16:16:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 18:15:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 098db8b4d5649345f983e7601d60a1fc30836e1d
X-Git-Newrev: 5f779a2071509dbb11e9bb8662e9ae4b33d39ce3
X-Patchwork-Hint: ignore
Message-Id: <20221029161619.BB01F8738D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bats-core: bump to version 1.8.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5f779a2071509dbb11e9bb8662e9ae4b33d39ce3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/bats-core/bats-core/releases/tag/v1.5.0
https://github.com/bats-core/bats-core/releases/tag/v1.6.0
https://github.com/bats-core/bats-core/releases/tag/v1.6.1
https://github.com/bats-core/bats-core/releases/tag/v1.7.0
https://github.com/bats-core/bats-core/releases/tag/v1.8.0
https://github.com/bats-core/bats-core/releases/tag/v1.8.1
https://github.com/bats-core/bats-core/releases/tag/v1.8.2

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bats-core/bats-core.hash | 2 +-
 package/bats-core/bats-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bats-core/bats-core.hash b/package/bats-core/bats-core.hash
index 369cc703d4..81c0229af4 100644
--- a/package/bats-core/bats-core.hash
+++ b/package/bats-core/bats-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  bff517da043ae24440ec8272039f396c2a7907076ac67693c0f18d4a17c08f7d  bats-core-1.4.1.tar.gz
+sha256  0f2df311a536e625a72bff64c838e67c7b5032e6ea9edcdf32758303062b2f3b  bats-core-1.8.2.tar.gz
 
 # License files
 sha256  55074b2b3b87809105034e1468e59076554d76a80c67bcc592000cc3d929852d  LICENSE.md
diff --git a/package/bats-core/bats-core.mk b/package/bats-core/bats-core.mk
index 181d4eb033..e172445930 100644
--- a/package/bats-core/bats-core.mk
+++ b/package/bats-core/bats-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATS_CORE_VERSION = 1.4.1
+BATS_CORE_VERSION = 1.8.2
 BATS_CORE_SITE = $(call github,bats-core,bats-core,v$(BATS_CORE_VERSION))
 BATS_CORE_LICENSE = MIT
 BATS_CORE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
