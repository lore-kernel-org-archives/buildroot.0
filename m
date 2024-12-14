Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5103AE7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 11:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDAD1607D6;
	Sat, 14 Dec 2024 11:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLRm0LnIkGqu; Sat, 14 Dec 2024 11:17:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE04661619
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE04661619;
	Sat, 14 Dec 2024 11:17:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAEBBCF
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A77D740128
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zVz_OFx4uIP for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 11:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 822D04021A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 822D04021A
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:17:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77B5D86F7F; Sat, 14 Dec 2024 11:17:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 11:58:12 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 76d7d1f1b97ddd115b96d810d8e55ca70f5fdedc
X-Git-Newrev: 27914e481db0aa199d275a932b9b1790b92bcf97
X-Patchwork-Hint: ignore
Message-Id: <20241214111740.77B5D86F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/wget: bump
 version to 1.24.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=27914e481db0aa199d275a932b9b1790b92bcf97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Release notes:
https://lists.gnu.org/archive/html/bug-wget/2024-03/msg00008.html

No versions between > 1.21.4 and < 1.24.5 were released:
https://lists.gnu.org/archive/html/bug-wget/2024-03/msg00012.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9beea334b769b187b9c0870895d4c3bc31758198)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.hash | 8 ++++----
 package/wget/wget.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 75c3a913dc..a0561d8d0a 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,8 +1,8 @@
-# From https://lists.gnu.org/archive/html/bug-wget/2023-05/msg00004.html
-sha1  42384273c1937458c9db3766a5509afa636a2f00  wget-1.21.4.tar.lz
+# From https://lists.gnu.org/archive/html/bug-wget/2024-03/msg00008.html
+sha1  01659f427c2e90c7c943805db69ea00f5da79b07  wget-1.24.5.tar.lz
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.21.4.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.24.5.tar.lz.sig
 # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
-sha256  3683619a5f50edcbccb1720a79006fa37bf9b9a255a8c5b48048bc3c7a874bd9  wget-1.21.4.tar.lz
+sha256  57a107151e4ef94fdf94affecfac598963f372f13293ed9c74032105390b36ee  wget-1.24.5.tar.lz
 # Locally calculated
 sha256  f7dc7522e7e1be9227f3dc8de8b39a4d1d2471968c893af15f00c1a2076a0eec  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index d2d3087961..d2a3a38e50 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.21.4
+WGET_VERSION = 1.24.5
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
