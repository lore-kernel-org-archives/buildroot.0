Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792B7CFA463
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B74440B26;
	Wed, 23 Oct 2024 20:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GH-0FbH5ki8A; Wed, 23 Oct 2024 20:08:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0709240B3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0709240B3B;
	Wed, 23 Oct 2024 20:08:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 413624960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CFFA40B3B
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j47Jwb2dJCZs for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F3F740B26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F3F740B26
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:08:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 185C7863F0; Wed, 23 Oct 2024 20:08:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:05:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93487f1566974d17630a432e2cc3db38b29c888d
X-Git-Newrev: 119fe4a3c0c3a98b7390d53ac517041bf7edb853
X-Patchwork-Hint: ignore
Message-Id: <20241023200815.185C7863F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iputils: bump version to 20240905
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=119fe4a3c0c3a98b7390d53ac517041bf7edb853
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update comment. This release includes pre-generated man pages & HTML
docs in dist tarballs [1], but we don't install them anyway (Buildroot
does not ship package docs).

For change log, see [2].

[1] https://github.com/iputils/iputils/commit/535f6de25909a63ea35750c8a37408e49c0d235c
[2] https://github.com/iputils/iputils/releases/tag/20240905

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iputils/iputils.hash | 4 ++--
 package/iputils/iputils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index a3e48d60a9..6baf433dcb 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,5 +1,5 @@
-# https://github.com/iputils/iputils/releases/download/20240117/sha256sums.asc
-sha256  7ed46e876e4157e1d20c40ec945e1ce0f3af3b10b5f6373e423135c6f22cd116  iputils-20240117.tar.gz
+# https://github.com/iputils/iputils/releases/download/20240905/sha256sums.asc
+sha256  599cda8e3f5f7ce4c612456ab1101369da8f79aa0f83c8e877290a1c7bb56010  iputils-20240905.tar.gz
 # Locally computed
 sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 08d849e69d..ec8c24e4e0 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPUTILS_VERSION = 20240117
+IPUTILS_VERSION = 20240905
 IPUTILS_SITE = https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
