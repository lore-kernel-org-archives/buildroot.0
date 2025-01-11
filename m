Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115DBE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 12:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EAF483A42;
	Sat, 11 Jan 2025 12:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w06Enigv9ryp; Sat, 11 Jan 2025 12:44:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A95383A44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A95383A44;
	Sat, 11 Jan 2025 12:44:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1606942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 12:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F3546060B
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 12:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJQdhXM0dw6b for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 12:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC09A605FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC09A605FA
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 12:44:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5C2B842C1; Sat, 11 Jan 2025 12:44:38 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 13:33:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5894b2dd670d828e517198f570dc7946209a042
X-Git-Newrev: dd0010b0e02aafbf01315511764cac1da19d63ce
X-Patchwork-Hint: ignore
Message-Id: <20250111124438.A5C2B842C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lzip: bump to version 1.24.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd0010b0e02aafbf01315511764cac1da19d63ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes, since 1.23:
1.24: https://lists.nongnu.org/archive/html/lzip-bug/2024-01/msg00013.html
1.24.1: https://lists.nongnu.org/archive/html/lzip-bug/2024-03/msg00003.html

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
[Julien: add 1.24 release note in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lzip/lzip.hash | 4 ++--
 package/lzip/lzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index 48ee8175ca..7900835e11 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,4 +1,4 @@
-# From https://lists.nongnu.org/archive/html/lzip-bug/2022-02/msg00000.html
-sha256  4792c047ddf15ef29d55ba8e68a1a21e0cb7692d87ecdf7204419864582f280d  lzip-1.23.tar.gz
+# From https://lists.nongnu.org/archive/html/lzip-bug/2024-03/msg00003.html
+sha256  30c9cb6a0605f479c496c376eb629a48b0a1696d167e3c1e090c5defa481b162  lzip-1.24.1.tar.gz
 # Locally calculated
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 9e09e578db..c88be5680e 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZIP_VERSION = 1.23
+LZIP_VERSION = 1.24.1
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
