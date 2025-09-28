Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9900BCAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 10:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEB2140678;
	Sun, 28 Sep 2025 10:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcvmrVR2M5qn; Sun, 28 Sep 2025 10:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 567BB40677
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 567BB40677;
	Sun, 28 Sep 2025 10:22:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96BFF197
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C66C80DAA
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y287gRC0f9Ay for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 10:22:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA09280D73
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA09280D73
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:22:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96279865C5; Sun, 28 Sep 2025 10:22:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Sep 2025 12:21:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 546148d5ac76494623fdd0001be41c7fb3431d88
X-Git-Newrev: 56e4b433017280a6456aad9f3ca4179d541e9761
X-Patchwork-Hint: ignore
Message-Id: <20250928102219.96279865C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tig: bump to version 2.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=56e4b433017280a6456aad9f3ca4179d541e9761
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 2.5.12, see:
https://github.com/jonas/tig/releases/tag/tig-2.6.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tig/tig.hash | 4 ++--
 package/tig/tig.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tig/tig.hash b/package/tig/tig.hash
index 4329723f9e..e234a329be 100644
--- a/package/tig/tig.hash
+++ b/package/tig/tig.hash
@@ -1,6 +1,6 @@
 # From:
-# https://github.com/jonas/tig/releases/download/tig-2.5.12/tig-2.5.12.tar.gz.sha256
-sha256  5dda8a098810bb499096e17fc9f69c0a5915a23f46be27209fc8195d7a792108  tig-2.5.12.tar.gz
+# https://github.com/jonas/tig/releases/download/tig-2.6.0/tig-2.6.0.tar.gz.sha256
+sha256  99d4a0fdd3d93547ebacfe511195cb92e4f75b91644c06293c067f401addeb3e  tig-2.6.0.tar.gz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/tig/tig.mk b/package/tig/tig.mk
index 58084bc758..b6a7ddf9de 100644
--- a/package/tig/tig.mk
+++ b/package/tig/tig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIG_VERSION = 2.5.12
+TIG_VERSION = 2.6.0
 TIG_SITE = https://github.com/jonas/tig/releases/download/tig-$(TIG_VERSION)
 TIG_LICENSE = GPL-2.0+
 TIG_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
