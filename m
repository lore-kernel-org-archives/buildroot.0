Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F35C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CA1A424E5;
	Fri, 28 Feb 2025 16:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUsvAGEM3CkX; Fri, 28 Feb 2025 16:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D9994F336
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D9994F336;
	Fri, 28 Feb 2025 16:37:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 142BE711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59426424EB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRvk_lBTRc3X for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2716642479
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2716642479
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23813844AB; Fri, 28 Feb 2025 16:29:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 12:27:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f2355c6702d91eb1d5c428d2c8d204922e101ee9
X-Git-Newrev: 295b2c4f8ecaf0b6e03725a6c8412795e91888c8
X-Patchwork-Hint: ignore
Message-Id: <20250228162938.23813844AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wget: bump version to
 1.25.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=295b2c4f8ecaf0b6e03725a6c8412795e91888c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.gnu.org/archive/html/bug-wget/2024-11/msg00002.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.hash | 8 ++++----
 package/wget/wget.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index a0561d8d0a..da71b49d09 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,8 +1,8 @@
-# From https://lists.gnu.org/archive/html/bug-wget/2024-03/msg00008.html
-sha1  01659f427c2e90c7c943805db69ea00f5da79b07  wget-1.24.5.tar.lz
+# From https://lists.gnu.org/archive/html/bug-wget/2024-11/msg00002.html
+sha1  ca79e61fbf1d32133f60ef7c7d476b250b6da423  wget-1.25.0.tar.lz
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.24.5.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.25.0.tar.lz.sig
 # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
-sha256  57a107151e4ef94fdf94affecfac598963f372f13293ed9c74032105390b36ee  wget-1.24.5.tar.lz
+sha256  19225cc756b0a088fc81148dc6a40a0c8f329af7fd8483f1c7b2fe50f4e08a1f  wget-1.25.0.tar.lz
 # Locally calculated
 sha256  f7dc7522e7e1be9227f3dc8de8b39a4d1d2471968c893af15f00c1a2076a0eec  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index d2a3a38e50..e3143647d7 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.24.5
+WGET_VERSION = 1.25.0
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
