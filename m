Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A0FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:24:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D37261268
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D37261268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE255402C6;
	Sun, 19 Sep 2021 12:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8ZIWvf22Vcb; Sun, 19 Sep 2021 12:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 261164023D;
	Sun, 19 Sep 2021 12:24:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64CB61BF966
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54E9B606F6
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mgcFTtVq89Z2 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:23:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B8D9606EE
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:23:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 05B508B781; Sun, 19 Sep 2021 12:21:48 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 14:03:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70839f4d519ff0db5a0240c80a757386027735d7
X-Git-Newrev: 984a748b1626d565b94d936298d4573a081bb074
X-Patchwork-Hint: ignore
Message-Id: <20210919122148.05B508B781@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmdbx: bump version to 0.10.3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=984a748b1626d565b94d936298d4573a081bb074
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Leonid Yuriev <leo@yuriev.ru>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index c8a28ada34..7cc835a96a 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://github.com/erthink/libmdbx/releases/
-sha256  745555704df76626a6612ad0c6bc6b1a66bfab98b9245b07dfb82640aa46d6fa  libmdbx-amalgamated-0.10.2.tar.gz
+sha256  a8f2436c4d008886e044f568a22bda44329fb1c67f175d91a929ff8e2065340a  libmdbx-amalgamated-0.10.3.tar.gz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 60c5148625..76bd56dfd7 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.10.2
+LIBMDBX_VERSION = 0.10.3
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.gz
 LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
