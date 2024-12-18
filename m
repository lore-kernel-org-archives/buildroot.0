Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB87E77188
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 19:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2E5A61410;
	Wed, 18 Dec 2024 19:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSBILoZ_bemn; Wed, 18 Dec 2024 19:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D05466143D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D05466143D;
	Wed, 18 Dec 2024 19:47:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76CA5CE
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6286041E58
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YxQ84O6KD1Is for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 19:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B546419BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B546419BC
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:47:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25771873E2; Wed, 18 Dec 2024 19:47:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 20:25:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edffcbcee95b3e25aca2d7a158311df609c8328d
X-Git-Newrev: b797b9e589c70bd69edfb78e214751e8c04eff62
X-Patchwork-Hint: ignore
Message-Id: <20241218194716.25771873E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erofs-utils: bump to version 1.8.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b797b9e589c70bd69edfb78e214751e8c04eff62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For a change log since 1.8.2, see:
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/ChangeLog?h=v1.8.3

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/erofs-utils/erofs-utils.hash | 2 +-
 package/erofs-utils/erofs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
index 573da1762d..3b8a5dc3da 100644
--- a/package/erofs-utils/erofs-utils.hash
+++ b/package/erofs-utils/erofs-utils.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  64b6ff7e899f62480283cee63787f37f0f9c4be7a6bc7a23d734aaa873a6cff4  erofs-utils-1.8.2.tar.gz
+sha256  3c5cc03603ea08ba9ae5e0420eeaea5ff17ed29e2280685310356cbf25304e85  erofs-utils-1.8.3.tar.gz
 sha256  0df042de29b44887355db86c79708a4489ce6e6666f6e33ad02040293f09e6a2  COPYING
 sha256  a400f85dd06d230f1b308cde4290a53f345b6e320a376b7904b31c51c2fd4b1a  LICENSES/Apache-2.0
 sha256  feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  LICENSES/GPL-2.0
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index 40349c309c..930b40f6f1 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EROFS_UTILS_VERSION = 1.8.2
+EROFS_UTILS_VERSION = 1.8.3
 EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
 EROFS_UTILS_LICENSE = GPL-2.0+, GPL-2.0+ or Apache-2.0 (liberofs)
 EROFS_UTILS_LICENSE_FILES = COPYING LICENSES/Apache-2.0 LICENSES/GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
