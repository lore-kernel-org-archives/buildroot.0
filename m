Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C640CAC586
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8700809F8;
	Mon,  8 Sep 2025 14:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQ-QQk__SZE6; Mon,  8 Sep 2025 14:18:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 751A3809E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 751A3809E8;
	Mon,  8 Sep 2025 14:18:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C2CC186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A2A34020B
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9g2MgFJR6e95 for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 726A040214
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 726A040214
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F48B80DA7; Mon,  8 Sep 2025 14:16:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Sep 2025 23:43:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27794637f54daf31d44fae5054e48cbc1f2bd915
X-Git-Newrev: ee10eff874a1ba2fb54ac9a9f40c59b34e81840e
X-Patchwork-Hint: ignore
Message-Id: <20250908141630.6F48B80DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/protozero: bump version to 1.8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ee10eff874a1ba2fb54ac9a9f40c59b34e81840e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release-notes: https://github.com/mapbox/protozero/releases/tag/v1.8.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/protozero/protozero.hash | 2 +-
 package/protozero/protozero.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/protozero/protozero.hash b/package/protozero/protozero.hash
index 217e18a7c9..917746af35 100644
--- a/package/protozero/protozero.hash
+++ b/package/protozero/protozero.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d95ca543fc42bd22b8c4bce1e6d691ce1711eda4b4910f7863449e6517fade6b  protozero-1.8.0.tar.gz
+sha256  6c7a896f1dc08435e8cd4f3780ff688cd0bfce6890599b755f6f3cb36398dc25  protozero-1.8.1.tar.gz
 sha256  254c0e9f18d261bfc55ff277cf12e3c1ca25839d56af17fba65d142396021466  LICENSE.md
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.from_folly
diff --git a/package/protozero/protozero.mk b/package/protozero/protozero.mk
index e5160d3f04..c5c4285955 100644
--- a/package/protozero/protozero.mk
+++ b/package/protozero/protozero.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOZERO_VERSION = 1.8.0
+PROTOZERO_VERSION = 1.8.1
 PROTOZERO_SITE = $(call github,mapbox,protozero,v$(PROTOZERO_VERSION))
 PROTOZERO_LICENSE = BSD-2-Clause, Apache-2.0
 PROTOZERO_LICENSE_FILES = LICENSE.md LICENSE.from_folly
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
