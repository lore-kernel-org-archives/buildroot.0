Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F57C61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 14:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62A1781F86;
	Mon,  9 Jun 2025 14:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSjzYnpLbKNL; Mon,  9 Jun 2025 14:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F698811E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F698811E6;
	Mon,  9 Jun 2025 14:58:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B3F91A4
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E53A7417D8
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBITz0ZBxNgx for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 14:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23325416F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23325416F0
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CEDD87BA5; Mon,  9 Jun 2025 14:58:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 16:53:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8cfd40ce72f5c004087d3a6e3d964f67e77161e
X-Git-Newrev: 34611327b8585178b7ff148b57397b4557e7455a
X-Patchwork-Hint: ignore
Message-Id: <20250609145847.1CEDD87BA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iputils: bump version 20250605
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

commit: https://git.buildroot.net/buildroot/commit/?id=34611327b8585178b7ff148b57397b4557e7455a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release:
https://github.com/iputils/iputils/releases/tag/20250605

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iputils/iputils.hash | 4 ++--
 package/iputils/iputils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index daa5f81a85..2f83d397ce 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,5 +1,5 @@
-# https://github.com/iputils/iputils/releases/download/20250602/sha256sums.asc
-sha256  178f316c3f102f7c7445dee8bb851838f11214a68b3d5d4788972d8b35dcbbe5  iputils-20250602.tar.gz
+# https://github.com/iputils/iputils/releases/download/20250605/sha256sums.asc
+sha256  475c643e5f55b302286267b97d3ce0f47ca3489ced8aa0401b1eeb1e68228d6b  iputils-20250605.tar.gz
 # Locally computed
 sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 391f0e1938..842fdb8478 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPUTILS_VERSION = 20250602
+IPUTILS_VERSION = 20250605
 IPUTILS_SITE = https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
