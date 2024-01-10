Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93B0C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5742A400C1;
	Wed, 10 Jan 2024 20:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5742A400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQCJm6ymea_n; Wed, 10 Jan 2024 20:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38C4B43779;
	Wed, 10 Jan 2024 20:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38C4B43779
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 197581BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 324CC436D7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 324CC436D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ogEi8M1hnoHL for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9303436EF
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9303436EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA2CE85CBF; Wed, 10 Jan 2024 20:16:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 20:46:49 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: fdc95ef0781b6ccb07b61418fef80950d8e1a0b4
X-Git-Newrev: 5455abbcc8e092958a93c673480f62130c761550
X-Patchwork-Hint: ignore
Message-Id: <20240110201651.CA2CE85CBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/minizip: bump to
 version 4.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=5455abbcc8e092958a93c673480f62130c761550
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

https://github.com/zlib-ng/minizip-ng/releases/tag/4.0.3
https://github.com/zlib-ng/minizip-ng/releases/tag/4.0.2
https://github.com/zlib-ng/minizip-ng/compare/4.0.1...4.0.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit af5da8f1292bc9839df4ab52ce8d8a64bc8c5f2b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minizip/minizip.hash | 2 +-
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index 5e00881ce3..b21a8490aa 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  63e47a2b4dbac0da501f43f4da74f118dfb3ef0dee0ffbbe89428271002260f8  minizip-4.0.1.tar.gz
+sha256  e39a736d4f55c22fa548e68225b2e92bc22aedd9ab90d002b0c5851e3a7bdace  minizip-4.0.3.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index d3e539d0e9..5a4d920369 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 4.0.1
+MINIZIP_VERSION = 4.0.3
 MINIZIP_SITE = $(call github,zlib-ng,minizip-ng,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
