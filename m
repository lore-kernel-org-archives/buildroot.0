Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBB5C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFCDC61B22;
	Tue, 21 Feb 2023 01:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFCDC61B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75xMNleA5mvJ; Tue, 21 Feb 2023 01:11:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED73461B19;
	Tue, 21 Feb 2023 01:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED73461B19
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF5E71BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C6756FBBE
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C6756FBBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSB6cM9kUnrR for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3EEF6FBA1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3EEF6FBA1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDFF586496; Mon, 20 Feb 2023 20:52:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 Jan 2023 14:25:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f5d73033b8683df83d0ca9eb172b885d33a5ea64
X-Git-Newrev: 3621312a840306e38573c667459b5dee4db19531
X-Patchwork-Hint: ignore
Message-Id: <20230220205239.DDFF586496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libosmium: bump
 version to 2.19.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3621312a840306e38573c667459b5dee4db19531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release-notes: https://github.com/osmcode/libosmium/releases/tag/v2.19.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libosmium/libosmium.hash | 2 +-
 package/libosmium/libosmium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
index cb53a91c67..b055aa21ea 100644
--- a/package/libosmium/libosmium.hash
+++ b/package/libosmium/libosmium.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c05a3e95c9c811521ebad8637e90f43ab8fb053b310875acce741cc4c17d6f59  libosmium-2.18.0.tar.gz
+sha256  6911a8ca8e81d49205357177982df908af11376919f93b814cccf02f1d4d63e3  libosmium-2.19.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index f7ced04de3..2725130e72 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSMIUM_VERSION = 2.18.0
+LIBOSMIUM_VERSION = 2.19.0
 LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
 LIBOSMIUM_LICENSE = BSL-1.0
 LIBOSMIUM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
