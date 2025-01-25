Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF82C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 12:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E4534017C;
	Sat, 25 Jan 2025 12:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-LqS_9cqiVC; Sat, 25 Jan 2025 12:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07EA241548
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07EA241548;
	Sat, 25 Jan 2025 12:31:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DB8A941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95CA840438
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgLz_ekznTP3 for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 12:31:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9255B40294
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9255B40294
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:31:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73F5A862CD; Sat, 25 Jan 2025 12:31:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 13:24:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5b3795e92727c6565901cddf0c0f17c7854df56
X-Git-Newrev: 988ee0a73724f317e56db6ebb1688b7c746dc668
X-Patchwork-Hint: ignore
Message-Id: <20250125123137.73F5A862CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lzip: bump to version 1.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=988ee0a73724f317e56db6ebb1688b7c746dc668
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.nongnu.org/archive/html/lzip-bug/2025-01/msg00012.html

- Updated hash of the COPYING file (FSF's full name and address was added)

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lzip/lzip.hash | 6 +++---
 package/lzip/lzip.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index 7900835e11..ec8a86b29f 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,4 +1,4 @@
-# From https://lists.nongnu.org/archive/html/lzip-bug/2024-03/msg00003.html
-sha256  30c9cb6a0605f479c496c376eb629a48b0a1696d167e3c1e090c5defa481b162  lzip-1.24.1.tar.gz
+# From https://lists.nongnu.org/archive/html/lzip-bug/2025-01/msg00012.html
+sha256  09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668d0f346e3d3f0a56f  lzip-1.25.tar.gz
 # Locally calculated
-sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
+sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index c88be5680e..9c8c54a8b1 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZIP_VERSION = 1.24.1
+LZIP_VERSION = 1.25
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
