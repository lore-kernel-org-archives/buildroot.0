Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8753C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E9A14EFB9;
	Fri, 28 Feb 2025 17:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbCdxH54O-al; Fri, 28 Feb 2025 17:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8D024F1F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8D024F1F3;
	Fri, 28 Feb 2025 17:06:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1299D711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DCDA42EBD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNNQA95UPKIN for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1827342ED8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1827342ED8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10CE787635; Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Jan 2025 00:30:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cd0ffd598cf94b9d15c489f2429602825a18753c
X-Git-Newrev: fbbfc35c2d0133cc9318348c74fbf1a1221ee454
X-Patchwork-Hint: ignore
Message-Id: <20250228163022.10CE787635@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/minisign: bump to
 version 0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbbfc35c2d0133cc9318348c74fbf1a1221ee454
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Upstream license changed to include 2025 in copyright years.

Changelog: https://github.com/jedisct1/minisign/releases/tag/0.12
Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/minisign/minisign.hash | 4 ++--
 package/minisign/minisign.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/minisign/minisign.hash b/package/minisign/minisign.hash
index 12cde42a43..e918891aa8 100644
--- a/package/minisign/minisign.hash
+++ b/package/minisign/minisign.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  74c2c78a1cd51a43a6c98f46a4eabefbc8668074ca9aa14115544276b663fc55  minisign-0.11.tar.gz
-sha256  d775d155cbf31638714c31c6f990f9fdc5f07998d91e42d1bf15483bd2d1706b  LICENSE
+sha256  796dce1376f9bcb1a19ece729c075c47054364355fe0c0c1ebe5104d508c7db0  minisign-0.12.tar.gz
+sha256  01aa50818d6609e85a9610b7d04da037e8b28bcf3bb5b5b4963c0c3f7abdabbd  LICENSE
diff --git a/package/minisign/minisign.mk b/package/minisign/minisign.mk
index 7cdce597f7..5cc8e14cba 100644
--- a/package/minisign/minisign.mk
+++ b/package/minisign/minisign.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINISIGN_VERSION = 0.11
+MINISIGN_VERSION = 0.12
 MINISIGN_SITE = $(call github,jedisct1,minisign,$(MINISIGN_VERSION))
 MINISIGN_LICENSE = ISC
 MINISIGN_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
