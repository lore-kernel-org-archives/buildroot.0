Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8526DECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 270E841B9A;
	Sun, 11 Sep 2022 09:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 270E841B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Ikg2-CAEXcI; Sun, 11 Sep 2022 09:16:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E810A41A62;
	Sun, 11 Sep 2022 09:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E810A41A62
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 518D91BF990
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA6666FB3B
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA6666FB3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3Fu9MmdQO43 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C75E06FB23
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C75E06FB23
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B6D0183620; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Sep 2022 09:39:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a8c013bb0f0d1be9eb8f1c169f9ee69a6389635
X-Git-Newrev: 2beb090ec81862da500dff31804f4d2436b388d3
X-Patchwork-Hint: ignore
Message-Id: <20220911084828.B6D0183620@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luasec: bump to version 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2beb090ec81862da500dff31804f4d2436b388d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change in license hash is due to version bump and copyright year udpate.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luasec/luasec.hash | 4 ++--
 package/luasec/luasec.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
index 1e381612bd..3c2b7d803b 100644
--- a/package/luasec/luasec.hash
+++ b/package/luasec/luasec.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  7ed5d08aad8f0e8659abb3f43c935da1c898474d4dc121e9edfbeae5c4c67fb0  luasec-1.0.2-1.src.rock
-sha256  84376baf33cefbcc1e9adbca23fcf87f51c1107956660cda2880feaef86d6075  luasec/LICENSE
+sha256  82d9ea7d11688a2b11fc1c4549a2e7b0aca00790b49e67a41dac0c81f2890f1c  luasec-1.2.0-1.src.rock
+sha256  bbf73e23eae7df57a4c4ff33bc23c41a2dc4f8707ba33235c2026d20b41405a7  luasec/LICENSE
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index 4ace94d168..c7f3a94d9a 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASEC_VERSION = 1.0.2-1
+LUASEC_VERSION = 1.2.0-1
 LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
