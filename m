Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D51EC77B7A
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 19:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6130614A4;
	Sat, 13 May 2023 19:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6130614A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W8mj7H3v-yqj; Sat, 13 May 2023 19:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16D0D60B6C;
	Sat, 13 May 2023 19:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16D0D60B6C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F6F91BF5B4
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38C2460B6C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38C2460B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AICOOyIjR44L for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 19:29:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E00E60B65
 for <buildroot@buildroot.org>; Sat, 13 May 2023 19:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E00E60B65
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D7FE86561; Sat, 13 May 2023 19:29:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 21:28:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ac4d34ef02cf80a3f0d6063996c0d871aedf1be
X-Git-Newrev: 9acc0c4e998dcb2bdacd8665b10e061cb01685d4
X-Patchwork-Hint: ignore
Message-Id: <20230513192915.4D7FE86561@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/granite: bump to version 6.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9acc0c4e998dcb2bdacd8665b10e061cb01685d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/granite/granite.hash | 2 +-
 package/granite/granite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/granite/granite.hash b/package/granite/granite.hash
index a91f468b49..7dfc008dcb 100644
--- a/package/granite/granite.hash
+++ b/package/granite/granite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c62d8d29e8bb59a5fa2d9006a9c13196aea9159410a7c86e3d51fa10d0f9dcc0  granite-6.0.0.tar.gz
+sha256  067d31445da9808a802fca523630c3e4b84d2d7c78ae547ced017cb7f3b9c6b5  granite-6.2.0.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/granite/granite.mk b/package/granite/granite.mk
index 71dfbf4c03..d5e6b9f47c 100644
--- a/package/granite/granite.mk
+++ b/package/granite/granite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRANITE_VERSION = 6.0.0
+GRANITE_VERSION = 6.2.0
 GRANITE_SITE = $(call github,elementary,granite,$(GRANITE_VERSION))
 GRANITE_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
