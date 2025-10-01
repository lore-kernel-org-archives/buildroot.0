Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683A4CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 19:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2026283FB3;
	Wed,  1 Oct 2025 19:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_LT5OP-eI2y; Wed,  1 Oct 2025 19:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38E1683FAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38E1683FAF;
	Wed,  1 Oct 2025 19:17:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 34FCB72
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B28841158
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSvYMA7Dm-sS for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 19:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F9FD41142
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F9FD41142
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:17:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E564866DF; Wed,  1 Oct 2025 19:17:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Oct 2025 21:03:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a43a66271283e783eaa879609efc614d491f8d3
X-Git-Newrev: cdb1407c0c6a9a7697e61419431cd4f1ccce08b8
X-Patchwork-Hint: ignore
Message-Id: <20251001191715.4E564866DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luaossl: bump to version 20250929
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

commit: https://git.buildroot.net/buildroot/commit/?id=cdb1407c0c6a9a7697e61419431cd4f1ccce08b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
-    2015-2019  Daurnimator <quae@daurnimator.com>
+    2015-2025  Daurnimator <quae@daurnimator.com>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/luaossl/luaossl.hash | 4 ++--
 package/luaossl/luaossl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index bf08fbd51e..734c916f5a 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  d711c86f433def90f63cb6747fe0bebaac604b868de6a9a35e4da2bb4e0967be  luaossl-20220711-0.src.rock
-sha256  7bd585fba3ae52943e0915e4c8ca049acde9f1e5cea101ef6b294427c8f0ee7d  luaossl-rel-20220711/LICENSE
+sha256  19cfc635dd804bde649a8db1ffae01e5fc0cdfac2630fb73c617fe6d8a0bfd30  luaossl-20250929-0.src.rock
+sha256  421c26c8788c46fd59e4dbfe5bf8eab6c21e37ce3ca8cb44dfff5dc179098756  luaossl-rel-20250929/LICENSE
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
index a6283a520e..079d1e0ca4 100644
--- a/package/luaossl/luaossl.mk
+++ b/package/luaossl/luaossl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAOSSL_VERSION_UPSTREAM = 20220711
+LUAOSSL_VERSION_UPSTREAM = 20250929
 LUAOSSL_VERSION = $(LUAOSSL_VERSION_UPSTREAM)-0
 LUAOSSL_SUBDIR = luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
 LUAOSSL_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
